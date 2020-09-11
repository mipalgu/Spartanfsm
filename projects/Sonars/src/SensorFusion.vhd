--SensorFusion.vhd
--
--This is a generated file - DO NOT ALTER.
--Please use an LLFSM editor to change this file.
--Date Generated: 2020-09-11 22:02 AEST
--

library IEEE;
use IEEE.std_logic_1164.All;
use ieee.numeric_std.all;

entity SensorFusion is
    generic (
        numberOfSensors: positive;
        sensorOutputSize: positive;
        signedOutput: boolean
    );
    port (
        clk: in std_logic;
        restart: in std_logic;
        resume: in std_logic;
        suspend: in std_logic;
        suspended: out std_logic;
        EXTERNAL_smallestOutput: out std_logic_vector(sensorOutputSize - 1 downto 0);
        EXTERNAL_sensorOutputs: in std_logic_vector(numberOfSensors * sensorOutputSize - 1 downto 0)
    );
end SensorFusion;

architecture LLFSM of SensorFusion is
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
    constant STATE_FindSmallestUnsigned: std_logic_vector(2 downto 0) := "011";
    constant STATE_changeCurrentSensor: std_logic_vector(2 downto 0) := "100";
    constant STATE_FindSmallestSigned: std_logic_vector(2 downto 0) := "101";
    constant STATE_SetSmallestOutput: std_logic_vector(2 downto 0) := "110";
    signal currentState: std_logic_vector(2 downto 0) := STATE_Initial;
    signal targetState: std_logic_vector(2 downto 0) := currentState;
    signal previousRinglet: std_logic_vector(2 downto 0) := STATE_Initial xor "111";
    signal suspendedFrom: std_logic_vector(2 downto 0) := STATE_Initial;
    --Snapshot of External Variables
    signal smallestOutput: std_logic_vector(sensorOutputSize - 1 downto 0);
    signal sensorOutputs: std_logic_vector(numberOfSensors * sensorOutputSize - 1 downto 0);
    --Machine Variables
    shared variable currentSensor: integer range 0 to numberOfSensors := 0;
    signal singleOutput: std_logic_vector(sensorOutputSize - 1 downto 0);
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
                    sensorOutputs <= EXTERNAL_sensorOutputs;
                    if (previousRinglet = currentState) then
                        internalState <= NoOnEntry;
                    else
                        internalState <= OnEntry;
                    end if;
                when OnEntry =>
                    case currentState is
                        when STATE_FindSmallestUnsigned =>
                            singleOutput <= minimum(
                            	to_integer(unsigned(sensorOutputs(currentSensor * (sensorOutputSize + 1) - 1 downto currentSensor * sensorOutputSize))),
                            	to_integer(unsigned(singleOutput))
                            );
                        when STATE_changeCurrentSensor =>
                            currentSensor := currentSensor + 1;
                        when STATE_FindSmallestSigned =>
                            singleOutput <= minimum(
                            	to_integer(signed(sensorOutputs(currentSensor * (sensorOutputSize + 1) - 1 downto currentSensor * sensorOutputSize))),
                            	to_integer(signed(singleOutput))
                            );
                        when STATE_SetSmallestOutput =>
                            smallestOutput <= singleOutput
                        when others =>
                            null;
                    end case;
                    internalState <= CheckTransition;
                when CheckTransition =>
                    case currentState is
                        when STATE_Initial =>
                            if (signedOutput) then
                                targetState <= STATE_FindSmallestSigned;
                                internalState <= OnExit;
                            elsif (true) and (not (signedOutput)) then
                                targetState <= STATE_FindSmallestUnsigned;
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
                        when STATE_FindSmallestUnsigned =>
                            if (true) then
                                targetState <= STATE_changeCurrentSensor;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_changeCurrentSensor =>
                            if (currentSensor = numberOfSensors) then
                                targetState <= STATE_SetSmallestOutput;
                                internalState <= OnExit;
                            elsif (signedOutput) and (not (currentSensor = numberOfSensors)) then
                                targetState <= STATE_FindSmallestSigned;
                                internalState <= OnExit;
                            elsif (true) and (not (signedOutput)) and (not (currentSensor = numberOfSensors)) then
                                targetState <= STATE_FindSmallestUnsigned;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_FindSmallestSigned =>
                            if (true) then
                                targetState <= STATE_changeCurrentSensor;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_SetSmallestOutput =>
                            if (true) then
                                targetState <= STATE_SUSPENDED;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when others =>
                            null;
                    end case;
                when Internal =>
                    case currentState is
                        when others =>
                            null;
                    end case;
                    internalState <= WriteSnapshot;
                when OnExit =>
                    case currentState is
                        when others =>
                            null;
                    end case;
                    internalState <= WriteSnapshot;
                when NoOnEntry =>
                    internalState <= CheckTransition;
                when WriteSnapshot =>
                    EXTERNAL_smallestOutput <= smallestOutput;
                    internalState <= CheckForSuspension;
                    previousRinglet <= currentState;
                    currentState <= targetState;
                when others =>
                    null;
            end case;
        end if;
    end process;
end LLFSM;