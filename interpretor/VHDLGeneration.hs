-- VHDLGeneration.hs
-- interpretor
-- Created by Morgan McColl on 19/06/2020
-- Copyright © 2020 Morgan McColl. All rights reserved.
--
-- Redistribution and use in source and binary forms, with or without
-- modification, are permitted provided that the following conditions
-- are met:
--
-- 1. Redistributions of source code must retain the above copyright
--    notice, this list of conditions and the following disclaimer.
--
-- 2. Redistributions in binary form must reproduce the above
--    copyright notice, this list of conditions and the following
--    disclaimer in the documentation and/or other materials
--    provided with the distribution.
--
-- 3. All advertising materials mentioning features or use of this
--    software must display the following acknowledgement:
--
--        This product includes software developed by Morgan McColl.
--
-- 4. Neither the name of the author nor the names of contributors
--    may be used to endorse or promote products derived from this
--    software without specific prior written permission.
--
-- THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
-- "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
-- LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
-- A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER
-- OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
-- EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
-- PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
-- PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
-- LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
-- NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
-- SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
--
-- -----------------------------------------------------------------------
-- This program is free software; you can redistribute it and/or
-- modify it under the above terms or under the terms of the GNU
-- General Public License as published by the Free Software Foundation;
-- either version 2 of the License, or (at your option) any later version.
--
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with this program; if not, see http://www.gnu.org/licenses/
-- or write to the Free Software Foundation, Inc., 51 Franklin Street,
-- Fifth Floor, Boston, MA  02110-1301, USA.

module SpartanLLFSM_VHDLGeneration(
    createEntity,
    createArchitecture,
    toStateName,
    getNumberOfBits
) where

import SpartanLLFSM_Strings
import Data.List.Split
import SpartanLLFSM_Helpers
import SpartanLLFSM_Format

-- VHDL CODE

-- Constant when others => null vhdl code
othersNullBlock :: String
othersNullBlock = "when others =>" ++ beautify 1 "null;"

--Namespace State
toStateName :: String -> String
toStateName str = "STATE_" ++ str

--Namespace External Variable
toExternalName :: String -> String
toExternalName str = "EXTERNAL_" ++ str

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

-- Code for InitialPseudoState
pseudoStateCode :: String -> String
pseudoStateCode state = "    case currentState is"
    ++ beautify 2 ("When InitialPseudoState =>" ++ beautify 1 ("targetState <= " ++ state ++ ";\ninternalState <= OnExit;"))

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
    ++ "constant NoOnEntry: std_logic_vector(2 downto 0) := \"110\";\n"
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

--Creates the suspendedFrom architecture signal.
createSuspendedFrom :: Int -> String
createSuspendedFrom bits = "signal " ++ suspendedFromVariable ++ ": std_logic_vector(" ++ (show (bits - 1)) ++> "downto 0);\n"

--Creates the previousInternal signal.
createPreviousInternal :: String
createPreviousInternal = "signal previousInternal: std_logic_vector(2 downto 0);\n"

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
createArchitectureVariables :: Int -> [String] -> String -> String -> String
createArchitectureVariables size states vars firstState = 
    internalStateVhdl
    ++ createAllStates (numberOfBits $ length states) (getBins states) states
    ++ (createCurrentState (firstState) (numberOfBits (length states)))
    ++ createTargetState (numberOfBits $ length states)
    ++ createPreviousRinglet (numberOfBits $ length states) (states!!0)
    ++ createSuspendedFrom (numberOfBits $ length states)
--    ++ createPreviousInternal
    ++ createArchitectureSnapshots (getExternalVars vars)
    ++ createVariables (getMachineVars vars)

-- create case statement for states
createStateCode :: String -> String -> String -> String
createStateCode state code appendedCode = "when " ++ state ++ " =>" ++ (beautify 1 (code +\> appendedCode));

-- Creates the code for a single var that reads the external variables into snapshot variables
createReadLine :: String -> String
createReadLine varName = varName ++ " <= " ++ toExternalName varName ++ ";"

suspendedFromVariable :: String
suspendedFromVariable = "suspendedFrom"

readSnapshotSuspensionVariables :: String -> String
readSnapshotSuspensionVariables initialState = "if (restart = '1') then"
    +\-> "currentState <= " ++ toStateName initialState ++ ";"
    +\>  "elsif (resume = '1' and currentState = " ++ toStateName "SUSPENDED" ++ ") then"
    +\-> "suspended <= '0';"
    +\-> "currentState <= " ++ suspendedFromVariable ++ ";"
    +\>  "elsif (suspend = '1') then"
    +\-> "suspended <= '1';"
    +\-> "currentState <= " ++ toStateName "SUSPENDED" ++ ";"
    +\>  "elsif (currentState = " ++ toStateName "SUSPENDED" ++ ") then"
    +\-> "suspended <= '1';"
    +\>  "else"
    +\-> "suspended <= '0';"
    +\-> suspendedFromVariable ++ " <= currentState;"
    +\>  "end if;"

-- Creates the code for all var that reads the external variables into snapshot variables
createReadCode :: String -> String -> String
createReadCode vars initialState
  = foldl (+\>) (readSnapshotSuspensionVariables initialState) $ map (\s -> createReadLine (getExternalVarName s)) $ getInputExternalVars vars

-- Creates the logic surrounding whether the OnEntry or CheckTransition should run
createReadTransition :: String
createReadTransition
  = "if (previousRinglet = currentState) then\n    internalState <= NoOnEntry;\nelse\n    internalState <= OnEntry;\nend if;"

-- Creates the ReadSnapshot section of the VHDL source file
createReadSnapshot :: String -> String -> String
createReadSnapshot vars initialState = createStateCode "ReadSnapshot" (createReadCode vars initialState) createReadTransition

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

--Creates the code for a states falling edge.
createFallingSingleState :: String -> String -> [String] -> [String] -> [String] -> String -> String
createFallingSingleState initialState state code trans targets vars = "when " ++ state ++ " =>\n    case internalState is"
    ++ beautify 2 (createInternal (code!!1) ++ (createOnExit (code!!2)) ++ (createSingleTransitionCode trans targets)
        ++ (createReadSnapshot vars initialState) ++(othersNullBlock)
    )

--Creates the code for all states falling edge.
createAllFallingStateCode :: String -> [String] -> [[String]] -> [[String]] -> [[String]] -> String -> String
createAllFallingStateCode initialState states codes trans targets vars =
    removeFirstNewLine (beautify 1 (
        (foldl (++) ""
            $ map (\x -> (createFallingSingleState initialState (states!!x) (codes!!x) (trans!!x) (targets!!x) vars) ++ removeFirstNewLine (beautify 1 "end case;"))
                [0..((length states) - 1)]
        ) ++ (othersNullBlock)
    ))

-- Create Rising edge code
createRisingEdge :: [String] -> [[String]] -> String -> String
createRisingEdge states codes vars = "if (rising_edge(clk)) then"
    ++ beautify 1 "case currentState is"
    ++ removeFirstNewLine (createAllRisingStateCode states codes vars)
    ++ "    end case;\nend if;"

createCodeForState :: String -> String -> String
createCodeForState state code | code == "" = ""
                              | otherwise  = "when " ++ state ++ " =>" +\> beautifyTrimmed 1 code

onlyValidNewLine :: String -> String -> String
onlyValidNewLine str1 str2 | str1 == "" && str2 == "" = ""
                           | otherwise                = trimNewLines (str1 +\> str2)

createAllInternalStateCode :: String -> [String] -> [String] -> String -> String
createAllInternalStateCode internalState states codes trailer = "when " ++ internalState ++ " =>" +\> beautifyTrimmed 1 ("case currentState is"
    +\> beautifyTrimmed 1 (trimNewLines (foldl onlyValidNewLine "" (map (\(s,c) -> createCodeForState s c) $ zip states codes))
    +\> othersNullBlock) +\> "end case;" +\> trailer)

getActions :: [[String]] -> Int -> [String]
getActions codes index = map (\x -> x!!index) codes

emptyStringLists :: Int -> [String]
emptyStringLists size = emptyStringListsCarry size []
    where emptyStringListsCarry :: Int -> [String] -> [String]
          emptyStringListsCarry size carry | size <= 0 = carry
                                           | otherwise = emptyStringListsCarry (size - 1) ("" : carry)

--Create Falling edge code
createFallingEdge :: String -> [String] -> [[String]] -> [[String]] -> [[String]] -> String -> String
createFallingEdge initialState states codes trans targets vars = "if (falling_edge(clk)) then"
    ++ beautify 1 "case internalState is"
    ++ beautifyTrimmed 2 (createReadSnapshot vars initialState)
    +\> beautifyTrimmed 2 (createAllInternalStateCode "Internal" states (getActions codes 1) "internalState <= WriteSnapshot;")
    +\> beautifyTrimmed 2 (createAllInternalStateCode "OnExit" states (getActions codes 2) "internalState <= WriteSnapshot;")
    +\> beautifyTrimmed 2 (createAllInternalStateCode "CheckTransition" states (map (\(trans, trgs) -> createTransitionCode trans trgs) (zip trans targets)) "")
    +\> beautifyTrimmed 2 othersNullBlock
--  ++ createAllInternalStateCode "CheckTransition" states 
--    ++ removeFirstNewLine (beautify 1 (createAllFallingStateCode states codes trans targets vars))
    +\> beautifyTrimmed 1 "end case;"
    +\> "end if;"
--    ++ beautify 1 (createAllTransitionsCode states trans targets)
--   ++ removeFirstNewLine (beautify 2 (createReadSnapshot vars))
--    ++ removeFirstNewLine (beautify 1 (removeFirstNewLine (beautify 1 othersNullBlock)))
--    ++ "    end case;\nend if;"

createAllInRisingEdge :: String-> [String] -> [[String]] -> [[String]] -> [[String]] -> String -> String
createAllInRisingEdge initialState states codes trans targets vars = "if (rising_edge(clk)) then"
    ++ beautify 1 "case internalState is"
    ++ beautifyTrimmed 2 (createReadSnapshot vars initialState)
    +\> beautifyTrimmed 2 (createAllInternalStateCode "OnEntry" states (getActions codes 0) "internalState <= CheckTransition;")
    +\> beautifyTrimmed 2 (createAllInternalStateCode "CheckTransition" states (map (\(trans, trgs) -> createTransitionCode trans trgs) (zip trans targets)) "")
    +\> beautifyTrimmed 2 (createAllInternalStateCode "Internal" states (getActions codes 1) "internalState <= WriteSnapshot;")
    +\> beautifyTrimmed 2 (createAllInternalStateCode "OnExit" states (getActions codes 2) "internalState <= WriteSnapshot;")
    +\> beautifyTrimmed 2 ("when NoOnEntry =>" +\-> "internalState <= CheckTransition;")
    +\> beautifyTrimmed 2 (createWriteSnapshot vars)
    +\> beautifyTrimmed 2 othersNullBlock 
    +\> beautifyTrimmed 1 "end case;"
    +\> "end if;"

--create process block
createProcessBlock :: String -> [String] -> [[String]] -> [[String]] -> [[String]] -> String -> String
createProcessBlock initialState states codes transitions targets vars = "process (clk)\n    begin"
--  ++ beautify 2 (createSuspendedLogic)
    ++ beautify 2 (createAllInRisingEdge initialState states codes transitions targets vars) -- add removeFirstNewLine when adding suspend logic
--    ++ removeFirstNewLine (beautify 2 (createFallingEdge states codes transitions targets vars))
    ++ "    end process;"

--Create entire architecture block
createArchitecture :: [String] -> [[String]] -> [[String]] -> [[String]] -> Int -> String -> String -> String -> String
createArchitecture states risingEdgeCode transitions targets size name vars firstState = 
    "architecture LLFSM of " ++ name ++ " is"
    ++ beautify 1 (createArchitectureVariables size (map toStateName states) vars (toStateName firstState))
    ++ "begin"
    +\> createProcessBlock firstState (map toStateName states) risingEdgeCode transitions targets vars
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
createPortDeclaration xs = init (foldl (\x y -> x +\->  y)
    ("port (" +\-> "clk: in std_logic;" +\-> "restart: in std_logic;" +\-> "resume: in std_logic;" +\-> "suspend: in std_logic;" +\-> "suspended: out std_logic;") xs) +\> ");"

isParameter :: String -> Bool
isParameter code = (splitOn "\t" code)!!0 == "#param"

getParameterCode :: String -> String
getParameterCode code = (splitOn "\t" code)!!1

getAllParameterVariableCode :: [String] -> [String]
getAllParameterVariableCode = map getParameterCode

getParameters :: String -> [String]
getParameters vars = getAllParameterVariableCode $ filter isParameter (lines vars)

createGenericDeclaration :: [String] -> String
createGenericDeclaration vs | length vs == 0 = ""
                            | otherwise      = init (foldl (\x y -> x +\-> y) ("generic (" +\-> "") vs) +\> ");"

--Create entity block
createEntity :: String -> String -> String -> String
createEntity includes name vars = "library IEEE;\nuse IEEE.std_logic_1164.All;\n" ++ includes ++ "\n\nentity " ++ name ++ " is"
    ++ beautify 1 (createGenericDeclaration $ getParameters $ removeAllTrailingComments $ filterOutComments vars)
    ++ removeFirstNewLine (beautify 1 (createPortDeclaration $ getExternals $ removeAllTrailingComments $ filterOutComments vars))
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
