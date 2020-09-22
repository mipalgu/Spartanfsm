--SensorFusion.vhd
--
--This is a generated file - DO NOT ALTER.
--Please use an LLFSM editor to change this file.
--Date Generated: 2020-09-23 04:21 AEST
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
use ieee.numeric_std.all;

entity SensorFusion is
    generic (
        numberOfSensors: positive;
        sensorOutputSize: positive;
        signedOutput: boolean;
        maxValue: Integer;
        minValue: Integer
    );
    port (
        clk: in std_logic;
        command: in std_logic_vector(1 downto 0);
        suspended: out std_logic;
        EXTERNAL_smallestOutput: out std_logic_vector(sensorOutputSize - 1 downto 0);
        EXTERNAL_sensorOutputs: in std_logic_vector(numberOfSensors * sensorOutputSize - 1 downto 0)
    );
end SensorFusion;

architecture LLFSM of SensorFusion is
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
    constant STATE_Initial: std_logic_vector(3 downto 0) := "0000";
    constant STATE_SUSPENDED: std_logic_vector(3 downto 0) := "0001";
    constant STATE_ConvertToUnsigned: std_logic_vector(3 downto 0) := "0010";
    constant STATE_changeCurrentSensor: std_logic_vector(3 downto 0) := "0011";
    constant STATE_ConvertToSigned: std_logic_vector(3 downto 0) := "0100";
    constant STATE_SetSmallestOutput: std_logic_vector(3 downto 0) := "0101";
    constant STATE_SignedOutput: std_logic_vector(3 downto 0) := "0110";
    constant STATE_UnsignedOutput: std_logic_vector(3 downto 0) := "0111";
    constant STATE_ChangeOutput: std_logic_vector(3 downto 0) := "1000";
    signal currentState: std_logic_vector(3 downto 0) := STATE_Initial;
    signal targetState: std_logic_vector(3 downto 0) := currentState;
    signal previousRinglet: std_logic_vector(3 downto 0) := "ZZZZ";
    signal suspendedFrom: std_logic_vector(3 downto 0) := STATE_Initial;
    constant COMMAND_NULL: std_logic_vector(1 downto 0) := "00";
    constant COMMAND_RESTART: std_logic_vector(1 downto 0) := "01";
    constant COMMAND_SUSPEND: std_logic_vector(1 downto 0) := "10";
    constant COMMAND_RESUME: std_logic_vector(1 downto 0) := "11";
    shared variable ringlet_counter: natural := 0;
    constant clockPeriod: real := 20.0;
    constant ringletLength: real := 5.0 * clockPeriod;
    constant RINGLETS_PER_NS: real := 1.0 / ringletLength;
    constant RINGLETS_PER_US: real := 1000.0 * RINGLETS_PER_NS;
    constant RINGLETS_PER_MS: real := 1000000.0 * RINGLETS_PER_NS;
    constant RINGLETS_PER_S: real := 1000000000.0 * RINGLETS_PER_NS;
    --Snapshot of External Variables
    signal smallestOutput: std_logic_vector(sensorOutputSize - 1 downto 0);
    signal sensorOutputs: std_logic_vector(numberOfSensors * sensorOutputSize - 1 downto 0);
    --Machine Variables
    shared variable currentSensor: integer range 0 to numberOfSensors := 0;
    shared variable singleOutput: Integer range minValue to maxValue := maxValue;
    shared variable currentOutput: Integer range minValue to maxValue;
begin
process (clk)
    begin
        if (rising_edge(clk)) then
            case internalState is
                when ReadSnapshot =>
                    sensorOutputs <= EXTERNAL_sensorOutputs;
                    if (command = COMMAND_RESTART and currentState /= STATE_Initial) then
                        currentState <= STATE_Initial;
                        suspended <= '0';
                        suspendedFrom <= STATE_Initial;
                        targetState <= STATE_Initial;
                        if (previousRinglet = STATE_SUSPENDED) then
                            internalState <= OnResume;
                        else
                            internalState <= OnEntry;
                        end if;
                    elsif (command = COMMAND_RESUME and currentState = STATE_SUSPENDED and suspendedFrom /= STATE_SUSPENDED) then
                        suspended <= '0';
                        currentState <= suspendedFrom;
                        internalState <= OnResume;
                        targetState <= suspendedFrom;
                    elsif (command = COMMAND_SUSPEND and currentState /= STATE_SUSPENDED) then
                        suspendedFrom <= currentState;
                        suspended <= '1';
                        currentState <= STATE_SUSPENDED;
                        internalState <= OnSuspend;
                        targetState <= STATE_SUSPENDED;
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
                    case suspendedFrom is
                        when others =>
                            null;
                    end case;
                    internalState <= CheckTransition;
                when OnResume =>
                    case currentState is
                        when STATE_ConvertToUnsigned =>
                            currentOutput := to_integer(unsigned(sensorOutputs((currentSensor + 1) * sensorOutputSize - 1 downto currentSensor * sensorOutputSize)));
                        when STATE_changeCurrentSensor =>
                            currentSensor := currentSensor + 1;
                        when STATE_ConvertToSigned =>
                            currentOutput := to_integer(signed(sensorOutputs((currentSensor + 1) * sensorOutputSize - 1 downto currentSensor * sensorOutputSize)));
                        when STATE_SignedOutput =>
                            smallestOutput <= std_logic_vector(to_signed(singleOutput, sensorOutputSize));
                        when STATE_UnsignedOutput =>
                            smallestOutput <= std_logic_vector(to_unsigned(singleOutput, sensorOutputSize));
                        when STATE_ChangeOutput =>
                            singleOutput := currentOutput;
                        when others =>
                            null;
                    end case;
                    internalState <= CheckTransition;
                when OnEntry =>
                    case currentState is
                        when STATE_ConvertToUnsigned =>
                            currentOutput := to_integer(unsigned(sensorOutputs((currentSensor + 1) * sensorOutputSize - 1 downto currentSensor * sensorOutputSize)));
                        when STATE_changeCurrentSensor =>
                            currentSensor := currentSensor + 1;
                        when STATE_ConvertToSigned =>
                            currentOutput := to_integer(signed(sensorOutputs((currentSensor + 1) * sensorOutputSize - 1 downto currentSensor * sensorOutputSize)));
                        when STATE_SignedOutput =>
                            smallestOutput <= std_logic_vector(to_signed(singleOutput, sensorOutputSize));
                        when STATE_UnsignedOutput =>
                            smallestOutput <= std_logic_vector(to_unsigned(singleOutput, sensorOutputSize));
                        when STATE_ChangeOutput =>
                            singleOutput := currentOutput;
                        when others =>
                            null;
                    end case;
                    internalState <= CheckTransition;
                when NoOnEntry =>
                    internalState <= CheckTransition;
                when CheckTransition =>
                    case currentState is
                        when STATE_Initial =>
                            if (signedOutput) then
                                targetState <= STATE_ConvertToSigned;
                                internalState <= OnExit;
                            elsif (true) and (not (signedOutput)) then
                                targetState <= STATE_ConvertToUnsigned;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_SUSPENDED =>
                            internalState <= Internal;
                        when STATE_ConvertToUnsigned =>
                            if (currentOutput < singleOutput) then
                                targetState <= STATE_ChangeOutput;
                                internalState <= OnExit;
                            elsif (true) and (not (currentOutput < singleOutput)) then
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
                                targetState <= STATE_ConvertToSigned;
                                internalState <= OnExit;
                            elsif (true) and (not (signedOutput)) and (not (currentSensor = numberOfSensors)) then
                                targetState <= STATE_ConvertToUnsigned;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_ConvertToSigned =>
                            if (currentOutput < singleOutput) then
                                targetState <= STATE_ChangeOutput;
                                internalState <= OnExit;
                            elsif (true) and (not (currentOutput < singleOutput)) then
                                targetState <= STATE_changeCurrentSensor;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_SetSmallestOutput =>
                            if (signedOutput) then
                                targetState <= STATE_SignedOutput;
                                internalState <= OnExit;
                            elsif (true) and (not (signedOutput)) then
                                targetState <= STATE_UnsignedOutput;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_SignedOutput =>
                            if (true) then
                                targetState <= STATE_SUSPENDED;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_UnsignedOutput =>
                            if (true) then
                                targetState <= STATE_SUSPENDED;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_ChangeOutput =>
                            if (true) then
                                targetState <= STATE_changeCurrentSensor;
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
                        when STATE_Initial =>
                            singleOutput := maxValue;
                        when others =>
                            null;
                    end case;
                    internalState <= WriteSnapshot;
                when WriteSnapshot =>
                    EXTERNAL_smallestOutput <= smallestOutput;
                    internalState <= ReadSnapshot;
                    previousRinglet <= currentState;
                    currentState <= targetState;
                when others =>
                    null;
            end case;
        end if;
    end process;
end LLFSM;