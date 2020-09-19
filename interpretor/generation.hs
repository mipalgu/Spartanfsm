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
    doesStateHaveAfter,
    createMachineComment
) where

import SpartanLLFSM_Strings
import Data.List.Split
import SpartanLLFSM_Helpers
import SpartanLLFSM_Format
import SpartanLLFSM_Variables
import Data.Char
import Data.List
import Data.Maybe

-- VHDL CODE

--The default comment located at the top of a generated machine .vhd file.
createMachineComment :: String -> String -> String -> String -> String -> String
createMachineComment name time author email license = fullCommentBlock name time +\?> authorAndEmailComment author email +\> license +\> "--"

authorAndEmailComment :: String -> String -> String
authorAndEmailComment author email = authorComment author +\?> emailComment email +?> "\n--" 

authorComment :: String -> String
authorComment author =  "--Author: " +?> author

emailComment :: String -> String
emailComment email = "--Email: " +?> email

fullCommentBlock :: String -> String -> String
fullCommentBlock name time = "--" ++ name ++ ".vhd" +\> commentBlock +\> "--Date Generated:" ++> time +\> "--"

commentBlock :: String
commentBlock = "--\n--This is a generated file - DO NOT ALTER." +\> "--Please use an LLFSM editor to change this file."

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
setTargetState state = targetState ++> "<=" ++> toStateName state ++ ";" +\> internalState ++> "<=" ++> onExit ++ ";"

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
        ++ (beautify 1 $ setTargetState s) ++ "else" +\-> internalState ++> "<=" ++> internal ++ ";\nend if;" 
    | n == 0           = "if (" ++ ts!!n ++ ") then" ++ (beautify 1 $ setTargetState s)
    | n == m           = "elsif " ++ (buildCondition n ts) ++" then"
        ++ (beautify 1 $ setTargetState s) ++ "else" +\-> internalState ++> "<=" ++> internal ++ ";\nend if;"
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
    "when" ++> checkTransition ++> "=>" ++ (beautify 1 (createTransitionCode transitions targetStates))

-- Internal state representation
internalStateVhdl :: String
internalStateVhdl =
    "--Internal State Representation Bits"
    +\> "constant" ++> readSnapshot ++ ": std_logic_vector(3 downto 0) := \"0000\";"
    +\> "constant" ++> onSuspend ++ ": std_logic_vector(3 downto 0) := \"0001\";"
    +\> "constant" ++> onResume ++ ": std_logic_vector(3 downto 0) := \"0010\";"
    +\> "constant" ++> onEntry ++ ": std_logic_vector(3 downto 0) := \"0011\";"
    +\> "constant" ++> noOnEntry ++ ": std_logic_vector(3 downto 0) := \"0100\";"
    +\> "constant" ++> checkTransition ++ ": std_logic_vector(3 downto 0) := \"0101\";"
    +\> "constant" ++> onExit ++ ": std_logic_vector(3 downto 0) := \"0110\";"
    +\> "constant" ++> internal ++ ": std_logic_vector(3 downto 0) := \"0111\";"
    +\> "constant" ++> writeSnapshot ++ ": std_logic_vector(3 downto 0) := \"1000\";"
    +\> "signal" ++> internalState ++ ": std_logic_vector(3 downto 0) :=" ++> readSnapshot ++ ";\n"

-- Get number of bits to represent the states in dir
getNumberOfBits :: String -> IO Int
getNumberOfBits dir = getAllStates dir >>= (\x -> return (length x)) >>= (\y -> return (numberOfBits y)) 

-- Create binary representation of a state.
createCurrentState :: String -> Int -> String
createCurrentState firstState bits =
    "signal" ++> currentState ++ ": std_logic_vector(" ++ (show (bits - 1)) ++ " downto 0) := " ++ firstState ++ ";\n"

-- Code to create targetState signal.
createTargetState :: Int -> String
createTargetState bits = "signal" ++> targetState ++ ": std_logic_vector(" ++ (show (bits - 1)) ++ " downto 0) :=" ++> currentState ++ ";\n"

--Code to create previousRinglet signal.
createPreviousRinglet :: Int -> String -> String
createPreviousRinglet bits initialState
  = "signal" ++> previousRinglet ++ ": std_logic_vector(" ++ (show (bits - 1)) ++ " downto 0) := "
    ++ initialState ++ " xor \"" ++ (ones bits) ++ "\";\n"

--Creates the suspendedFrom architecture signal.
createSuspendedFrom :: Int -> String -> String
createSuspendedFrom bits initialState = "signal " ++ suspendedFrom ++ ": std_logic_vector(" ++ (show (bits - 1)) ++> "downto 0) := " ++ initialState ++ ";\n"

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

createCommandDeclaration :: String -> String -> String
createCommandDeclaration cmd val = "constant" ++> cmd ++ ": std_logic_vector(1 downto 0) := \"" ++ val ++ "\";"

suspensionConstants :: String
suspensionConstants = createCommandDeclaration (toCommand restart) "00"
    +\> createCommandDeclaration (toCommand suspend) "01"
    +\> createCommandDeclaration (toCommand resume) "10"
    +\> createCommandDeclaration (toCommand SpartanLLFSM_Variables.null) "11"

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

after_nsReplace :: String -> String
after_nsReplace val = convertAfter val ringletsPerNs 

after_usReplace :: String -> String
after_usReplace val = convertAfter val ringletsPerUs

after_msReplace :: String -> String
after_msReplace val = convertAfter val ringletsPerMs

afterReplace :: String -> String
afterReplace val = convertAfter val ringletsPerS

getValueStr :: String -> String -> String
getValueStr str after = init (tail (getValueBit after str))

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
                  | otherwise       = removeLastFromString str 2 == "after("

matchString :: String -> Bool 
matchString str | length str /= 8 = False
                | otherwise       = isSmallAfter str || isNormalAfter str

findValueAndCarry :: String -> String -> String -> String
findValueAndCarry str carry allButCarry
  = replaceString (removeFirstFromString str (2 + length (findValueInBrackets str "" 0))) "" (allButCarry ++ (convertAfterToVHDLVariable carry (findValueInBrackets str "" 0)))


replaceString :: String -> String -> String -> String
replaceString str carry allButCarry
  | length carry > 8      = replaceString str (tail carry) (allButCarry ++ [head carry])
  | length carry == 8 &&
      isSmallAfter carry  = findValueAndCarry str carry allButCarry
  | length carry == 8 &&
      isNormalAfter carry = findValueAndCarry ((sliceString 5 7 carry) ++ str) (removeLastFromString carry 3) allButCarry     
  | str == ""             = allButCarry ++ carry
  | otherwise             = replaceString (tail str) (carry ++ [head str]) allButCarry

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

toDecimal :: String -> String
toDecimal str 
  | readInt str /= Nothing       = str ++ ".0"
  | readDouble str /= Nothing    = str
  | otherwise                    = "(" ++ str ++ ")"

convertAfter :: String -> String -> String
convertAfter value variable = ringletCounter ++>  ">= integer(ceil(" ++ toDecimal value ++ " * " ++ variable ++ "))"

convertAfterToVHDLVariable :: String -> String -> String
convertAfterToVHDLVariable afterStr valueStr
    | isAfter afterStr   = convertAfter valueStr ringletsPerS 
    | isAfterMs afterStr = convertAfter valueStr ringletsPerMs
    | isAfterUs afterStr = convertAfter valueStr ringletsPerUs
    | isAfterNs afterStr = convertAfter valueStr ringletsPerUs
    | otherwise          = error ("Failed to convert after str. candidate: " ++ afterStr ++ "(" ++ valueStr ++ ")")

counterVariables :: String
counterVariables = "shared variable ringlet_counter: natural := 0;"
    +\> "constant" ++> clockPeriod ++ ": real := 20.0;"
    +\> "constant" ++> ringletLength ++ ": real := 5.0 *" ++> clockPeriod ++ ";"
    +\> "constant" ++> ringletsPerNs ++ ": real := 1.0 /" ++> ringletLength ++ ";"
    +\> "constant" ++> ringletsPerUs ++ ": real := 1000.0 *" ++>  ringletsPerNs ++ ";"
    +\> "constant" ++> ringletsPerMs ++ ": real := 1000000.0 *" ++> ringletsPerNs ++ ";"
    +\> "constant" ++> ringletsPerS ++ ": real := 1000000000.0 *" ++> ringletsPerNs ++ ";"

suspensionLogic :: String -> String -> String
suspensionLogic initialState suspendedState = "if (" ++ command ++> "=" ++> toCommand restart ++> "and" ++> currentState ++> "/=" ++> toStateName initialState ++ ") then"
    +\-> currentState ++> "<= " ++ toStateName initialState ++ ";"
    +\-> suspended ++> "<= '0';"
    +\-> suspendedFrom ++> "<=" ++> toStateName initialState ++ ";"
    +\-> targetState ++> "<=" ++> toStateName initialState ++ ";"
    +\-> "if (" ++ previousRinglet ++> "=" ++> toStateName suspendedState ++ ") then"
    +\-> tab ++ internalState ++> "<=" ++> onResume ++ ";"
    +\-> "else"
    +\-> tab ++ internalState ++> "<=" ++> onEntry ++ ";"
    +\-> "end if;"
    +\>  "elsif (" ++ command ++> "=" ++> toCommand resume ++> "and" ++> currentState ++> "=" ++> toStateName suspendedState ++> "and" ++> suspendedFrom ++> "/=" ++> toStateName suspendedState ++ ") then"
    +\-> suspended ++> "<= '0';"
    +\-> currentState ++> "<=" ++> suspendedFrom ++ ";"
    +\-> internalState ++> "<=" ++> onResume ++ ";"
    +\-> targetState ++> "<=" ++> suspendedFrom ++ ";"
    +\>  "elsif (" ++ command ++> "=" ++> toCommand suspend ++> "and" ++> currentState ++> "/=" ++> toStateName suspendedState ++ ") then"
    +\-> suspendedFrom ++> "<=" ++> currentState ++ ";"
    +\-> suspended ++> "<= '1';"
    +\-> currentState ++> "<=" ++> toStateName suspendedState ++ ";"
    +\-> internalState ++> "<=" ++> onSuspend ++ ";"
    +\-> targetState ++> "<=" ++> toStateName suspendedState ++ ";"
    +\>  "elsif (" ++ currentState ++> "=" ++> toStateName suspendedState ++ ") then"
    +\->  suspended ++> "<= '1';"
    +\-> "if (" ++ previousRinglet ++> "/=" ++> toStateName suspendedState ++ ") then"
    +\-> tab ++ internalState ++> "<=" ++> onSuspend ++ ";"
    +\-> "else"
    +\-> tab ++ internalState ++> "<=" ++> noOnEntry ++ ";"
    +\-> "end if;"
    +\> "elsif (" ++ previousRinglet ++> "=" ++> toStateName suspendedState ++ ") then"
    +\-> internalState ++> "<=" ++> onResume ++ ";"
    +\-> suspended ++> "<= '0';"
    +\-> suspendedFrom ++> "<=" ++> currentState ++ ";"
    +\> "else"
    +\-> suspended ++> "<= '0';"
    +\-> suspendedFrom ++> "<=" ++> currentState ++ ";"
    +\-> "if (" ++ previousRinglet ++> "/=" ++> currentState ++ ") then"
    +\-> tab ++ internalState ++> "<=" ++> onEntry ++ ";"
    +\-> "else"
    +\-> tab ++ internalState ++> "<=" ++> noOnEntry ++ ";"
    +\-> "end if;"
    +\>  "end if;"

-- Creates the code for all var that reads the external variables into snapshot variables
createReadCode :: String -> String
createReadCode vars 
  = foldl (+\>) "" $ map (\s -> createReadLine (getExternalVarName s)) $ getInputExternalVars vars

-- Creates the ReadSnapshot section of the VHDL source file
createReadSnapshot :: String -> String -> String -> String
createReadSnapshot vars initialState suspendedState = createStateCode readSnapshot (createReadCode vars) (suspensionLogic initialState suspendedState)

--Creates the code for writing a single snapshot variable to an external variable
createWriteLine :: String -> String
createWriteLine varName = toExternalName varName ++ " <= " ++ varName ++ ";"

-- Creates all the code for writing the snapshot variables to their respective external variables
createWriteCode :: String -> String
createWriteCode vars
  = foldl (+\>) "" $ map (\s -> createWriteLine (getExternalVarName s)) $ getOutputExternalVars vars

-- Creates the transition code for the WriteSnapshot section
createWriteTransition :: String
createWriteTransition  = internalState ++> "<=" ++> readSnapshot ++ ";"
    +\> previousRinglet ++> "<=" ++> currentState ++ ";"
    +\> currentState ++> "<=" ++> targetState ++ ";"

-- Creates the WriteSnapshot section
createWriteSnapshot :: String -> String
createWriteSnapshot vars = createStateCode writeSnapshot (createWriteCode vars) createWriteTransition

-- Create onEntry code
createOnEntry :: String -> String
createOnEntry code = createStateCode onEntry code (internalState ++> "<=" ++> checkTransition ++ ";")

-- Create Internal code
createInternal :: String -> String
createInternal code = createStateCode internal code (internalState ++> "<=" ++> writeSnapshot ++ ";")

-- Create onExit code
createOnExit :: String -> String
createOnExit code = createStateCode onExit code (internalState ++> "<=" ++> writeSnapshot ++ ";")

--creates internalStates code for a single state.
createRisingSingleState :: String -> [String] -> String -> String
createRisingSingleState state code vars = tab ++ "when" ++> state ++> "=>" +\-> tab ++ "case" ++> internalState ++> "is"
    ++ (beautify 3 (createOnEntry (code!!0) ++ (createWriteSnapshot vars) ++ othersNullBlock))
    ++ tab ++ tab ++ "end case;\n" 

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

-- Create Rising edge code
createRisingEdge :: [String] -> [[String]] -> String -> String
createRisingEdge states codes vars = "if (rising_edge(" ++ clk ++ ")) then"
    ++ beautify 1 "case currentState is"
    ++ removeFirstNewLine (createAllRisingStateCode states codes vars)
    ++ tab ++ "end case;\nend if;"

createCodeForState :: String -> String -> Bool -> String -> String -> String 
createCodeForState state code hasAfter internalState suspendedState
    | hasAfter && internalState == onEntry     = "when" ++> state ++> "=>" +\> beautifyTrimmed 1 (code +\> ringletCounter ++> ":= 0;")
    | hasAfter && internalState == internal    = "when" ++> state ++> "=>" +\> beautifyTrimmed 1 (code +\> ringletCounter ++> ":=" ++> ringletCounter ++> "+ 1;")
    | code == ""                               = ""
    | internalState == onSuspend
        && state == toStateName suspendedState = ""
    | internalState == onResume
        && state == toStateName suspendedState = ""
    | hasAfter && internalState == onResume    = "when" ++> state ++> "=>" +\> beautifyTrimmed 1 (code +\> ringletCounter ++> ":= 0;")
    | otherwise                                = "when " ++ state ++ " =>" +\> beautifyTrimmed 1 code

onlyValidNewLine :: String -> String -> String
onlyValidNewLine str1 str2 | str1 == "" && str2 == "" = ""
                           | otherwise                = trimNewLines (str1 +\> str2)

createAllInternalStateCodeWithStateVar :: String -> [String] -> [String] -> String -> [Bool] -> String -> String -> String 
createAllInternalStateCodeWithStateVar internalState states codes trailer afters stateVar suspendedState =
    "when " ++ internalState ++> "=>" +\> beautifyTrimmed 1 ("case " ++ stateVar ++>  "is"
    +\> beautifyTrimmed 1 (trimNewLines (foldl onlyValidNewLine "" (map (\(a, (s,c)) -> createCodeForState s c a internalState suspendedState) $ zip afters (zip states codes)))
    +\> othersNullBlock) +\> "end case;" +\> trailer)

createAllInternalStateCode :: String -> [String] -> [String] -> String -> [Bool] -> String -> String 
createAllInternalStateCode internalState states codes trailer afters suspendedState =
    let var = if internalState == onSuspend then suspendedFrom else currentState
    in createAllInternalStateCodeWithStateVar internalState states codes trailer afters var suspendedState

setToDefault :: String -> String -> String
setToDefault str def | str == "" = def
                     | otherwise = str

getActions :: [[String]] -> Int -> [String]
getActions codes index = map (\x -> x!!index) codes

emptyStringLists :: Int -> [String]
emptyStringLists size = emptyStringListsCarry size []
    where emptyStringListsCarry :: Int -> [String] -> [String]
          emptyStringListsCarry size carry | size <= 0 = carry
                                           | otherwise = emptyStringListsCarry (size - 1) ("" : carry)

getSuspendedIndex :: [String] -> String -> Int
getSuspendedIndex states suspendedState = fromJust (elemIndex (toStateName suspendedState) states)

createMergedActions :: [[String]] -> [String] -> [[String]]
createMergedActions stateActions suspendedActions = map (\as -> [as!!0, as!!1, as!!2, (as!!3 +\?> suspendedActions!!0), (suspendedActions!!4 +\?> as!!4 +\?> as!!0)]) stateActions

createAllInRisingEdge :: String-> String -> [String] -> [[String]] -> [[String]] -> [[String]] -> String -> [Bool] -> String
createAllInRisingEdge initialState suspendedState states codes trans targets vars afters =
    let index = getSuspendedIndex states suspendedState
        suspendedActions = codes!!index
        actions = createMergedActions codes suspendedActions
        internalToCheckTrans = internalState ++> "<=" ++> checkTransition ++ ";"
        internalToWriteSnapshot = internalState ++> "<=" ++> writeSnapshot ++ ";"
    in
    "if (rising_edge(" ++ clk ++ ")) then"
    ++ beautify 1 ("case" ++> internalState ++> "is")
    ++ beautifyTrimmed 2 (createReadSnapshot vars initialState suspendedState)
    +\> beautifyTrimmed 2 (createAllInternalStateCode onSuspend states (getActions actions 3) internalToCheckTrans afters suspendedState) 
    +\> beautifyTrimmed 2 (createAllInternalStateCode onResume states (getActions actions 4) internalToCheckTrans afters suspendedState)
    +\> beautifyTrimmed 2 (createAllInternalStateCode onEntry states (getActions actions 0) internalToCheckTrans afters suspendedState)
    +\> beautifyTrimmed 2 ("when" ++> noOnEntry ++> "=>" +\-> internalToCheckTrans)
    +\> beautifyTrimmed 2 (createAllInternalStateCode checkTransition states (map (\(trans, trgs) -> createTransitionCode trans trgs) (zip trans targets)) "" afters suspendedState)
    +\> beautifyTrimmed 2 (createAllInternalStateCode internal states (getActions actions 1) internalToWriteSnapshot afters suspendedState)
    +\> beautifyTrimmed 2 (createAllInternalStateCode onExit states (getActions actions 2) internalToWriteSnapshot afters suspendedState)
    +\> beautifyTrimmed 2 (createWriteSnapshot vars)
    +\> beautifyTrimmed 2 othersNullBlock 
    +\> beautifyTrimmed 1 "end case;"
    +\> "end if;"

--create process block
createProcessBlock :: String -> String -> [String] -> [[String]] -> [[String]] -> [[String]] -> String -> [Bool] -> String
createProcessBlock initialState suspendedState states codes transitions targets vars afters = "process (" ++ clk ++ ")" +\-> "begin"
--  ++ beautify 2 (createSuspendedLogic)
    ++ beautify 2 (createAllInRisingEdge initialState suspendedState states codes transitions targets vars afters) -- add removeFirstNewLine when adding suspend logic
--    ++ removeFirstNewLine (beautify 2 (createFallingEdge states codes transitions targets vars))
    +-> "end process;"

--Create entire architecture block
createArchitecture :: [String] -> [Bool] -> [[String]] -> [[String]] -> [[String]] -> Int -> String -> String -> String -> String -> String
createArchitecture states afters risingEdgeCode transitions targets size name vars firstState suspendedState = 
    "architecture LLFSM of " ++ name ++ " is"
    ++ beautify 1 (createArchitectureVariables size (map toStateName states) vars (toStateName firstState))
    ++ "begin"
    +\> createProcessBlock firstState suspendedState (map toStateName states) risingEdgeCode transitions targets vars afters
    +\> "end LLFSM;"

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
    ("port (" +\-> clk ++ ": in std_logic;" +\-> command ++ ": in std_logic_vector(1 downto 0);" +\-> suspended ++ ": out std_logic;") xs) +\> ");"

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
