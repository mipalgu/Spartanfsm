--UltrasonicDiscreteSingle.vhd
--
--This is a generated file - DO NOT ALTER.
--Please use an LLFSM editor to change this file.
--Date Generated: 2020-09-23 04:44 AEST
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
use IEEE.numeric_std.all;

entity UltrasonicDiscreteSingle is
    port (
        clk: in std_logic;
        command: in std_logic_vector(1 downto 0);
        suspended: out std_logic;
        EXTERNAL_triggerPin: out std_logic;
        EXTERNAL_echo: in std_logic;
        EXTERNAL_distance: out std_logic_vector(15 downto 0)
    );
end UltrasonicDiscreteSingle;

architecture LLFSM of UltrasonicDiscreteSingle is
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
    constant STATE_Setup_Pin: std_logic_vector(3 downto 0) := "0010";
    constant STATE_Skip_Garbage: std_logic_vector(3 downto 0) := "0011";
    constant STATE_WaitForPulseStart: std_logic_vector(3 downto 0) := "0100";
    constant STATE_ClearTrigger: std_logic_vector(3 downto 0) := "0101";
    constant STATE_LostPulse: std_logic_vector(3 downto 0) := "0110";
    constant STATE_WaitForPulseEnd: std_logic_vector(3 downto 0) := "0111";
    constant STATE_CalculateDistance: std_logic_vector(3 downto 0) := "1000";
    constant STATE_WaitForMaxTime: std_logic_vector(3 downto 0) := "1001";
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
    signal triggerPin: std_logic;
    signal echo: std_logic;
    signal distance: std_logic_vector(15 downto 0);
    --Machine Variables
    constant SCHEDULE_LENGTH: natural := 100;
    constant SPEED_OF_SOUND: natural: 343;
    constant SONAR_OFFSET: natural := 40;
    constant MAX_DISTANCE: natural := 4000000;
    constant MAX_TIME: natural := MAX_DISTANCE * 2 / SPEED_OF_SOUND * 1000;
    signal numloops: unsigned(39 downto 0);
    constant maxloops: unsigned(39 downto 0) := to_unsigned(MAX_TIME / SCHEDULE_LENGTH, 40);
begin
process (clk)
    begin
        if (rising_edge(clk)) then
            case internalState is
                when ReadSnapshot =>
                    echo <= EXTERNAL_echo;
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
                        when STATE_Setup_Pin =>
                            triggerPin <= '0';
                        when STATE_Skip_Garbage =>
                            triggerPin <= '0';
                        when STATE_ClearTrigger =>
                            triggerPin <= '0';
                        when STATE_LostPulse =>
                            distance <= (others => '1');
                        when STATE_CalculateDistance =>
                            distance <= std_logic_vector(resize((numloops* to_unsigned(SCHEDULE_LENGTH, 8) / x"3E8" / to_unsigned(SPEED_OF_SOUND, 12) / x"2710"), 16));
                        when others =>
                            null;
                    end case;
                    internalState <= CheckTransition;
                when OnEntry =>
                    case currentState is
                        when STATE_Setup_Pin =>
                            triggerPin <= '0';
                        when STATE_Skip_Garbage =>
                            triggerPin <= '0';
                        when STATE_WaitForPulseStart =>
                            ringlet_counter := 0;
                        when STATE_ClearTrigger =>
                            triggerPin <= '0';
                        when STATE_LostPulse =>
                            distance <= (others => '1');
                        when STATE_CalculateDistance =>
                            distance <= std_logic_vector(resize((numloops* to_unsigned(SCHEDULE_LENGTH, 8) / x"3E8" / to_unsigned(SPEED_OF_SOUND, 12) / x"2710"), 16));
                        when STATE_WaitForMaxTime =>
                            ringlet_counter := 0;
                        when others =>
                            null;
                    end case;
                    internalState <= CheckTransition;
                when NoOnEntry =>
                    internalState <= CheckTransition;
                when CheckTransition =>
                    case currentState is
                        when STATE_Initial =>
                            if (true) then
                                targetState <= STATE_Setup_Pin;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_SUSPENDED =>
                            internalState <= Internal;
                        when STATE_Setup_Pin =>
                            if (true) then
                                targetState <= STATE_Skip_Garbage;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_Skip_Garbage =>
                            if (echo = '0') then
                                targetState <= STATE_WaitForPulseStart;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_WaitForPulseStart =>
                            if (numloops >= maxloops) then
                                targetState <= STATE_LostPulse;
                                internalState <= OnExit;
                            elsif (ringlet_counter >= integer(ceil(1.0 * RINGLETS_PER_MS))) and (not (numloops >= maxloops)) then
                                targetState <= STATE_ClearTrigger;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_ClearTrigger =>
                            if (numloops >= maxloops) then
                                targetState <= STATE_LostPulse;
                                internalState <= OnExit;
                            elsif (echo = '1') and (not (numloops >= maxloops)) then
                                targetState <= STATE_WaitForPulseEnd;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_LostPulse =>
                            if (true) then
                                targetState <= STATE_WaitForMaxTime;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_WaitForPulseEnd =>
                            if (numloops >= maxloops) then
                                targetState <= STATE_LostPulse;
                                internalState <= OnExit;
                            elsif (echo = '0') and (not (numloops >= maxloops)) then
                                targetState <= STATE_CalculateDistance;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_CalculateDistance =>
                            if (true) then
                                targetState <= STATE_WaitForMaxTime;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_WaitForMaxTime =>
                            if (ringlet_counter >= integer(ceil((real(MAX_TIME)) * RINGLETS_PER_US))) then
                                targetState <= STATE_Setup_Pin;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when others =>
                            null;
                    end case;
                when Internal =>
                    case currentState is
                        when STATE_WaitForPulseStart =>
                            numloops <= numloops + 1;
                            ringlet_counter := ringlet_counter + 1;
                        when STATE_ClearTrigger =>
                            numloops <= numloops + 1;
                        when STATE_WaitForPulseEnd =>
                            numloops <= numloops + 1;
                        when STATE_WaitForMaxTime =>
                            ringlet_counter := ringlet_counter + 1;
                        when others =>
                            null;
                    end case;
                    internalState <= WriteSnapshot;
                when OnExit =>
                    case currentState is
                        when STATE_Initial =>
                            numloops <= (others => '0');
                        when STATE_Skip_Garbage =>
                            triggerPin <= '1';
                            numloops <= numloops + 1;
                        when STATE_WaitForPulseStart =>
                            numloops <= numloops + 1;
                            triggerPin <= '0';
                        when STATE_ClearTrigger =>
                            numloops <= numloops + 1;
                        when STATE_LostPulse =>
                            numloops <= (others => '0');
                        when STATE_CalculateDistance =>
                            numloops <= (others => '0');
                        when others =>
                            null;
                    end case;
                    internalState <= WriteSnapshot;
                when WriteSnapshot =>
                    EXTERNAL_triggerPin <= triggerPin;
                    EXTERNAL_distance <= distance;
                    internalState <= ReadSnapshot;
                    previousRinglet <= currentState;
                    currentState <= targetState;
                when others =>
                    null;
            end case;
        end if;
    end process;
end LLFSM;