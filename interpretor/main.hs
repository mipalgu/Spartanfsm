collectInternals :: String -> String -> (IO String, IO String, IO String, IO String)
collectInternals state dir = (return state, getOnEntry dir state, getInternal dir state, getOnExit dir state)

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

getStates :: String -> [String]
getStates str = filter (\x -> not $ isWhitespace x) (map removeWhitespace (lines str))

ioGetStates :: String -> IO [String]
ioGetStates str = return (getStates str)

getFileContents :: String -> IO String
getFileContents path = readFile path >>= ioTrim

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

tab :: String
tab = "    "

beautifyLine :: Int -> String -> String
beautifyLine n str | n <= 0    = str
                   | otherwise = beautifyLine (n-1) (tab ++ str)

beautify :: Int -> String -> String
beautify n str = foldl (\x y -> x ++ "\n" ++ y)  "" (map (\x -> beautifyLine n x) (lines str)) ++ "\n"

numberOfBits :: Integer -> Integer
numberOfBits num = calc num 0
    where
        calc :: Integer -> Integer -> Integer
        calc num n | num == 1  = 1
                   | num < 0   = error "Number must be positive"
                   | num > 2^n = calc num (n+1)
                   | otherwise = n


