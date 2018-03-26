import System.Process
import Data.List.Split
import Data.List

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

openAllTrans :: String -> [String] -> IO [IO String]
openAllTrans dir ts = return (map (\x -> openTrans dir x) ts)

--END FILE IO AND SYSTEM CALLS

--TRANSITION CODE

filterForState :: String -> [String] -> IO [String]
filterForState state trans = return (filter (\x -> hasState x state) trans)

getTransitionsForState :: String -> String -> IO [String]
getTransitionsForState state dir = getAllTransitionFiles dir >>= (filterForState state) 

seperateTransitions :: String -> IO [String]
seperateTransitions files = return (filter hasTransitionInFileName (lines files))

getTransCodeForState :: String -> String -> IO [IO String]
getTransCodeForState dir state = getTransitionsForState state dir >>= openAllTrans dir

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
setTargetState state = "targetState <= " ++ state ++ ";"

transitionToVhdl :: Int -> Int -> String -> String
transitionToVhdl n m s
    | n > m            = error "n cannot be greater than m in transitionToVhdl"
    | n == 0 && n == m = "if (t" ++ (show n) ++ "):" ++ (beautify 1 $ setTargetState s) ++ "end if;" 
    | n == 0           = "if (t" ++ (show n) ++ "):" ++ (beautify 1 $ setTargetState s)
    | n == m           = "elseif (t" ++ (show n) ++ "):" ++ (beautify 1 $ setTargetState s) ++ "end if;"
    | otherwise        = "elseif (t" ++ (show n) ++ "):" ++ (beautify 1 $ setTargetState s)

createTransitionCode :: [String] -> [String] -> IO String
createTransitionCode trans states = createCode trans states 0 ((length trans) - 1) ((createTransitionInitialCode trans) ++ "\n")
    where
        createCode :: [String] -> [String] -> Int -> Int -> String -> IO String
        createCode ts ss n m carry
            | n > m     = return carry
            | otherwise = createCode ts ss (n+1) m (carry ++ (transitionToVhdl n m (ss!!n)))

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



--END VHDL CODE

--CONVENIENCE CODE

mapTuple :: (a -> IO b) -> (IO a, IO a, IO a, IO a, IO a) -> (IO b, IO b, IO b, IO b, IO b)
mapTuple f (a0, a1, a2, a3, a4) = (a0 >>= f, a1 >>= f, a2 >>= f, a3 >>= f, a4 >>= f)

decToBin :: Int -> String
decToBin num = sanitiseBin $ calcBin (numberOfBits num) num ""
    where
        calcBin :: Int -> Int -> String -> String
        calcBin ind n carry | ind < 0      = carry
                            | n >= (2^ind) = calcBin (ind-1) (n - (2^ind)) (carry ++ "1")
                            | otherwise    = calcBin (ind-1) n (carry ++ "0")

sanitiseBin :: String -> String
sanitiseBin bin | length bin == 1 = bin
                | head bin == '0' = sanitiseBin (tail bin)
                | otherwise       = bin

--END CONVENIENCE CODE
