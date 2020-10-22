--SonarPlatform.vhd
--
--This is a generated file - DO NOT ALTER.
--Please use an LLFSM editor to change this file.
--Date Generated: 2020-10-22 17:14 AEST
--
--Author: Morgan McColl
--Email: morgan.mccoll@alumni.griffithuni.edu.au
--
--Copyright (C) 2020 Morgan McColl<morgan.mccoll@alumni.griffithuni.edu.au>
--
--Distributed under terms of the MIT license.
--

library IEEE;
use IEEE.std_logic_1164.All;
use IEEE.math_real.all;


entity SonarPlatform is
    generic (
        numberOfSensors: positive
    );
    port (
        clk: in std_logic;
        command: in std_logic_vector(1 downto 0);
        suspended: out std_logic;
        EXTERNAL_distance: out std_logic_vector(15 downto 0);
        EXTERNAL_triggers: out std_logic_vector(numberOfSensors - 1 downto 0);
        EXTERNAL_echos: in std_logic_vector(numberOfSensors - 1 downto 0)
    );
end SonarPlatform;

architecture LLFSM of SonarPlatform is
    --Internal State Representation Bits
    constant ReadSnapshot: std_logic_vector(3 downto 0) := "0000";
    constant OnSuspend: std_logic_vector(3 downto 0) := "0001";
    constant OnResume: std_logic_vector(3 downto 0) := "0010";
    constant OnEntry: std_logic_vector(3 downto 0) := "0011";
    constant NoOnEntry: std_logic_vector(3 downto 0) := "0100";
    constant CheckTransition: std_logic_vector(3 downto 0) := "0101";
    constant OnExit: std_logic_vector(3 downto 0) := "0110";
    constant Internal: std_logic_vector(3 downto 0) := "0111";
    constant WriteSnapshot: std_logic_vector(3 downto 0) := "1000";
    signal internalState: std_logic_vector(3 downto 0) := ReadSnapshot;
    --State Representation Bits
    constant STATE_Initial: std_logic_vector(2 downto 0) := "000";
    constant STATE_SUSPENDED: std_logic_vector(2 downto 0) := "001";
    constant STATE_StartFusion: std_logic_vector(2 downto 0) := "010";
    constant STATE_SetMinimum: std_logic_vector(2 downto 0) := "011";
    constant STATE_FindMinimum: std_logic_vector(2 downto 0) := "100";
    constant STATE_ReadSonar: std_logic_vector(2 downto 0) := "101";
    signal currentState: std_logic_vector(2 downto 0) := STATE_Initial;
    signal targetState: std_logic_vector(2 downto 0) := STATE_Initial;
    signal previousRinglet: std_logic_vector(2 downto 0) := "ZZZ";
    signal suspendedFrom: std_logic_vector(2 downto 0) := STATE_Initial;
    --Suspension Commands
    constant COMMAND_NULL: std_logic_vector(1 downto 0) := "00";
    constant COMMAND_RESTART: std_logic_vector(1 downto 0) := "01";
    constant COMMAND_SUSPEND: std_logic_vector(1 downto 0) := "10";
    constant COMMAND_RESUME: std_logic_vector(1 downto 0) := "11";
    --After Variables
    shared variable ringlet_counter: natural := 0;
    constant clockPeriod: real := 20.0;
    constant ringletLength: real := 5.0 * clockPeriod;
    constant RINGLETS_PER_NS: real := 1.0 / ringletLength;
    constant RINGLETS_PER_US: real := 1000.0 * RINGLETS_PER_NS;
    constant RINGLETS_PER_MS: real := 1000000.0 * RINGLETS_PER_NS;
    constant RINGLETS_PER_S: real := 1000000000.0 * RINGLETS_PER_NS;
    --Snapshot of External Variables
    signal distance: std_logic_vector(15 downto 0);
    signal triggers: std_logic_vector(numberOfSensors - 1 downto 0);
    signal echos: std_logic_vector(numberOfSensors - 1 downto 0);
    --Machine Variables
    signal smallestDistance: std_logic_vector(15 downto 0);
    constant allHigh: std_logic_vector(numberOfSensors - 1 downto 0) := (others => '1');
    signal sensorsSuspended: std_logic_vector(numberOfSensors - 1 downto 0);
    signal sensorFusionSuspended: std_logic;
    signal allOutputs: std_logic_vector(numberOfSensors * 16 - 1 downto 0);
    signal sensorCommand: std_logic_vector(1 downto 0) := COMMAND_NULL;
    signal sensorFusionCommand: std_logic_vector(1 downto 0) := COMMAND_NULL;
    constant allLow: std_logic_vector(numberOfSensors - 1 downto 0) := (others => '0');
begin
process (clk)
    begin
        if (rising_edge(clk)) then
            case internalState is
                when ReadSnapshot =>
                    echos <= EXTERNAL_echos;
                    if (command = COMMAND_RESTART and currentState /= STATE_Initial) then
                        currentState <= STATE_Initial;
                        suspended <= '0';
                        suspendedFrom <= STATE_Initial;
                        targetState <= STATE_Initial;
                        if (previousRinglet = STATE_SUSPENDED) then
                            internalState <= OnResume;
                        elsif (previousRinglet = STATE_Initial) then
                            internalState <= NoOnEntry;
                        else
                            internalState <= OnEntry;
                        end if;
                    elsif (command = COMMAND_RESUME and currentState = STATE_SUSPENDED and suspendedFrom /= STATE_SUSPENDED) then
                        suspended <= '0';
                        currentState <= suspendedFrom;
                        targetState <= suspendedFrom;
                        if (previousRinglet = suspendedFrom) then
                            internalState <= NoOnEntry;
                        else
                            internalState <= OnResume;
                        end if;
                    elsif (command = COMMAND_SUSPEND and currentState /= STATE_SUSPENDED) then
                        suspendedFrom <= currentState;
                        suspended <= '1';
                        currentState <= STATE_SUSPENDED;
                        targetState <= STATE_SUSPENDED;
                        if (previousRinglet = STATE_SUSPENDED) then
                            internalState <= NoOnEntry;
                        else
                            internalState <= OnSuspend;
                        end if;
                    elsif (currentState = STATE_SUSPENDED) then
                        suspended <= '1';
                        if (previousRinglet /= STATE_SUSPENDED) then
                            internalState <= OnSuspend;
                        else
                            internalState <= NoOnEntry;
                        end if;
                    elsif (previousRinglet = STATE_SUSPENDED) then
                        internalState <= OnResume;
                        suspended <= '0';
                        suspendedFrom <= currentState;
                    else
                        suspended <= '0';
                        suspendedFrom <= currentState;
                        if (previousRinglet /= currentState) then
                            internalState <= OnEntry;
                        else
                            internalState <= NoOnEntry;
                        end if;
                    end if;
                when OnSuspend =>
                    internalState <= CheckTransition;
                when OnResume =>
                    case currentState is
                        when STATE_StartFusion =>
                            sensorFusionCommand <= COMMAND_RESTART;
                        when STATE_SetMinimum =>
                            distance <= smallestDistance;
                            sensorCommand <= COMMAND_RESTART;
                        when others =>
                            null;
                    end case;
                    internalState <= CheckTransition;
                when OnEntry =>
                    case currentState is
                        when STATE_StartFusion =>
                            sensorFusionCommand <= COMMAND_RESTART;
                        when STATE_SetMinimum =>
                            distance <= smallestDistance;
                            sensorCommand <= COMMAND_RESTART;
                        when others =>
                            null;
                    end case;
                    internalState <= CheckTransition;
                when NoOnEntry =>
                    internalState <= CheckTransition;
                when CheckTransition =>
                    case currentState is
                        when STATE_Initial =>
                            targetState <= STATE_ReadSonar;
                            internalState <= OnExit;
                        when STATE_SUSPENDED =>
                            internalState <= Internal;
                        when STATE_StartFusion =>
                            if (sensorFusionSuspended = '0') then
                                targetState <= STATE_FindMinimum;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_SetMinimum =>
                            if (sensorsSuspended = allLow) then
                                targetState <= STATE_ReadSonar;
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
                        when STATE_ReadSonar =>
                            if (sensorsSuspended = allHigh) then
                                targetState <= STATE_StartFusion;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when others =>
                            null;
                    end case;
                when Internal =>
                    internalState <= WriteSnapshot;
                when OnExit =>
                    case currentState is
                        when STATE_Initial =>
                            sensorFusionCommand <= COMMAND_SUSPEND;
                            sensorCommand <= COMMAND_NULL;
                        when STATE_StartFusion =>
                            sensorFusionCommand <= COMMAND_NULL;
                        when STATE_SetMinimum =>
                            sensorCommand <= COMMAND_NULL;
                        when others =>
                            null;
                    end case;
                    internalState <= WriteSnapshot;
                when WriteSnapshot =>
                    EXTERNAL_distance <= distance;
                    EXTERNAL_triggers <= triggers;
                    internalState <= ReadSnapshot;
                    previousRinglet <= currentState;
                    currentState <= targetState;
                when others =>
                    null;
            end case;
        end if;
    end process;
end LLFSM;