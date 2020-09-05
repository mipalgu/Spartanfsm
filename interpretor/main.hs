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
    internals <- getAllInternals dir states
    transitions <- getAllTransCodeForAllStates dir states
    numberOfTargets <- return $ getNumberOfTargets states transitions
    targets <- getAllTargets dir states numberOfTargets
    targetStates <- return $ allTargetsToState states targets
    stateBitSize <- getNumberOfBits dir
    projectName <- return $ getProjectName dir
    variables <- getVariables dir projectName
    putStrLn (show transitions)
   -- putStrLn (show targetStates)
   -- putStrLn (show states)
    architecture <- return $ createArchitecture states internals transitions targetStates stateBitSize projectName variables
    includes <- getIncludes dir projectName
    entity <- return $ createEntity includes projectName variables
    timeString <- getLocalTimeString
    writeFile (projectName ++ ".vhd") (createMachineComment projectName timeString ++ "\n\n" ++ entity ++ "\n\n" ++ architecture)


--Gets project name by inspecting the folder structure
getProjectName :: String -> String
getProjectName dir = head (splitOn ".machine" (last (filter (\x -> x /= "") (splitOn "/" dir))))


--Creates the VHDL code to check whether a machine has been suspended or not.
createSuspendedLogic :: String
createSuspendedLogic =
    "if (suspended = '1' and restart /= '1' and currentState /= " ++ toStateName suspended ++ ") then"
    +\-> "suspendedFrom <= currentState;" +\-> "currentState <= " ++ toStateName suspended ++ ";"
    +\-> "previousInternal <= internalState;" +\-> "internalState <= OnEntry;"
    +\> "elsif (suspended = '0' and currentState = " ++ toStateName suspended ++ ") then"
    +\-> "internalState <= previousInternal;" +\-> "currentState <= suspendedFrom;"
    +\> "elsif (suspended = '1' and restart = '1') then"
    +\-> "restart <= '0';" +\-> "suspended <= '0';" +\-> "currentState <= " ++ toStateName initialPseudostate ++ ";"
    +\-> "internalState <= OnEntry;"
    +\> "elsif (restart = '1' and suspended = '0') then"
    +\-> "restart <= '0';"
    +\> "end if;"

--The default comment located at the top of a generated machine .vhd file.
createMachineComment :: String -> String -> String
createMachineComment name time =
    "--" ++ name ++ ".vhd" +\> "--\n--This is a generated file - DO NOT ALTER." +\> "--Please use an LLFSM editor to change this file."
    +\> "--Date Generated:" ++> time +\> "--"
