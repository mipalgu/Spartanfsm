import System.Process
import Data.List.Split
import Data.List
import Data.Char
import System.Environment
import System.Directory
import SpartanLLFSM_IO
import SpartanLLFSM_Strings
import SpartanLLFSM_Format
import SpartanLLFSM_VHDLGeneration
import SpartanLLFSM_License

main :: IO ()
main = do
    args <- getArgs
    dir <- return $ if last (head args) == '/' then init (head args) else head args
    states <- getAllStates dir
    projectName <- return $ getProjectName dir
    initialState <- getInitialState dir projectName states 
    suspendedState <- getSuspendedState dir projectName states
    internals <- getAllInternals dir states
    transitions <- getAllTransCodeForAllStates dir states
    afters <- return $ map doesStateHaveAfter transitions
    numberOfTargets <- return $ getNumberOfTargets states transitions
    targets <- getAllTargets dir states numberOfTargets
    targetStates <- return $ allTargetsToState states targets
    stateBitSize <- getNumberOfBits dir
    variables <- getVariables dir projectName
    architecture <- return $ createArchitecture states afters internals transitions targetStates stateBitSize projectName variables initialState suspendedState
    includes <- getIncludes dir projectName
    entity <- return $ createEntity includes projectName variables
    timeString <- getLocalTimeString
    author <- getAuthor
    email <- getEmail
    licenseType <- return $ "mit"
    year <- getYear
    license <- return $ getLicense licenseType author email year
    writeFile (projectName ++ ".vhd") (createMachineComment projectName timeString author email license ++ "\n\n" ++ entity ++ "\n\n" ++ architecture)


--Gets project name by inspecting the folder structure
getProjectName :: String -> String
getProjectName dir = head (splitOn ".machine" (last (filter (\x -> x /= "") (splitOn "/" dir))))


