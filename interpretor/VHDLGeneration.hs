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
    getNumberOfBits,
    doesStateHaveAfter
) where

import SpartanLLFSM_Strings
import Data.List.Split
import SpartanLLFSM_Helpers
import SpartanLLFSM_Format
import Data.Char
import Data.List
import Data.Maybe
import Text.Read
import Text.Regex

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
    | otherwise   = createCode (map replaceAftersInTransition trans) states 0 ((length trans) - 1) ""
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
    ++ "constant OnEntry: std_logic_vector(3 downto 0) := \"0000\";\n"
    ++ "constant CheckTransition: std_logic_vector(3 downto 0) := \"0001\";\n"
    ++ "constant OnExit: std_logic_vector(3 downto 0) := \"0010\";\n"
    ++ "constant Internal: std_logic_vector(3 downto 0) := \"0011\";\n"
    ++ "constant ReadSnapshot: std_logic_vector(3 downto 0) := \"0100\";\n"
    ++ "constant WriteSnapshot: std_logic_vector(3 downto 0) := \"0101\";\n"
    ++ "constant NoOnEntry: std_logic_vector(3 downto 0) := \"0110\";\n"
    ++ "constant OnSuspend: std_logic_vector(3 downto 0) := \"0111\";"
    +\> "constant OnResume: std_logic_vector(3 downto 0) := \"1000\";"
    +\> "constant NoSuspendOrResume: std_logic_vector(3 downto 0) := \"1001\";"
    +\> "signal internalState: std_logic_vector(3 downto 0) := ReadSnapshot;\n"

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
createSuspendedFrom :: Int -> String -> String
createSuspendedFrom bits initialState = "signal " ++ suspendedFromVariable ++ ": std_logic_vector(" ++ (show (bits - 1)) ++> "downto 0) := " ++ initialState ++ ";\n"

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

toCommand :: String -> String
toCommand cmd = "COMMAND_" ++ map toUpper cmd

restart :: String
restart = toCommand "restart"

resume :: String
resume = toCommand "resume"

suspend :: String
suspend = toCommand "suspend"

nullCommand :: String
nullCommand = toCommand "null"

createCommandDeclaration :: String -> String -> String
createCommandDeclaration cmd val = "constant" ++> cmd ++ ": std_logic_vector(1 downto 0) := \"" ++ val ++ "\";"

suspensionConstants :: String
suspensionConstants = createCommandDeclaration restart "00"
    +\> createCommandDeclaration suspend "01"
    +\> createCommandDeclaration resume "10"
    +\> createCommandDeclaration nullCommand "11"

-- Create variables in architecture block
createArchitectureVariables :: Int -> [String] -> String -> String -> String
createArchitectureVariables size states vars firstState = 
    internalStateVhdl
    ++ createAllStates (numberOfBits $ length states) (getBins states) states
    ++ (createCurrentState (firstState) (numberOfBits (length states)))
    ++ createTargetState (numberOfBits $ length states)
    ++ createPreviousRinglet (numberOfBits $ length states) firstState
    ++ createSuspendedFrom (numberOfBits $ length states) firstState
    ++ suspensionConstants
    +\> counterVariables
--    ++ createPreviousInternal
    +\> createArchitectureSnapshots (getExternalVars vars)
    ++ createVariables (getMachineVars vars)

-- create case statement for states
createStateCode :: String -> String -> String -> String
createStateCode state code appendedCode = "when " ++ state ++ " =>" ++ (beautify 1 (code +\> appendedCode));

-- Creates the code for a single var that reads the external variables into snapshot variables
createReadLine :: String -> String
createReadLine varName = varName ++ " <= " ++ toExternalName varName ++ ";"

lower :: String -> String
lower = map toLower

isAfter :: String -> Bool
isAfter str = "after" == (lower str)

isAfterMs :: String -> Bool
isAfterMs str = "after_ms" == (lower str)

isAfterUs :: String -> Bool
isAfterUs str = "after_us" == (lower str)

isAfterNs :: String -> Bool
isAfterNs str = "after_ns" == (lower str)

afterReg :: Regex
afterReg = mkRegex "after\\(.*\\)"

after_ms :: Regex
after_ms = mkRegex "after_ms\\(.*\\)"

after_us :: Regex
after_us = mkRegex "after_us\\(.*\\)"

after_ns :: Regex
after_ns = mkRegex "after_ns\\(.*\\)"

isAnyAfter :: String -> Bool
isAnyAfter str = isAfter str || isAfterMs str || isAfterUs str || isAfterNs str

getAfterCandidates :: String -> [String]
getAfterCandidates str = filter (\s -> isAfterCandidate (trim s)) (splitOn " " str)

doesTransHaveAfter :: String -> Bool
doesTransHaveAfter trans = length (filter (\s -> isAnyAfter (getAfterCommand (trim s))) (getAfterCandidates trans)) > 0

doesStateHaveAfter :: [String] -> Bool
doesStateHaveAfter trans = foldl (||) False (map doesTransHaveAfter trans)

isAfterCandidate :: String -> Bool
isAfterCandidate str = length (splitOn "(" str) >= 2 && isAnyAfter (getAfterCommand str)

getAfterAndValue :: String -> [String]
getAfterAndValue str = [getAfterCommand str, getValueFromAfter str]

--replaceAfter :: String -> String
--replaceAfter str | isAfterCandidate str = convertAfterToVHDLVariable ((getAfterAndValue str)!!0) ((getAfterAndValue str)!!1)
--                 | otherwise            = str


after_nsReplace :: String -> String
after_nsReplace val = convertAfter val "RINGLETS_PER_NS"

after_usReplace :: String -> String
after_usReplace val = convertAfter val "RINGLETS_PER_US"

after_msReplace :: String -> String
after_msReplace val = convertAfter val "RINGLETS_PER_MS"

afterReplace :: String -> String
afterReplace val = convertAfter val "RINGLETS_PER_S"

replaceAfter :: Regex -> String -> String
replaceAfter reg | isMatchedRegex reg "after_ns(1)" = after_nsReplace 
                 | isMatchedRegex reg "after_us(1)" = after_usReplace 
                 | isMatchedRegex reg "after_ms(1)" = after_msReplace 
                 | isMatchedRegex reg "after(1)"    = afterReplace 
                 | otherwise                        = error "Can't replace invalid after."

getValueStr :: String -> String -> String
getValueStr str after = init (tail (getValueBit after str))

isMatchedRegex :: Regex -> String -> Bool
isMatchedRegex reg mat = matchRegex reg mat /= Nothing

removeFirstFromString :: String -> Int -> String
removeFirstFromString str n | length str < n = error "Can't remove elements from front of string since string is too small"
                            | n > 0          = removeFirstFromString (tail str) (n - 1)
                            | otherwise      = str

removeLastFromString :: String -> Int -> String
removeLastFromString str n | n > 0     = removeLastFromString (init str) (n - 1)
                           | otherwise = str

sliceString :: Int -> Int -> String -> String
sliceString from to str = removeLastFromString (removeFirstFromString str from) ((length str) - to - 1)

isSmallAfter :: String -> Bool
isSmallAfter str = str == "after_ns" || str == "after_us" || str == "after_ms"

isNormalAfter :: String -> Bool
isNormalAfter str | length str /= 8 = False
                  | otherwise       = (removeFirstFromString str 3) == "after"

matchString :: String -> Bool 
matchString str | length str /= 8 = False
                | otherwise       = isSmallAfter str || isNormalAfter str

findValueAndCarry :: String -> String -> String -> String
findValueAndCarry str carry allButCarry
  = replaceString (removeFirstFromString str (2 + length (findValueInBrackets str "" 0))) "" (allButCarry ++ (convertAfterToVHDLVariable carry (findValueInBrackets str "" 0)))


replaceString :: String -> String -> String -> String
replaceString str carry allButCarry
  | length carry > 8    = replaceString str (tail carry) (allButCarry ++ [head carry])
  | length carry == 5 
    && carry == "after" = findValueAndCarry str carry allButCarry
  | isSmallAfter carry  = findValueAndCarry str carry allButCarry
  | isNormalAfter carry = findValueAndCarry str (removeFirstFromString carry 3) allButCarry     
  | str == ""           = allButCarry ++ carry
  | otherwise           = replaceString (tail str) (carry ++ [head str]) allButCarry

isAfterRegex :: Regex -> Bool
isAfterRegex after = isMatchedRegex after "after_ns(1)" || isMatchedRegex after "after_us(1)" || isMatchedRegex after "after_ms(1)" || isMatchedRegex after "after(1)" 

afterRegToStr :: Regex -> String
afterRegToStr after | isMatchedRegex after "after_ns(1)" = "after_ns"
                    | isMatchedRegex after "after_us(1)" = "after_us"
                    | isMatchedRegex after "after_ms(1)" = "after_ms"
                    | isMatchedRegex after "after(1)"    = "after"
                    | otherwise                          = error "Not an after regex." 

afterReplaceStr :: String -> Regex -> String
afterReplaceStr str reg | isAfterRegex reg = replaceAfter reg (getValueStr str (afterRegToStr reg)) 
                        | otherwise        = error ""

findValueInBrackets :: String -> String -> Int -> String
findValueInBrackets remaining carry openBrackets 
  | remaining == ""                             = error "Unbalanced Parenthesis"
  | openBrackets == 0 && head remaining == '('  = findValueInBrackets (tail remaining) carry 1
  | head remaining == '('                       = findValueInBrackets (tail remaining) (carry ++ "(") (openBrackets + 1)
  | head remaining == ')' && openBrackets <= 1  = carry 
  | head remaining == ')'                       = findValueInBrackets (tail remaining) (carry ++ ")") (openBrackets - 1)
  | otherwise                                   = findValueInBrackets (tail remaining) (carry ++ ([head remaining])) openBrackets

replaceAftersInTransition :: String -> String
replaceAftersInTransition str = replaceString str "" ""
--replaceAftersInTransition str = last (scanl (\s af -> replaceString s af "" "") str ["after_ns", "after_us", "after_ms", "after"])
--replaceAftersInTransition str = last (scanl (\s reg -> subRegex reg s (afterReplaceStr s reg)) str [after_ns, after_us, after_ms, afterReg])
--replaceAftersInTransition str = foldl (++>) "" (map (\s -> replaceAfter (trim s)) (splitOn " " str))

getAfterCommand :: String -> String
getAfterCommand str = (splitOn "(" str)!!0

containsString :: String -> String -> Bool
containsString elem str = length (splitOn elem str) > 1

getValueBit :: String -> String -> String
getValueBit after str = findValueInBrackets ((splitOn after str)!!1) "" 0

getValueFromAfter :: String -> String
getValueFromAfter str
  | containsString "after_ns" str = getValueStr "after_ns" str
  | containsString "after_us" str = getValueStr "after_us" str
  | containsString "after_ms" str = getValueStr "after_ms" str
  | containsString "after" str    = getValueStr "after" str
  | otherwise                     = error ("Trying to get after value for incorrect string," ++> str)
--(splitOn ")" ((splitOn "(" str)!!1))!!0

readInt :: String -> Maybe Int
readInt str = readMaybe str :: Maybe Int

readDouble :: String -> Maybe Double
readDouble str = readMaybe str :: Maybe Double

toDecimal :: String -> String
toDecimal str 
  | readInt str /= Nothing       = str ++ ".0"
  | readDouble str /= Nothing    = str
  | otherwise                    = "(" ++ str ++ ")"

convertAfter :: String -> String -> String
convertAfter value variable = "ringlet_counter >= integer(ceil(" ++ toDecimal value ++ " * " ++ variable ++ "))"

convertAfterToVHDLVariable :: String -> String -> String
convertAfterToVHDLVariable afterStr valueStr
    | isAfter afterStr   = convertAfter valueStr "RINGLETS_PER_S"
    | isAfterMs afterStr = convertAfter valueStr "RINGLETS_PER_MS"
    | isAfterUs afterStr = convertAfter valueStr "RINGLETS_PER_US"
    | isAfterNs afterStr = convertAfter valueStr "RINGLETS_PER_NS"
    | otherwise          = error ("Failed to convert after str. candidate: " ++ afterStr ++ "(" ++ valueStr ++ ")")

counterVariables :: String
counterVariables = "shared variable ringlet_counter: natural := 0;"
    +\> "constant clockPeriod: real := 20.0;"
    +\> "constant ringletLength: real := 6.0 * clockPeriod;"
    +\> "constant RINGLETS_PER_NS: real := 1.0 / ringletLength;"
    +\> "constant RINGLETS_PER_US: real := 1000.0 * RINGLETS_PER_NS;"
    +\> "constant RINGLETS_PER_MS: real := 1000000.0 * RINGLETS_PER_NS;"
    +\> "constant RINGLETS_PER_S: real := 1000000000.0 * RINGLETS_PER_NS;"

suspendedFromVariable :: String
suspendedFromVariable = "suspendedFrom"

suspensionLogic :: String -> String
suspensionLogic initialState = "if (command = " ++ restart ++ ") then"
    +\-> "currentState <= " ++ toStateName initialState ++ ";"
    +\-> "internalState <= NoSuspendOrResume;"
    +\-> "suspended <= '0';"
    +\-> suspendedFromVariable ++ " <= " ++ toStateName initialState ++ ";"
    +\-> "targetState <= " ++ toStateName initialState ++ ";"
    +\>  "elsif (command = " ++ resume ++ " and currentState = " ++ toStateName "SUSPENDED" ++ " and " ++ suspendedFromVariable ++ " /= " ++ toStateName "SUSPENDED" ++ ") then"
    +\-> "suspended <= '0';"
    +\-> "currentState <= " ++ suspendedFromVariable ++ ";"
    +\-> "internalState <= OnResume;"
    +\-> "targetState <= " ++ suspendedFromVariable ++ ";"
    +\>  "elsif (command = " ++ suspend ++ " and currentState /= " ++ toStateName "SUSPENDED" ++ ") then"
    +\-> suspendedFromVariable ++ " <= currentState;"
    +\-> "suspended <= '1';"
    +\-> "currentState <= " ++ toStateName "SUSPENDED" ++ ";"
    +\-> "internalState <= OnSuspend;"
    +\-> "targetState <= " ++ toStateName "SUSPENDED" ++ ";"
    +\>  "else"
    +\-> "if (currentState = " ++ toStateName "SUSPENDED" ++ ") then"
    +\-> tab ++ "suspended <= '1';"
    +\-> "else"
    +\-> tab ++ "suspended <= '0';"
    +\-> tab ++ suspendedFromVariable ++ " <= currentState;"
    +\-> "end if;"
    +\-> "internalState <= NoSuspendOrResume;"
    +\>  "end if;"

-- Creates the code for all var that reads the external variables into snapshot variables
createReadCode :: String -> String
createReadCode vars 
  = foldl (+\>) "" $ map (\s -> createReadLine (getExternalVarName s)) $ getInputExternalVars vars

-- Creates the logic surrounding whether the OnEntry or CheckTransition should run
--createReadTransition :: String
--createReadTransition
--  = "if (previousRinglet = currentState) then\n    internalState <= NoOnEntry;\nelse\n    internalState <= OnEntry;\nend if;"

-- Creates the ReadSnapshot section of the VHDL source file
createReadSnapshot :: String -> String -> String
createReadSnapshot vars initialState = createStateCode "ReadSnapshot" (createReadCode vars) (suspensionLogic initialState)

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

createCheckSuspension :: String -> String
createCheckSuspension initialState = createStateCode "CheckForSuspension" (suspensionLogic initialState) ""

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
--createFallingSingleState :: String -> [String] -> [String] -> [String] -> String -> String
--createFallingSingleState state code trans targets vars = "when " ++ state ++ " =>\n    case internalState is"
--    ++ beautify 2 (createInternal (code!!1) ++ (createOnExit (code!!2)) ++ (createSingleTransitionCode trans targets)
--        ++ (createReadSnapshot vars) ++(othersNullBlock)
--    )

--Creates the code for all states falling edge.
--createAllFallingStateCode :: [String] -> [[String]] -> [[String]] -> [[String]] -> String -> String
--createAllFallingStateCode states codes trans targets vars =
--    removeFirstNewLine (beautify 1 (
--        (foldl (++) ""
--            $ map (\x -> (createFallingSingleState (states!!x) (codes!!x) (trans!!x) (targets!!x) vars) ++ removeFirstNewLine (beautify 1 "end case;"))
--                [0..((length states) - 1)]
--        ) ++ (othersNullBlock)
--    ))

-- Create Rising edge code
createRisingEdge :: [String] -> [[String]] -> String -> String
createRisingEdge states codes vars = "if (rising_edge(clk)) then"
    ++ beautify 1 "case currentState is"
    ++ removeFirstNewLine (createAllRisingStateCode states codes vars)
    ++ "    end case;\nend if;"

createCodeForState :: String -> String -> Bool -> String -> String
createCodeForState state code hasAfter internalState
    | hasAfter && internalState == "OnEntry"  = "when" ++> state ++> "=>" +\> beautifyTrimmed 1 (code +\> "ringlet_counter := 0;")
    | hasAfter && internalState == "Internal" = "when" ++> state ++> "=>" +\> beautifyTrimmed 1 (code +\> "ringlet_counter := ringlet_counter + 1;")
    | code == ""                              = ""
    | internalState == "OnSuspend"
        && state == toStateName "SUSPENDED"   = ""
    | internalState == "OnResume"
        && state == toStateName "SUSPENDED"   = ""
    | otherwise                               = "when " ++ state ++ " =>" +\> beautifyTrimmed 1 code

onlyValidNewLine :: String -> String -> String
onlyValidNewLine str1 str2 | str1 == "" && str2 == "" = ""
                           | otherwise                = trimNewLines (str1 +\> str2)

createAllInternalStateCodeWithStateVar :: String -> [String] -> [String] -> String -> [Bool] -> String -> String
createAllInternalStateCodeWithStateVar internalState states codes trailer afters stateVar = "when " ++ internalState ++ " =>" +\> beautifyTrimmed 1 ("case " ++ stateVar ++>  "is"
    +\> beautifyTrimmed 1 (trimNewLines (foldl onlyValidNewLine "" (map (\(a, (s,c)) -> createCodeForState s c a internalState) $ zip afters (zip states codes)))
    +\> othersNullBlock) +\> "end case;" +\> trailer)

createAllInternalStateCode :: String -> [String] -> [String] -> String -> [Bool] -> String
createAllInternalStateCode internalState states codes trailer afters = createAllInternalStateCodeWithStateVar internalState states codes trailer afters "currentState"

setToDefault :: String -> String -> String
setToDefault str def | str == "" = def
                     | otherwise = str

createAllInternalStateCodeWithDefault :: String -> [String] -> [String] -> String ->[Bool] -> String -> String
createAllInternalStateCodeWithDefault internalState states codes trailer afters defaults 
  | internalState == "OnSuspend" = createAllInternalStateCodeWithStateVar internalState states (map (\c -> setToDefault c defaults) codes) trailer afters "suspendedFrom"
  | otherwise                    = createAllInternalStateCode internalState states (map (\c -> setToDefault c defaults) codes) trailer afters


getActions :: [[String]] -> Int -> [String]
getActions codes index = map (\x -> x!!index) codes

emptyStringLists :: Int -> [String]
emptyStringLists size = emptyStringListsCarry size []
    where emptyStringListsCarry :: Int -> [String] -> [String]
          emptyStringListsCarry size carry | size <= 0 = carry
                                           | otherwise = emptyStringListsCarry (size - 1) ("" : carry)

--Create Falling edge code
--createFallingEdge :: [String] -> [[String]] -> [[String]] -> [[String]] -> String -> String
--createFallingEdge states codes trans targets vars = "if (falling_edge(clk)) then"
--    ++ beautify 1 "case internalState is"
--    ++ beautifyTrimmed 2 (createReadSnapshot vars)
--    +\> beautifyTrimmed 2 (createAllInternalStateCode "Internal" states (getActions codes 1) "internalState <= WriteSnapshot;")
--    +\> beautifyTrimmed 2 (createAllInternalStateCode "OnExit" states (getActions codes 2) "internalState <= WriteSnapshot;")
--    +\> beautifyTrimmed 2 (createAllInternalStateCode "CheckTransition" states (map (\(trans, trgs) -> createTransitionCode trans trgs) (zip trans targets)) "")
--    +\> beautifyTrimmed 2 othersNullBlock
--  ++ createAllInternalStateCode "CheckTransition" states 
--    ++ removeFirstNewLine (beautify 1 (createAllFallingStateCode states codes trans targets vars))
--    +\> beautifyTrimmed 1 "end case;"
--    +\> "end if;"
--    ++ beautify 1 (createAllTransitionsCode states trans targets)
--   ++ removeFirstNewLine (beautify 2 (createReadSnapshot vars))
--    ++ removeFirstNewLine (beautify 1 (removeFirstNewLine (beautify 1 othersNullBlock)))
--    ++ "    end case;\nend if;"

shouldExecuteOnEntryCode :: String
shouldExecuteOnEntryCode = "if (previousRinglet /= currentState) then"
    +\-> "internalState <= OnEntry;"
    +\> "else"
    +\-> "internalState <= NoOnEntry;"
    +\> "end if;"

getSuspendedIndex :: [String] -> Int
getSuspendedIndex states = fromJust (elemIndex (toStateName "SUSPENDED") states)

createAllInRisingEdge :: String-> [String] -> [[String]] -> [[String]] -> [[String]] -> String -> [Bool] -> String
createAllInRisingEdge initialState states codes trans targets vars afters = "if (rising_edge(clk)) then"
    ++ beautify 1 "case internalState is"
    ++ beautifyTrimmed 2 (createReadSnapshot vars initialState)
    +\> beautifyTrimmed 2 (createAllInternalStateCodeWithDefault "OnSuspend" states (getActions codes 3) "internalState <= OnEntry;" afters ((getActions codes 3)!!(getSuspendedIndex states)))
    +\> beautifyTrimmed 2 (createAllInternalStateCodeWithDefault "OnResume" states (getActions codes 4) "internalState <= OnEntry;" afters ((getActions codes 4)!!(getSuspendedIndex states)))
    +\> beautifyTrimmed 2 ("when NoSuspendOrResume =>" +\> (beautifyTrimmed 1 shouldExecuteOnEntryCode))
    +\> beautifyTrimmed 2 (createAllInternalStateCode "OnEntry" states (getActions codes 0) "internalState <= CheckTransition;" afters)
    +\> beautifyTrimmed 2 (createAllInternalStateCode "CheckTransition" states (map (\(trans, trgs) -> createTransitionCode trans trgs) (zip trans targets)) "" afters)
    +\> beautifyTrimmed 2 (createAllInternalStateCode "Internal" states (getActions codes 1) "internalState <= WriteSnapshot;" afters)
    +\> beautifyTrimmed 2 (createAllInternalStateCode "OnExit" states (getActions codes 2) "internalState <= WriteSnapshot;" afters)
    +\> beautifyTrimmed 2 ("when NoOnEntry =>" +\-> "internalState <= CheckTransition;")
    +\> beautifyTrimmed 2 (createWriteSnapshot vars)
    +\> beautifyTrimmed 2 othersNullBlock 
    +\> beautifyTrimmed 1 "end case;"
    +\> "end if;"

--create process block
createProcessBlock :: String -> [String] -> [[String]] -> [[String]] -> [[String]] -> String -> [Bool] -> String
createProcessBlock initialState states codes transitions targets vars afters = "process (clk)\n    begin"
--  ++ beautify 2 (createSuspendedLogic)
    ++ beautify 2 (createAllInRisingEdge initialState states codes transitions targets vars afters) -- add removeFirstNewLine when adding suspend logic
--    ++ removeFirstNewLine (beautify 2 (createFallingEdge states codes transitions targets vars))
    ++ "    end process;"

--Create entire architecture block
createArchitecture :: [String] -> [Bool] -> [[String]] -> [[String]] -> [[String]] -> Int -> String -> String -> String -> String
createArchitecture states afters risingEdgeCode transitions targets size name vars firstState = 
    "architecture LLFSM of " ++ name ++ " is"
    ++ beautify 1 (createArchitectureVariables size (map toStateName states) vars (toStateName firstState))
    ++ "begin"
    +\> createProcessBlock firstState (map toStateName states) risingEdgeCode transitions targets vars afters
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
    ("port (" +\-> "clk: in std_logic;" +\-> "command: in std_logic_vector(1 downto 0);" +\-> "suspended: out std_logic;") xs) +\> ");"

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
createEntity includes name vars = "library IEEE;\nuse IEEE.std_logic_1164.All;\nuse IEEE.math_real.all;\n" ++ includes ++ "\n\nentity " ++ name ++ " is"
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
