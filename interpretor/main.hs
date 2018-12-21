import System.Process
import Data.List.Split
import Data.List
import Data.Char
import System.Environment
import System.Directory

main :: IO ()
main = do
    args <- getArgs
    dir <- return $ if last (head args) == '/' then init (head args) else head args
    states <- getAllStates dir
    hasInitialPseudostate states
    internals <- getAllInternals dir states
    transitions <- getAllTransCodeForAllStates dir states
    numberOfTargets <- return $ getNumberOfTargets states transitions
    targets <- getAllTargets dir states numberOfTargets
    targetStates <- return $ allTargetsToState states targets
    stateBitSize <- getNumberOfBits dir
    projectName <- return $ getProjectName dir
    variables <- getVariables dir projectName
    architecture <- return $ createArchitecture states internals transitions targetStates stateBitSize projectName variables
    includes <- getIncludes dir projectName
    entity <- return $ createEntity includes projectName variables
    homeDir <- getHomeDirectory
    writeFile (projectName ++ ".vhd") (entity ++ "\n\n" ++ architecture)


--STRING FORMATING

hasInitialPseudostate :: [String] -> IO Bool
hasInitialPseudostate states | length (filter (\x -> x == initialPseudostate) states) /= 1 = error ("No " ++ initialPseudostate)
                             | otherwise = return True

--Operator to concatenate strings with a new line in between them
infixl 2 +\>
(+\>) :: String -> String -> String
str1 +\> str2 | str1 == "" = str2
              | otherwise  = str1 ++ "\n" ++ str2

--Operator to concatenate strings with a space in between them
infixl 2 ++>
(++>) :: String -> String -> String
str1 ++> str2 | str1 == ""                                       = str2
              | length str1 == 1 && isCharWhitespace (head str1) = str1 ++ str2
              | otherwise                                        = str1 ++ " " ++ str2

--Determins if a character is whitespace
isCharWhitespace :: Char -> Bool
isCharWhitespace c = case c of
    ' '      -> True
    '\n'     -> True
    '\t'     -> True
    '\r'     -> True
    '\0'     -> True
    chr      -> False

--Determins if the string is entirely whitespace
isWhitespace :: String -> Bool
isWhitespace str | str == "" = True
                 | otherwise = foldl (&&) True (map isCharWhitespace str)

--Removes whitespace from a string
removeWhitespace :: String -> String
removeWhitespace str = filter (\x -> not $ isCharWhitespace x) str

--Removes whitespace from the front and end of a string
trim :: String -> String
trim cs | isWhitespace cs            = ""
        | isCharWhitespace (head cs) = trim $ tail cs
        | isCharWhitespace (last cs) = trim $ init cs
        | otherwise                  = cs

--Trim that returns an IO String
ioTrim :: String -> IO String
ioTrim str = return (trim str)

--Adds n number of tabs (4 space) to a string that doesn't contain new lines.
beautifyLine :: Int -> String -> String
beautifyLine n str | n <= 0    = str
                   | otherwise = beautifyLine (n-1) (tab ++ str)

--Adds n number of tabs to a string for each line.
beautify :: Int -> String -> String
beautify n str = foldl (\x y -> x ++ "\n" ++ y)  "" (map (\x -> beautifyLine n x) (lines str)) ++ "\n"

--A tab is defined as 4 spaces
tab :: String
tab = "    "

initialPseudostate :: String
initialPseudostate = "InitialPseudoState"

--Gets project name by inspecting the folder structure
getProjectName :: String -> String
getProjectName dir = head (splitOn ".machine" (last (filter (\x -> x /= "") (splitOn "/" dir))))

--Checks if a file contains "Transition" in the file name
hasTransitionInFileName :: String -> Bool
hasTransitionInFileName file = length (filter (\x -> x == "Transition") (splitOn "_" file)) > 0

--Removes a new line character from the front of a string if it has one
removeFirstNewLine :: String -> String
removeFirstNewLine str | str == []        = str
                       | head str == '\n' = tail str
                       | otherwise        = str

-- Constant when others => null vhdl code
othersNullBlock :: String
othersNullBlock = "when others =>" ++ beautify 1 "null;"

--Namespace State
toStateName :: String -> String
toStateName str = "STATE_" ++ str

--Namespace External Variable
toExternalName :: String -> String
toExternalName str = "EXTERNAL_" ++ str

--END STRING FORMATTING

--STATE CODE

--Gets a list of states from a string containing the states
getStates :: String -> [String]
getStates str = filter (\x -> not $ isWhitespace x) (map removeWhitespace (lines str))

-- io version of getStates
ioGetStates :: String -> IO [String]
ioGetStates str = return (getStates str)

--Get State names from file names which contain "Transition"
getStateNameFromTransition :: String -> String
getStateNameFromTransition str = head (splitOn "_Transition" $ foldl (++) "" (splitOn "State_" str))

-- Checks if a str contains a state
hasState :: String -> String -> Bool
hasState str state = isInfixOf ("State_" ++ state ++ "_Transition") str

-- Reads States file and returns an IO[String] which contains the states.
getAllStates :: String -> IO [String]
getAllStates dir = getFileContents (dir ++ "/States") >>= ioGetStates

--Get Internal State code for a given State and internal State
getInternalStates :: String -> String -> String -> IO String
getInternalStates dir state intState = getFileContents (dir ++ "/State_" ++ state ++ "_" ++ intState ++ ".mm")

--Get onEntry code for a given state
getOnEntry :: String -> String -> IO String
getOnEntry dir state = getInternalStates dir state "OnEntry"

--Get onExit code for a given state
getOnExit :: String -> String -> IO String
getOnExit dir state = getInternalStates dir state "OnExit"

--Get Internal code for a given state
getInternal :: String -> String -> IO String
getInternal dir state = getInternalStates dir state "Internal"

--Gets all of the internal state code
getInternals :: String -> String -> IO [String]
getInternals dir state =  sequence ([getOnEntry dir state, getInternal dir state, getOnExit dir state])

--Gets all of the internal state code for all of the states
getAllInternals :: String -> [String] -> IO [[String]]
getAllInternals dir states = sequence $ map (getInternals dir) states

--END STATE CODE

--FILE IO AND SYSTEM CALLS

--Get all of the contents of a file.
getFileContents :: String -> IO String
getFileContents path = readFile path >>= ioTrim

--Calls ls system command and returns result.
callLs :: String -> IO String
callLs dir = readProcess ("ls") [dir] ""

--Returns a list of transition files from a directory.
getAllTransitionFiles :: String -> IO [String]
getAllTransitionFiles dir = callLs dir >>= seperateTransitions 

--Gets the contents of a transition file
openTrans :: String -> String -> IO String
openTrans dir t = getFileContents (dir ++ "/" ++ t)

--Gets the contents of all transitions
openAllTrans :: String -> [String] -> IO [String]
openAllTrans dir ts = sequence (map (\x -> openTrans dir x) ts)

--Gets the variables
getVariables :: String -> String -> IO String
getVariables dir name = getFileContents (dir ++ "/" ++ name ++ "_Variables.h")

-- Gets the includes (libaries) for the machine
getIncludes :: String -> String -> IO String
getIncludes dir name = getFileContents(dir ++ "/" ++ name ++ "_Includes.h")

--END FILE IO AND SYSTEM CALLS

--TRANSITION CODE

--Gets the transitions for a given state
filterForState :: String -> [String] -> IO [String]
filterForState state trans = return (filter (\x -> hasState x state) trans)

--Gets the transitions for a given state from a directory
getTransitionsForState :: String -> String -> IO [String]
getTransitionsForState state dir = getAllTransitionFiles dir >>= (filterForState state) 

--Seperate files into transition files.
seperateTransitions :: String -> IO [String]
seperateTransitions files = return (filter hasTransitionInFileName (lines files))

--Gets the transition code for a given state
getTransCodeForState :: String -> String -> IO [String]
getTransCodeForState dir state = getTransitionsForState state dir >>= openAllTrans dir

--Gets the transition code for all states
getAllTransCodeForAllStates :: String -> [String] -> IO [[String]]
getAllTransCodeForAllStates dir states = sequence $ map (getTransCodeForState dir) states

--Gets the line that has transition n
getTargetTransitionLine :: Int -> String -> String 
getTargetTransitionLine n contents =
    (lines (splitOn "}" (splitOn "{" ((splitOn ("class Transition_" ++ (show n)) contents)!!1)!!1)!!0))!!2

--Gets transition n
getTargetTransition :: Int -> String -> IO Int
getTargetTransition n contents = case (trim ((splitOn ")" ((splitOn "= " (getTargetTransitionLine n contents))!!1))!!0)) of
    x : [] -> return $ digitToInt x
    _      -> error "Failed to get target transition" 

--Gets the transition number from a file
readTargetTransition :: Int -> String -> IO Int
readTargetTransition n file = getFileContents file >>= getTargetTransition n

--Gets the targets for n transition of state in directory
getTargetsForState :: String -> String -> Int -> IO [Int]
getTargetsForState dir state n
    | n == 0    = return []
    | otherwise = sequence $ map (\x -> readTargetTransition x (dir ++ "/State_" ++ state ++".h")) [0..(n-1)]

--Get targets for all states
getAllTargets :: String -> [String] -> [Int] -> IO [[Int]]
getAllTargets dir states ns =
    sequence $ map (\x -> (getTargetsForState dir (states!!x) (ns!!x))) [0..((length states) - 1)]

--Gets the states for a given target
targetToState :: [String] -> [Int] -> [String]
targetToState states targets = map (\x -> states!!x) targets

--Gets the states for all targets.
allTargetsToState :: [String] -> [[Int]] -> [[String]]
allTargetsToState states targets = map (\x -> targetToState states (targets!!x)) [0..((length states) - 1)]

--Gets the number of targets.
getNumberOfTargets :: [String] -> [[String]] -> [Int]
getNumberOfTargets states transitions = map (\x -> length (transitions!!x)) [0..((length states) - 1)]

--END TRANSITION CODE

-- VHDL CODE

--Calculates the number of bits needed for an Integer
numberOfBits :: Int -> Int
numberOfBits num = calc num 0
    where
        calc :: Int -> Int -> Int
        calc num n | num == 1  = 1
                   | num < 0   = error "Number must be positive"
                   | num > 2^n = calc num (n+1)
                   | otherwise = n

-- Code for setting the target state
setTargetState :: String -> String
setTargetState state = "targetState <= " ++ toStateName state ++ ";\ninternalState <= OnExit;"

-- Builds the conditionals for transitions
buildCondition :: Int -> [String] -> String
buildCondition n0 ts = build n0 ts ""
    where
        build :: Int -> [String] -> String -> String
        build n ts carry   | n < 0     = carry
                           | n == n0   = build (n-1) ts (carry ++ "(" ++ (ts!!n) ++ ")")
                           | otherwise = build (n-1) ts (carry ++ " and (not (" ++ (ts!!n) ++ "))")

-- Converts a transition to VHDL code.
transitionToVhdl :: Int -> Int -> [String] -> String -> String
transitionToVhdl n m ts s
    | n > m            = error "n cannot be greater than m in transitionToVhdl"
    | n == 0 && n == m = "if (" ++ ts!!n ++ ") then"
        ++ (beautify 1 $ setTargetState s) ++ "else\n    internalState <= Internal;\nend if;" 
    | n == 0           = "if (" ++ ts!!n ++ ") then" ++ (beautify 1 $ setTargetState s)
    | n == m           = "elsif " ++ (buildCondition n ts) ++" then"
        ++ (beautify 1 $ setTargetState s) ++ "else\n    internalState <= Internal;\nend if;"
    | otherwise        = "elsif " ++ (buildCondition n ts) ++ " then" ++ (beautify 1 $ setTargetState s)

-- Converts all transitions to VHDL code.
createTransitionCode :: [String] -> [String] -> String
createTransitionCode trans states
    | trans == [] = "internalState <= Internal;"
    | otherwise   = createCode trans states 0 ((length trans) - 1) ""
        where
            createCode :: [String] -> [String] -> Int -> Int -> String -> String
            createCode ts ss n m carry
                | n > m     = carry
                | otherwise = createCode ts ss (n+1) m (carry ++ (transitionToVhdl n m ts (ss!!n)))

-- Create the case statement for the transitions for a given state
createSingleTransitionCode :: [String] -> [String] -> String
createSingleTransitionCode transitions targetStates =
    "when CheckTransition =>" ++ (beautify 1 (createTransitionCode transitions targetStates))

{- Merges the transitions to a single case statement
joinTransitionBlocks :: [String] -> [[String]] -> [[String]] -> String
joinTransitionBlocks states trans targets =
    "    case currentState is"
    ++ beautify 1 (foldl (++) "" $ map (\x -> createSingleTransitionCode (states!!x) (trans!!x) (targets!!x)) [0..((length states) - 1)])
    ++ removeFirstNewLine (beautify 2 othersNullBlock)
    ++ "    end case;"
-}
-- Code for InitialPseudoState
pseudoStateCode :: String -> String
pseudoStateCode state = "    case currentState is"
    ++ beautify 2 ("When InitialPseudoState =>" ++ beautify 1 ("targetState <= " ++ state ++ ";\ninternalState <= OnExit;"))

{-
--Add InitialPseudoStateCode to transitions
joinTransitionBlocksWithPseudoState :: [String] -> [[String]] -> [[String]] -> String
joinTransitionBlocksWithPseudoState states trans targets
    | head states == "InitialPseudoState" = 
        pseudoStateCode (states!!1)
        ++ removeFirstNewLine (beautify 1 (foldl (++) "" $ map (\x -> createSingleTransitionCode ((tail states)!!x) ((tail trans)!!x) ((tail targets)!!x)) [0..((length (tail states)) - 1)]))
        ++ removeFirstNewLine (beautify 2 othersNullBlock)
        ++ "    end case;"
    | otherwise                           = joinTransitionBlocks states trans targets
-}
--Creates all of the transition code for all states
{-createAllTransitionsCode :: [String] -> [[String]] -> [[String]] -> String
createAllTransitionsCode states trans targets = "case internalState is\n    when CheckTransition =>"
    ++ beautify 1 (joinTransitionBlocksWithPseudoState states trans targets)
-}

-- Internal state representation
internalStateVhdl :: String
internalStateVhdl =
    "--Internal State Representation Bits\n"
    ++ "constant OnEntry: std_logic_vector(2 downto 0) := \"000\";\n"
    ++ "constant CheckTransition: std_logic_vector(2 downto 0) := \"001\";\n"
    ++ "constant OnExit: std_logic_vector(2 downto 0) := \"010\";\n"
    ++ "constant Internal: std_logic_vector(2 downto 0) := \"011\";\n"
    ++ "constant ReadSnapshot: std_logic_vector(2 downto 0) := \"100\";\n"
    ++ "constant WriteSnapshot: std_logic_vector(2 downto 0) := \"101\";\n"
    ++ "signal internalState: std_logic_vector(2 downto 0) := ReadSnapshot;\n"

-- Get number of bits to represent the states in dir
getNumberOfBits :: String -> IO Int
getNumberOfBits dir = getAllStates dir >>= (\x -> return (length x)) >>= (\y -> return (numberOfBits y)) 

-- Create binary representation of a state.
createCurrentState :: String -> Int -> String
createCurrentState firstState bits =
    "signal currentState: std_logic_vector(" ++ (show (bits - 1)) ++ " downto 0) := " ++ firstState ++ ";\n"

-- Code to create targetState signal.
createTargetState :: Int -> String
createTargetState bits = "signal targetState: std_logic_vector(" ++ (show (bits - 1)) ++ " downto 0) := currentState;\n"

--Code to create previousRinglet signal.
createPreviousRinglet :: Int -> String -> String
createPreviousRinglet bits initialState
  = "signal previousRinglet: std_logic_vector(" ++ (show (bits - 1)) ++ " downto 0) := "
    ++ initialState ++ " xor \"" ++ (ones bits) ++ "\";\n"

-- VHDL Binary representation of a state
createState :: Int -> String -> String -> String
createState size bin state = "constant " ++ state ++ ": std_logic_vector(" ++ (show (size - 1)) ++ " downto 0) := \"" ++ bin ++ "\";\n"

-- VHDL Binary representation of all states
createAllStates :: Int -> [String] -> [String] -> String
createAllStates size bins states = foldl (++) "--State Representation Bits\n" $ map (\x -> createState size (bins!!x) (states!!x)) [0..((length states) - 1)]

-- Get binary representation of all states
getBins :: [String] -> [String]
getBins states = map (\x -> decToBin (numberOfBits (length states)) x) [0..((length states) - 1)]

--Creates snapshot variable code.
createArchitectureSnapshots :: [String] -> String
createArchitectureSnapshots vars =  (foldl (+\>) "--Snapshot of External Variables" vars) ++ "\n"

--Creates machine variable code.
createVariables :: [String] -> String
createVariables vars =  (foldl (+\>) "--Machine Variables" vars) ++ "\n"

-- Create variables in architecture block
createArchitectureVariables :: Int -> [String] -> String -> String
createArchitectureVariables size states vars = internalStateVhdl
    ++ createAllStates (numberOfBits $ length states) (getBins states) states
    ++ (createCurrentState (states!!0) (numberOfBits (length states)))
    ++ createTargetState (numberOfBits $ length states)
    ++ createPreviousRinglet (numberOfBits $ length states) (states!!0)
    ++ createArchitectureSnapshots (getExternalVars vars)
    ++ createVariables (getMachineVars vars)

-- create case statement for states
createStateCode :: String -> String -> String -> String
createStateCode state code appendedCode = "when " ++ state ++ " =>" ++ (beautify 1 (code +\> appendedCode));

-- Creates the code for a single var that reads the external variables into snapshot variables
createReadLine :: String -> String
createReadLine varName = varName ++ " <= " ++ toExternalName varName ++ ";"

-- Creates the code for all var that reads the external variables into snapshot variables
createReadCode :: String -> String
createReadCode vars
  = foldl (+\>) "" $ map (\s -> createReadLine (getExternalVarName s)) $ getInputExternalVars vars

-- Creates the logic surrounding whether the OnEntry or CheckTransition should run
createReadTransition :: String
createReadTransition
  = "if (previousRinglet = currentState) then\n    internalState <= CheckTransition;\nelse\n    internalState <= OnEntry;\nend if;"

-- Creates the ReadSnapshot section of the VHDL source file
createReadSnapshot :: String -> String
createReadSnapshot vars = createStateCode "ReadSnapshot" (createReadCode vars) createReadTransition

--Creates the code for writing a single snapshot variable to an external variable
createWriteLine :: String -> String
createWriteLine varName = toExternalName varName ++ " <= " ++ varName ++ ";"

-- Creates all the code for writing the snapshot variables to their respective external variables
createWriteCode :: String -> String
createWriteCode vars
  = foldl (+\>) "" $ map (\s -> createWriteLine (getExternalVarName s)) $ getOutputExternalVars vars

-- Creates the transition code for the WriteSnapshot section
createWriteTransition :: String
createWriteTransition  = "internalState <= ReadSnapshot;\npreviousRinglet <= currentState;\ncurrentState <= targetState;"

-- Creates the WriteSnapshot section
createWriteSnapshot :: String -> String
createWriteSnapshot vars = createStateCode "WriteSnapshot" (createWriteCode vars) createWriteTransition

-- Create onEntry code
createOnEntry :: String -> String
createOnEntry code = createStateCode "OnEntry" code "internalState <= CheckTransition;"

-- Create Internal code
createInternal :: String -> String
createInternal code = createStateCode "Internal" code "internalState <= WriteSnapshot;"

-- Create onExit code
createOnExit :: String -> String
createOnExit code = createStateCode "OnExit" code "internalState <= WriteSnapshot;"

--creates internalStates code for a single state.
createRisingSingleState :: String -> [String] -> String -> String
createRisingSingleState state code vars = "    when " ++ state ++ " =>\n        case internalState is"
    ++ (beautify 3 (createOnEntry (code!!0) ++ (createWriteSnapshot vars) ++ othersNullBlock))
    ++ "        end case;\n" 

--Create internalStates code for all states.
createAllRisingStateCode :: [String] -> [[String]] -> String -> String
createAllRisingStateCode states codes vars = 
    beautify 1 (
        (foldl (++) ""
            $ map 
                (\x -> createRisingSingleState (states!!x) (codes!!x) vars)
                [0..((length states) - 1)]
        ) ++ (removeFirstNewLine (beautify 1 othersNullBlock))
    )

createFallingSingleState :: String -> [String] -> [String] -> [String] -> String -> String
createFallingSingleState state code trans targets vars = "when " ++ state ++ " =>\n    case internalState is"
    ++ beautify 2 (createInternal (code!!1) ++ (createOnExit (code!!2)) ++ (createSingleTransitionCode trans targets)
        ++ (createReadSnapshot vars) ++(othersNullBlock)
    )

createAllFallingStateCode :: [String] -> [[String]] -> [[String]] -> [[String]] -> String -> String
createAllFallingStateCode states codes trans targets vars =
    removeFirstNewLine (beautify 1 (
        (foldl (++) ""
            $ map (\x -> (createFallingSingleState (states!!x) (codes!!x) (trans!!x) (targets!!x) vars) ++ removeFirstNewLine (beautify 1 "end case;"))
                [0..((length states) - 1)]
        ) ++ (othersNullBlock)
    ))

-- Create Rising edge code
createRisingEdge :: [String] -> [[String]] -> String -> String
createRisingEdge states codes vars = "if (rising_edge(clk)) then"
    ++ beautify 1 "case currentState is"
    ++ removeFirstNewLine (createAllRisingStateCode states codes vars)
    ++ "    end case;\nend if;"

--Create Falling edge code
createFallingEdge :: [String] -> [[String]] -> [[String]] -> [[String]] -> String -> String
createFallingEdge states codes trans targets vars = "if (falling_edge(clk)) then"
    ++ beautify 1 "case currentState is"
    ++ removeFirstNewLine (beautify 1 (createAllFallingStateCode states codes trans targets vars))
    ++ "    end case;\nend if;"
--    ++ beautify 1 (createAllTransitionsCode states trans targets)
--   ++ removeFirstNewLine (beautify 2 (createReadSnapshot vars))
--    ++ removeFirstNewLine (beautify 1 (removeFirstNewLine (beautify 1 othersNullBlock)))
--    ++ "    end case;\nend if;"

--create process block
createProcessBlock :: [String] -> [[String]] -> [[String]] -> [[String]] -> String -> String
createProcessBlock states codes transitions targets vars = "process (clk)\n    begin"
    ++ beautify 2 (createRisingEdge states codes vars)
    ++ removeFirstNewLine (beautify 2 (createFallingEdge states codes transitions targets vars))
    ++ "    end process;"

--Create entire architecture block
createArchitecture :: [String] -> [[String]] -> [[String]] -> [[String]] -> Int -> String -> String -> String
createArchitecture states risingEdgeCode transitions targets size name vars = 
    "architecture LLFSM of " ++ name ++ " is"
    ++ beautify 1 (createArchitectureVariables size (map toStateName states) vars)
    ++ "begin\n"
    ++ createProcessBlock (map toStateName states) risingEdgeCode transitions targets vars
    ++ "\nend LLFSM;"

--Checks if code is a comment
isComment :: String -> Bool
isComment str | length (trim str) < 2 = False
              | otherwise             = (trim str)!!0 == '/' && (trim str)!!1 == '/'

--Removes comments from code
filterOutComments :: String -> String
filterOutComments str = trim (foldl (+\>) "" (filter (\x -> not $ isComment x) (lines str)))

-- Removes trailing comment from line
removeTrailingComment :: String -> String
removeTrailingComment str = trim ((splitOn "///<" str)!!0)

-- Removes all trailing comments from code
removeAllTrailingComments :: String -> String
removeAllTrailingComments str = trim (foldl (+\>) "" (map removeTrailingComment (lines str)))

-- Checks if var is an external var
isExternal :: String -> Bool
isExternal code = (splitOn "\t" code)!!0 == "#extern"

-- Gets the code from an external var
getExternalVariableCode :: String -> String
getExternalVariableCode code
    = convertCodeToExternalName (splitOn ": " ((splitOn "\t" code)!!1))

-- Converts a line to have the EXTERNAL_ prefix on the var
convertCodeToExternalName :: [String] -> String
convertCodeToExternalName xs = toExternalName (xs!!0) ++ ": " ++ xs!!1

-- Get the code for all external variables
getAllExternalVariableCode :: [String] -> [String]
getAllExternalVariableCode = map getExternalVariableCode

--Filters to only include external variables code
getExternals :: String -> [String]
getExternals str = getAllExternalVariableCode $ filter isExternal (lines str)

--Is the variable a machine variable?
isMachineVar :: String -> Bool
isMachineVar code = (splitOn "\t" code)!!0 == "#machine"

--Add semicolon to line iff the last character is not a semi colon
addSemiColon :: String -> String
addSemiColon str | last str == ';' = str
                 | otherwise       = str ++ ";"

--Change the code format in the entity declaration to a format suitable for the architecture declaration
formatEntityVariableAsArchitecture :: String -> String
formatEntityVariableAsArchitecture str
  = addSemiColon $ "signal " ++ ((splitOn ": " str)!!0) ++ ": " ++ (foldl (++>) "" $ tail (splitOn " " ((splitOn ": " str)!!1)))

--Get the code for a variable
getMachineVariableCode :: String -> String
getMachineVariableCode code = (splitOn "\t" code)!!1

--Get the architecture code for external variables
getExternalVars :: String -> [String]
getExternalVars str = map (\x -> formatEntityVariableAsArchitecture (getMachineVariableCode x)) $ filter isExternal (lines str)

--Get the architecture code for machine variables
getMachineVars :: String -> [String]
getMachineVars str = map getMachineVariableCode $ filter isMachineVar (lines str)

--Create the port delcaration in the entity statement
createPortDeclaration :: [String] -> String
createPortDeclaration xs = init (foldl (\x y -> x ++ "\n    " ++ y) "port (\n    clk: in std_logic;" xs) ++ "\n);"

--Create entity block
createEntity :: String -> String -> String -> String
createEntity includes name vars = "library IEEE;\nuse IEEE.std_logic_1164.All;\n" ++ includes ++ "\n\nentity " ++ name ++ " is"
    ++ beautify 1 (createPortDeclaration $ getExternals $ removeAllTrailingComments $ filterOutComments vars)
    ++ "end " ++ name ++ ";"

-- Checks mode for input
isExternalModeInput :: String -> Bool
isExternalModeInput str = str == "in" || str == "inout"

-- Checks mode for output
isExternalModeOutput :: String -> Bool
isExternalModeOutput str = str == "out" || str == "inout"

-- Checks line for input mode
isExternalInput :: String -> Bool
isExternalInput str = isExternalModeInput ((splitOn " " ((splitOn ": " ((splitOn "\t" str)!!1))!!1))!!0)

-- Checks line for output mode
isExternalOutput :: String -> Bool
isExternalOutput str = isExternalModeOutput ((splitOn " "((splitOn ": " ((splitOn "\t" str)!!1))!!1))!!0)

-- Filters the external variables to input variables
getInputExternalVars :: String -> [String]
getInputExternalVars vars = filter isExternalInput $ filter isExternal (lines vars)

-- Filters the external variables to output variables
getOutputExternalVars :: String -> [String]
getOutputExternalVars vars = filter isExternalOutput $ filter isExternal (lines vars)

-- Get the var name of an external variable
getExternalVarName :: String -> String
getExternalVarName varCode = (splitOn ": " ((splitOn "\t" varCode)!!1))!!0

--END VHDL CODE

--CONVENIENCE CODE

--Converts decimal to a binary number
decToBin :: Int -> Int -> String
decToBin size num = sanitiseBin size $ calcBin size num ""
    where
        calcBin :: Int -> Int -> String -> String
        calcBin ind n carry | ind < 0      = carry
                            | n >= (2^ind) = calcBin (ind-1) (n - (2^ind)) (carry ++ "1")
                            | otherwise    = calcBin (ind-1) n (carry ++ "0")

--Removes redundent binary.
sanitiseBin :: Int -> String -> String
sanitiseBin size bin | length bin > size && head bin == '0' = sanitiseBin size (tail bin)
                     | otherwise                            = bin

--Returns a string of n number of 1's 
ones :: Int -> String
ones n = onesCarry n ""
    where
        onesCarry :: Int -> String -> String
        onesCarry m str | m <= 0    = str
                        | otherwise = onesCarry (m-1) ("1" ++ str)

--END CONVENIENCE CODE
