-- LLFSMFormat.hs
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

module SpartanLLFSM_Format(
    getAllStates,
    hasInitialPseudostate,
    hasSuspended,
    getAllInternals,
    getAllTransCodeForAllStates,
    getAllTargets,
    getNumberOfTargets,
    getVariables,
    getIncludes,
    suspended,
    allTargetsToState,
    initialPseudostate,
    getInitialState
) where

import SpartanLLFSM_Strings
import SpartanLLFSM_IO
import Data.List
import Data.List.Split
import Data.Char

--Initial Pseudostate name.
initialPseudostate :: String
initialPseudostate = "InitialPseudoState"

--Suspended state name.
suspended :: String
suspended = "SUSPENDED"

--Checks the states for the initial pseudostate. If the pseudostate is not present, the program errors out.
hasInitialPseudostate :: [String] -> IO Bool
hasInitialPseudostate states | contains initialPseudostate states = return True
                             | otherwise                          = error ("No " ++ initialPseudostate ++ " State")

--Checks the states for the suspended state. If this state is not present, then the program will error out.
hasSuspended :: [String] -> IO Bool
hasSuspended states | contains suspended states = return True
                    | otherwise                 = error ("No " ++ suspended ++ " State")

--STATE CODE

--Gets a list of states from a string containing the states
getStates :: String -> [String]
getStates str = filter (\x -> not $ isWhitespace x) (map removeWhitespace (lines str))

-- io version of getStates
ioGetStates :: String -> IO [String]
ioGetStates str = return (getStates str)

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

getOnSuspend :: String -> String -> IO String
getOnSuspend dir state = getInternalStates dir state "OnSuspend"

getOnResume :: String -> String -> IO String
getOnResume dir state = getInternalStates dir state "OnResume"

--Gets all of the internal state code
getInternals :: String -> String -> IO [String]
getInternals dir state =  sequence ([getOnEntry dir state, getInternal dir state, getOnExit dir state, getOnSuspend dir state, getOnResume dir state])

--Gets all of the internal state code for all of the states
getAllInternals :: String -> [String] -> IO [[String]]
getAllInternals dir states = sequence $ map (getInternals dir) states

--Checks if a file contains "Transition" in the file name
hasTransitionInFileName :: String -> Bool
hasTransitionInFileName file = length (filter (\x -> x == "Transition") (splitOn "_" file)) > 0

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

--END STATE CODE

--TRANSITION CODE

--Gets the transitions for a given state
filterForState :: String -> [String] -> IO [String]
filterForState state trans = return (filter (\x -> hasState x state) trans)

--Gets the transitions for a given state from a directory
getTransitionsForState :: String -> String -> IO [String]
getTransitionsForState state dir = getAllTransitionFiles dir >>= (filterForState state)

getTransitionNumber :: String -> Integer
getTransitionNumber trans = read((splitOn ".expr" ((splitOn "Transition_" trans)!!1))!!0)

--Seperate files into transition files.
seperateTransitions :: String -> IO [String]
seperateTransitions files = return (sortBy (\x y -> compare (getTransitionNumber x) (getTransitionNumber y) ) (filter hasTransitionInFileName (lines files)))

--Gets the transition code for a given state
getTransCodeForState :: String -> String -> IO [String]
getTransCodeForState dir state = getTransitionsForState state dir >>= openAllTrans dir

--Gets the transition code for all states
getAllTransCodeForAllStates :: String -> [String] -> IO [[String]]
getAllTransCodeForAllStates dir states = sequence $ map (getTransCodeForState dir) states

--Gets the line that has transition n
getTargetTransitionLine :: Int -> String -> String
getTargetTransitionLine n contents =
    trim ((lines (splitOn "}" (splitOn "{" ((splitOn ("class Transition_" ++ (show n)) contents)!!1)!!1)!!0))!!2)

getTransitionSegment :: String -> String
getTransitionSegment transitionLine = (splitOn "= " ((splitOn ":"transitionLine)!!0))!!1

getTargetStateFromTransitionLine :: String -> String
getTargetStateFromTransitionLine transitionLine = trim ((splitOn ")" (getTransitionSegment transitionLine))!!0)

--Gets transition n
getTargetTransition :: Int -> String -> IO Int
getTargetTransition n contents = return $ (read (getTargetStateFromTransitionLine (getTargetTransitionLine n contents))::Int)
--    x : []-> return $ digitToInt x 
--    _      -> error ("Failed to get target for transition " ++ show n ++ " in line " +\-> trim (getTargetTransitionLine n contents)
--                +\> "Received:" +\-> getTargetStateFromTransitionLine (getTargetTransitionLine n contents) +\> "File:" +\> contents) 

--Gets the transition number from a file
readTargetTransition :: Int -> String -> IO Int
readTargetTransition n file = getFileContents file >>= getTargetTransition n

getInitialState :: String -> [String] -> IO String
getInitialState dir states = do
    hasIncorrectTransitions <- (getTransitionsForState initialPseudostate dir) >>= (\x -> return ( (length x) /= 1 && (map toLower (head x)) /= "true"))
    if hasIncorrectTransitions then 
        error ("Initial Pseudostate has too many transitions or non-true transition")
    else 
        (getTargetsForState dir initialPseudostate 1) >>= (\x -> return $ head $ targetToState states x)

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
