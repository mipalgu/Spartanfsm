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
trim str = case str of
    cs     | isWhitespace cs            -> ""
           | isCharWhitespace (head cs) -> trim $ tail cs
           | isCharWhitespace (last cs) -> trim $ init cs
           | otherwise                  -> str

ioTrim :: String -> IO String
ioTrim str = return (trim str) 

getStates :: String -> [String]
getStates str = filter (\x -> not $ isWhitespace x) (map removeWhitespace (lines str))

ioGetStates :: String -> IO [String]
ioGetStates str = return (getStates str)

getFileContents :: String -> IO String
getFileContents path = readFile path >>= ioTrim

wrap :: a -> IO a
wrap = return

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
