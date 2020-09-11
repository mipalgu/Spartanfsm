--SonarPlatform.vhd
--
--This is a generated file - DO NOT ALTER.
--Please use an LLFSM editor to change this file.
--Date Generated: 2020-09-11 23:22 AEST
--

library IEEE;
use IEEE.std_logic_1164.All;


entity SonarPlatform is
    generic (
        numberOfSensors: positive
    );
    port (
        clk: in std_logic;
        restart: in std_logic;
        resume: in std_logic;
        suspend: in std_logic;
        suspended: out std_logic;
        EXTERNAL_distance: out std_logic_vector(15 downto 0);
        EXTERNAL_triggers: out std_logic_vector(numberOfSensors - 1 downto 0);
        EXTERNAL_echos: inout std_logic_vector(numberOfSensors - 1 downto 0)
    );
end SonarPlatform;

architecture LLFSM of SonarPlatform is
    --Internal State Representation Bits
    constant OnEntry: std_logic_vector(2 downto 0) := "000";
    constant CheckTransition: std_logic_vector(2 downto 0) := "001";
    constant OnExit: std_logic_vector(2 downto 0) := "010";
    constant Internal: std_logic_vector(2 downto 0) := "011";
    constant ReadSnapshot: std_logic_vector(2 downto 0) := "100";
    constant WriteSnapshot: std_logic_vector(2 downto 0) := "101";
    constant NoOnEntry: std_logic_vector(2 downto 0) := "110";
    constant CheckForSuspension: std_logic_vector(2 downto 0) := "111";
    signal internalState: std_logic_vector(2 downto 0) := ReadSnapshot;
    --State Representation Bits
    constant STATE_Initial: std_logic_vector(2 downto 0) := "000";
    constant STATE_SUSPENDED: std_logic_vector(2 downto 0) := "001";
    constant STATE_InitialPseudoState: std_logic_vector(2 downto 0) := "010";
    constant STATE_StartSensors: std_logic_vector(2 downto 0) := "011";
    constant STATE_WaitTillFinished: std_logic_vector(2 downto 0) := "100";
    constant STATE_StartFusion: std_logic_vector(2 downto 0) := "101";
    constant STATE_SetMinimum: std_logic_vector(2 downto 0) := "110";
    constant STATE_FindMinimum: std_logic_vector(2 downto 0) := "111";
    signal currentState: std_logic_vector(2 downto 0) := STATE_Initial;
    signal targetState: std_logic_vector(2 downto 0) := currentState;
    signal previousRinglet: std_logic_vector(2 downto 0) := STATE_Initial xor "111";
    signal suspendedFrom: std_logic_vector(2 downto 0) := STATE_Initial;
    --Snapshot of External Variables
    signal distance: std_logic_vector(15 downto 0);
    signal triggers: std_logic_vector(numberOfSensors - 1 downto 0);
    signal echos: std_logic_vector(numberOfSensors - 1 downto 0);
    --Machine Variables
    signal smallestDistance: std_logic_vector(15 downto 0);
    signal sensorRestart: std_logic;
    signal sensorsSuspended: std_logic_vector(numberOfSensors - 1 downto 0);
    constant allSuspended: std_logic_vector(numberOfSensors - 1 downto 0) := (others => '1');
    signal sensorFusionRestart: std_logic;
    signal sensorFusionSuspend: std_logic;
    signal sensorSuspend: std_logic;
    signal sensorFusionSuspended: std_logic;
    signal allOutputs: std_logic_vector(numberOfSensors * sensorOutputSize - 1 downto 0);
begin
process (clk)
    begin
        if (rising_edge(clk)) then
            case internalState is
                when CheckForSuspension =>
                    if (restart = '0') then
                        currentState <= STATE_Initial;
                        suspended <= '0';
                        suspendedFrom <= STATE_Initial;
                    elsif (resume = '1' and currentState = STATE_SUSPENDED and suspendedFrom /= STATE_SUSPENDED) then
                        suspended <= '0';
                        currentState <= suspendedFrom;
                    elsif (suspend = '1' and currentState /= STATE_SUSPENDED) then
                        suspendedFrom <= currentState;
                        suspended <= '1';
                        currentState <= STATE_SUSPENDED;
                    elsif (currentState = STATE_SUSPENDED) then
                        suspended <= '1';
                    else
                        suspended <= '0';
                        suspendedFrom <= currentState;
                    end if;
                    internalState <= ReadSnapshot;
                when ReadSnapshot =>
                    echos <= EXTERNAL_echos;
                    if (previousRinglet = currentState) then
                        internalState <= NoOnEntry;
                    else
                        internalState <= OnEntry;
                    end if;
                when OnEntry =>
                    case currentState is
                        when STATE_Initial =>
                            sensorRestart <= '1';
                            sensorSuspend <= '1';
                        when STATE_StartSensors =>
                            sensorRestart <= '0';
                        when STATE_WaitTillFinished =>
                            sensorRestart <= '1';
                        when STATE_StartFusion =>
                            sensorFusionRestart <= '0';
                            sensorFusionSuspend <= '0';
                        when STATE_SetMinimum =>
                            distance <= smallestDistance;
                        when STATE_FindMinimum =>
                            sensorFusionRestart <= '1';
                        when others =>
                            null;
                    end case;
                    internalState <= CheckTransition;
                when CheckTransition =>
                    case currentState is
                        when STATE_Initial =>
                            if (sensorsSuspended = allSuspended) then
                                targetState <= STATE_StartSensors;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_SUSPENDED =>
                            internalState <= Internal;
                        when STATE_InitialPseudoState =>
                            if (true) then
                                targetState <= STATE_Initial;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_StartSensors =>
                            if (sensorsSuspended /= allSuspended) then
                                targetState <= STATE_WaitTillFinished;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_WaitTillFinished =>
                            if (sensorsSuspended = allSuspended) then
                                targetState <= STATE_StartFusion;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_StartFusion =>
                            if (true) then
                                targetState <= STATE_FindMinimum;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_SetMinimum =>
                            if (true) then
                                targetState <= STATE_SUSPENDED;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_FindMinimum =>
                            if (sensorFusionSuspended = '1') then
                                targetState <= STATE_SetMinimum;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when others =>
                            null;
                    end case;
                when Internal =>
                    case currentState is
                        when STATE_Initial =>
                            sensorRestart <= '1';
                            sensorSuspend <= '1';
                        when others =>
                            null;
                    end case;
                    internalState <= WriteSnapshot;
                when OnExit =>
                    case currentState is
                        when STATE_Initial =>
                            sensorFusionRestart <= '1';
                            sensorFusionSuspend <= '1';
                        when others =>
                            null;
                    end case;
                    internalState <= WriteSnapshot;
                when NoOnEntry =>
                    internalState <= CheckTransition;
                when WriteSnapshot =>
                    EXTERNAL_distance <= distance;
                    EXTERNAL_triggers <= triggers;
                    EXTERNAL_echos <= echos;
                    internalState <= CheckForSuspension;
                    previousRinglet <= currentState;
                    currentState <= targetState;
                when others =>
                    null;
            end case;
        end if;
    end process;
end LLFSM;