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

main :: IO ()
main = do
    args <- getArgs
    dir <- return $ if last (head args) == '/' then init (head args) else head args
    states <- getAllStates dir
    hasInitialPseudostate states
    hasSuspended states
    initialState <- getInitialState dir states
    internals <- getAllInternals dir states
    transitions <- getAllTransCodeForAllStates dir states
    afters <- return $ map doesStateHaveAfter transitions
    numberOfTargets <- return $ getNumberOfTargets states transitions
    targets <- getAllTargets dir states numberOfTargets
    targetStates <- return $ allTargetsToState states targets
    stateBitSize <- getNumberOfBits dir
    projectName <- return $ getProjectName dir
    variables <- getVariables dir projectName
    architecture <- return $ createArchitecture states afters internals transitions targetStates stateBitSize projectName variables initialState
    includes <- getIncludes dir projectName
    entity <- return $ createEntity includes projectName variables
    timeString <- getLocalTimeString
    writeFile (projectName ++ ".vhd") (createMachineComment projectName timeString ++ "\n\n" ++ entity ++ "\n\n" ++ architecture)


--Gets project name by inspecting the folder structure
getProjectName :: String -> String
getProjectName dir = head (splitOn ".machine" (last (filter (\x -> x /= "") (splitOn "/" dir))))

--The default comment located at the top of a generated machine .vhd file.
createMachineComment :: String -> String -> String
createMachineComment name time =
    "--" ++ name ++ ".vhd" +\> "--\n--This is a generated file - DO NOT ALTER." +\> "--Please use an LLFSM editor to change this file."
    +\> "--Date Generated:" ++> time +\> "--"
