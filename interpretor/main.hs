import System.Process
import Data.List.Split
import Data.List
import Data.Char

main :: IO ()
main = do
    dir <- getLine
    states <- getAllStates dir
    internals <- getAllInternals dir states
    transitions <- getAllTransCodeForAllStates dir states
    numberOfTargets <- return $ getNumberOfTargets states transitions
    targets <- getAllTargets dir states numberOfTargets
    targetStates <- return $ allTargetsToState states targets
    stateBitSize <- getNumberOfBits dir
    projectName <- return $ getProjectName dir
    architecture <- return $ createArchitecture states internals transitions targetStates stateBitSize projectName
    variables <- getVariables dir projectName
    entity <- return $ createEntity projectName variables
    writeFile "test.txt" (entity ++ "\n\n" ++ architecture)

    

collectInternals :: String -> String -> (IO String, IO String, IO String, IO String)
collectInternals state dir = (return state, getOnEntry dir state, getInternal dir state, getOnExit dir state)

--STRING FORMATING

infixl 2 +\>
(+\>) :: String -> String -> String
str1 +\> str2 = str1 ++ "\n" ++ str2

isCharWhitespace :: Char -> Bool
isCharWhitespace c = case c of
    ' '      -> True
    '\n'     -> True
    '\t'     -> True
    '\r'     -> True
    '\0'     -> True
    chr      -> False

isWhitespace :: String -> Bool
isWhitespace str | str == "" = True
                 | otherwise = foldl (&&) True (map isCharWhitespace str)

removeWhitespace :: String -> String
removeWhitespace str = filter (\x -> not $ isCharWhitespace x) str

trim :: String -> String
trim cs | isWhitespace cs            = ""
        | isCharWhitespace (head cs) = trim $ tail cs
        | isCharWhitespace (last cs) = trim $ init cs
        | otherwise                  = cs

ioTrim :: String -> IO String
ioTrim str = return (trim str)

beautifyLine :: Int -> String -> String
beautifyLine n str | n <= 0    = str
                   | otherwise = beautifyLine (n-1) (tab ++ str)

beautify :: Int -> String -> String
beautify n str = foldl (\x y -> x ++ "\n" ++ y)  "" (map (\x -> beautifyLine n x) (lines str)) ++ "\n"

tab :: String
tab = "    "

getProjectName :: String -> String
getProjectName dir = head (splitOn ".machine" (last (filter (\x -> x /= "") (splitOn "/" dir))))

hasTransitionInFileName :: String -> Bool
hasTransitionInFileName file = length (filter (\x -> x == "Transition") (splitOn "_" file)) > 0

--END STRING FORMATTING

--STATE CODE

getStates :: String -> [String]
getStates str = filter (\x -> not $ isWhitespace x) (map removeWhitespace (lines str))

ioGetStates :: String -> IO [String]
ioGetStates str = return (getStates str)

getStateNameFromTransition :: String -> String
getStateNameFromTransition str = head (splitOn "_Transition" $ foldl (++) "" (splitOn "State_" str))

hasState :: String -> String -> Bool
hasState str state = state == getStateNameFromTransition str

getAllStates :: String -> IO [String]
getAllStates dir = getFileContents (dir ++ "/States") >>= ioGetStates

getInternalStates :: String -> String -> String -> IO String
getInternalStates dir state intState = getFileContents (dir ++ "/State_" ++ state ++ "_" ++ intState ++ ".mm")

getOnEntry :: String -> String -> IO String
getOnEntry dir state = getInternalStates dir state "OnEntry"

getOnExit :: String -> String -> IO String
getOnExit dir state = getInternalStates dir state "OnExit"

getInternal :: String -> String -> IO String
getInternal dir state = getInternalStates dir state "Internal"

getInternals :: String -> String -> IO [String]
getInternals dir state =  sequence ([getOnEntry dir state, getInternal dir state, getOnExit dir state])

getAllInternals :: String -> [String] -> IO [[String]]
getAllInternals dir states = sequence $ map (getInternals dir) states

--END STATE CODE

--FILE IO AND SYSTEM CALLS

getFileContents :: String -> IO String
getFileContents path = readFile path >>= ioTrim

callLs :: String -> IO String
callLs dir = readProcess ("ls") [dir] ""

getAllTransitionFiles :: String -> IO [String]
getAllTransitionFiles dir = callLs dir >>= seperateTransitions 

openTrans :: String -> String -> IO String
openTrans dir t = getFileContents (dir ++ "/" ++ t)

openAllTrans :: String -> [String] -> IO [String]
openAllTrans dir ts = sequence (map (\x -> openTrans dir x) ts)

getVariables :: String -> String -> IO String
getVariables dir name = getFileContents (dir ++ "/" ++ name ++ "_Variables.h")

--END FILE IO AND SYSTEM CALLS

--TRANSITION CODE

filterForState :: String -> [String] -> IO [String]
filterForState state trans = return (filter (\x -> hasState x state) trans)

getTransitionsForState :: String -> String -> IO [String]
getTransitionsForState state dir = getAllTransitionFiles dir >>= (filterForState state) 

seperateTransitions :: String -> IO [String]
seperateTransitions files = return (filter hasTransitionInFileName (lines files))

getTransCodeForState :: String -> String -> IO [String]
getTransCodeForState dir state = getTransitionsForState state dir >>= openAllTrans dir

getAllTransCodeForAllStates :: String -> [String] -> IO [[String]]
getAllTransCodeForAllStates dir states = sequence $ map (getTransCodeForState dir) states

getTargetTransitionLine :: Int -> String -> String 
getTargetTransitionLine n contents =
    (lines (splitOn "}" (splitOn "{" ((splitOn ("class Transition_" ++ (show n)) contents)!!1)!!1)!!0))!!2

getTargetTransition :: Int -> String -> IO Int
getTargetTransition n contents = case (trim ((splitOn ")" ((splitOn "= " (getTargetTransitionLine n contents))!!1))!!0)) of
    x : [] -> return $ digitToInt x
    _      -> error "Failed to get target transition" 

readTargetTransition :: Int -> String -> IO Int
readTargetTransition n file = getFileContents file >>= getTargetTransition n

getTargetsForState :: String -> String -> Int -> IO [Int]
getTargetsForState dir state n
    | n == 0    = return []
    | otherwise = sequence $ map (\x -> readTargetTransition x (dir ++ "/State_" ++ state ++".h")) [0..(n-1)]

getAllTargets :: String -> [String] -> [Int] -> IO [[Int]]
getAllTargets dir states ns =
    sequence $ map (\x -> (getTargetsForState dir (states!!x) (ns!!x))) [0..((length states) - 1)]

targetToState :: [String] -> [Int] -> [String]
targetToState states targets = map (\x -> states!!x) targets

allTargetsToState :: [String] -> [[Int]] -> [[String]]
allTargetsToState states targets = map (\x -> targetToState states (targets!!x)) [0..((length states) - 1)]

getNumberOfTargets :: [String] -> [[String]] -> [Int]
getNumberOfTargets states transitions = map (\x -> length (transitions!!x)) [0..((length states) - 1)]

--END TRANSITION CODE

-- VHDL CODE

createVarDecForTransition :: String -> Int -> String
createVarDecForTransition condition n
    | n == 0    = "t" ++ (show n) ++ " = " ++ condition ++ ";"
    | otherwise = "t" ++ (show n) ++ " = " ++ condition ++ " and not t" ++  (show (n-1)) ++ ";"

createTransitionInitialCode :: [String] -> String
createTransitionInitialCode trans = trim (calc trans 0 "")
    where
        calc :: [String] -> Int -> String -> String
        calc ts n carry | n == length ts = carry
                        | otherwise      = calc ts (n+1) (carry +\> createVarDecForTransition (ts!!n) n)

numberOfBits :: Int -> Int
numberOfBits num = calc num 0
    where
        calc :: Int -> Int -> Int
        calc num n | num == 1  = 1
                   | num < 0   = error "Number must be positive"
                   | num > 2^n = calc num (n+1)
                   | otherwise = n

setTargetState :: String -> String
setTargetState state = "targetState <= " ++ state ++ ";\ninternalState <= OnExit;"

transitionToVhdl :: Int -> Int -> String -> String
transitionToVhdl n m s
    | n > m            = error "n cannot be greater than m in transitionToVhdl"
    | n == 0 && n == m = "if (t" ++ (show n) ++ ") then"
        ++ (beautify 1 $ setTargetState s) ++ "else\n    internalState <= Internal;\nend if;" 
    | n == 0           = "if (t" ++ (show n) ++ ") then" ++ (beautify 1 $ setTargetState s)
    | n == m           = "elseif (t" ++ (show n) ++ ") then"
        ++ (beautify 1 $ setTargetState s) ++ "else\n    internalState <= Internal;\nend if;"
    | otherwise        = "elseif (t" ++ (show n) ++ ") then" ++ (beautify 1 $ setTargetState s)

createTransitionCode :: [String] -> [String] -> String
createTransitionCode trans states
    | trans == [] = "internalState <= Internal;"
    | otherwise   = createCode trans states 0 ((length trans) - 1) ((createTransitionInitialCode trans) ++ "\n")
        where
            createCode :: [String] -> [String] -> Int -> Int -> String -> String
            createCode ts ss n m carry
                | n > m     = carry
                | otherwise = createCode ts ss (n+1) m (carry ++ (transitionToVhdl n m (ss!!n)))

createSingleTransitionCode :: String -> [String] -> [String] -> String
createSingleTransitionCode state transitions targetStates =
    beautify 1 ("when " ++ state ++ " =>" ++ (beautify 2 (createTransitionCode transitions targetStates)))

joinTransitionBlocks :: [String] -> [[String]] -> [[String]] -> String
joinTransitionBlocks states trans targets =
    "    case currentState is"
    ++ beautify 1 (foldl (++) "" $ map (\x -> createSingleTransitionCode (states!!x) (trans!!x) (targets!!x)) [0..((length states) - 1)])
    ++ "    end case;"

createAllTransitionsCode :: [String] -> [[String]] -> [[String]] -> String
createAllTransitionsCode states trans targets = "case internalState is\n    when CheckTransition =>"
    ++ beautify 1 (joinTransitionBlocks states trans targets)
    ++ "end case;\n"

internalStateVhdl :: String
internalStateVhdl =
    "--Internal State Representation Bits\n"
    ++ "constant OnEntry: std_logic_vector(1 downto 0) := \"00\";\n"
    ++ "constant CheckTransition: std_logic_vector(1 downto 0) := \"01\";\n"
    ++ "constant OnExit: std_logic_vector(1 downto 0) := \"10\";\n"
    ++ "constant Internal: std_logic_vector(1 downto 0) := \"11\";\n"
    ++ "signal internalState: std_logic_vector(1 downto 0) := OnEntry;\n"

getNumberOfBits :: String -> IO Int
getNumberOfBits dir = getAllStates dir >>= (\x -> return (length x)) >>= (\y -> return (numberOfBits y)) 

createCurrentState :: String -> Int -> String
createCurrentState firstState bits =
    "signal currentState: std_logic_vector(" ++ (show (bits - 1)) ++ " downto 0) := " ++ firstState ++ ";\n"

createTargetState :: Int -> String
createTargetState bits = "signal targetState: std_logic_vector(" ++ (show (bits - 1)) ++ " downto 0);\n"


createState :: Int -> String -> String -> String
createState size bin state = "constant " ++ state ++ ": std_logic_vector(" ++ (show (size - 1)) ++ " downto 0) := \"" ++ bin ++ "\";\n"

createAllStates :: Int -> [String] -> [String] -> String
createAllStates size bins states = foldl (++) "" $ map (\x -> createState size (bins!!x) (states!!x)) [0..((length states) - 1)]

getBins :: [String] -> [String]
getBins states = map (\x -> decToBin (numberOfBits (length states)) x) [0..((length states) - 1)]

createArchitectureVariables :: Int -> [String] -> String
createArchitectureVariables size states = internalStateVhdl
    ++ createAllStates (numberOfBits $ length states) (getBins states) states
    ++ (createCurrentState (states!!0) (numberOfBits (length states)))
    ++ createTargetState (numberOfBits $ length states)

createStateCode :: String -> String -> String -> String
createStateCode state code appendedCode = "when " ++ state ++ " =>" ++ (beautify 1 (code +\> appendedCode));

createOnEntry :: String -> String
createOnEntry code = createStateCode "OnEntry" code "internalState <= CheckTransition;"

createInternal :: String -> String
createInternal code = createStateCode "Internal" code "internalState <= CheckTransition;"

createOnExit :: String -> String
createOnExit code = createStateCode "OnExit" code "internalState <= OnEntry;\ncurrentState <= targetState;"

createSingleState :: String -> [String] -> String
createSingleState state code = "\n    when " ++ state ++ " =>\n        case internalState is"
    ++ (beautify 3 (createOnEntry (code!!0) ++ createInternal (code!!1) ++ createOnExit (code!!2)))
    ++ "        end case;\n" 

createAllStateCode :: [String] -> [[String]] -> String
createAllStateCode states codes = 
    beautify 1 (
        foldl (++) ""
            $ map 
                (\x -> createSingleState (states!!x) (codes!!x))
                [0..((length states) - 1)]
        )



createRisingEdge :: [String] -> [[String]] -> String
createRisingEdge states codes = "if (rising_edge(clk50)) then"
    ++ beautify 1 "case currentState is"
    ++ createAllStateCode states codes
    ++ "    end case;\nend if;"

createFallingEdge :: [String] -> [[String]] -> [[String]] -> String
createFallingEdge states trans targets = "if (falling_edge(clk50)) then"
    ++ beautify 1 (createAllTransitionsCode states trans targets)
    ++ "end if;"

createProcessBlock :: [String] -> [[String]] -> [[String]] -> [[String]] -> String
createProcessBlock states risingEdge transitions targets = "process (clk50)\n    begin"
    ++ beautify 2 (createRisingEdge states risingEdge)
    ++ beautify 2 (createFallingEdge states transitions targets)
    ++ "    end process;"


createArchitecture :: [String] -> [[String]] -> [[String]] -> [[String]] -> Int -> String -> String
createArchitecture states risingEdgeCode transitions targets size name = 
    "architecture Behavioural of " ++ name ++ " is"
    ++ beautify 1 (createArchitectureVariables size states)
    ++ "begin\n"
    ++ createProcessBlock states risingEdgeCode transitions targets
    ++ "\nend Behavioural;"

isComment :: String -> Bool
isComment str | length (trim str) < 2 = False
              | otherwise             = (trim str)!!0 == '/' && (trim str)!!1 == '/'

filterOutComments :: String -> String
filterOutComments str = trim (foldl (+\>) "" (filter (\x -> not $ isComment x) (lines str)))

removeTrailingComment :: String -> String
removeTrailingComment str = trim ((splitOn "///<" str)!!0)

removeAllTrailingComments :: String -> String
removeAllTrailingComments str = trim (foldl (+\>) "" (map removeTrailingComment (lines str)))

createEntity :: String -> String -> String
createEntity name vars = "entity " ++ name ++ " is"
    ++ beautify 1 (removeAllTrailingComments $ filterOutComments vars)
    ++ "end " ++ name ++ ";"


--END VHDL CODE

--CONVENIENCE CODE

decToBin :: Int -> Int -> String
decToBin size num = sanitiseBin size $ calcBin size num ""
    where
        calcBin :: Int -> Int -> String -> String
        calcBin ind n carry | ind < 0      = carry
                            | n >= (2^ind) = calcBin (ind-1) (n - (2^ind)) (carry ++ "1")
                            | otherwise    = calcBin (ind-1) n (carry ++ "0")

sanitiseBin :: Int -> String -> String
sanitiseBin size bin | length bin > size && head bin == '0' = sanitiseBin size (tail bin)
                     | otherwise                            = bin

--END CONVENIENCE CODE
