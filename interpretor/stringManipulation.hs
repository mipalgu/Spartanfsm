-- stringManipulation.hs
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

module SpartanLLFSM_Strings(
    trim,
    ioTrim,
    contains,
    isWhitespace,
    removeWhitespace,
    (+\>),
    (+\->),
    (++>),
    (+?>),
    (+\?>),
    tab,
    beautify,
    removeFirstNewLine,
    getLocalTimeString,
    getYear,
    beautifyTrimmed,
    trimNewLines,
    isEmpty
) where

import Data.Time

--STRING FORMATING

--Returns a formatted string containing the local time and timezone.
getLocalTimeString :: IO String
getLocalTimeString = do
    ZonedTime (LocalTime day (TimeOfDay hour min sec)) (TimeZone mins isSummer name) <- getZonedTime 
    return $ (showGregorian day) ++> (to24hrTime hour) ++ ":" ++ (to24hrTime min) ++> name

--Converts an Int to a String suitable for 24 hour time. This includes the leading 0 for single digit values.
to24hrTime :: Int -> String
to24hrTime time | time < 10 = "0" ++ (show time)
                | otherwise = show time

getYear :: IO String
getYear = do
    ZonedTime (LocalTime date (TimeOfDay hour min sec)) (TimeZone mins isSummer name) <- getZonedTime
    (year, month, day) <- return $ toGregorian date 
    return (show year)

--Checks a list contains an element.
contains :: Eq a => a -> [a] -> Bool
contains x xs = length (filter (\i -> i == x) xs) /= 0

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

--Operator to concatenate strings with a tab in between them
infixl 2 +->
(+->) :: String -> String -> String
str1 +-> str2 = str1 ++ tab ++ str2

--Operator to concatenate strings with a new line and a tab in between them
infixl 2 +\->
(+\->) :: String -> String -> String
str1 +\-> str2 | str1 == "" = str2
               | str2 == "" = str1
               | otherwise  = str1 +\> "" +-> str2

infixl 2 +?>
(+?>) :: String -> String -> String
str1 +?> str2 | str1 == "" || str2 == "" = ""
              | otherwise                = str1 ++ str2

infixl 2 +\?>
(+\?>) :: String -> String -> String
str1 +\?> str2 | str1 == "" = str2
               | str2 == "" = str1
               | otherwise  = str1 +\> str2

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

beautifyTrimmed :: Int -> String -> String
beautifyTrimmed n str | n <= 0    = str
                      | otherwise = removeAllTrailingNewLines (removeAllLeadingNewLines (beautify n str))

--A tab is defined as 4 spaces
tab :: String
tab = "    "

--Removes a new line character from the front of a string if it has one
removeFirstNewLine :: String -> String
removeFirstNewLine str | str == []        = str
                       | head str == '\n' = tail str
                       | otherwise        = str

removeAllLeadingNewLines :: String -> String
removeAllLeadingNewLines str | str == []        = str 
                             | head str == '\n' = removeAllLeadingNewLines (tail str)
                             | otherwise        = str

removeAllTrailingNewLines :: String -> String
removeAllTrailingNewLines str | str == []        = str
                              | last str == '\n' = removeAllTrailingNewLines (init str)
                              | otherwise        = str

trimNewLines :: String -> String
trimNewLines str = removeAllLeadingNewLines (removeAllTrailingNewLines str)

isEmpty :: String -> IO Bool
isEmpty str = return (str == "")

--END STRING FORMATTING
