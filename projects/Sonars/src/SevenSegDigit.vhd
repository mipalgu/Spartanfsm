--SevenSegDigit.vhd
--
--This is a generated file - DO NOT ALTER.
--Please use an LLFSM editor to change this file.
--Date Generated: 2020-10-22 17:45 AEST
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


entity SevenSegDigit is
    port (
        clk: in std_logic;
        command: in std_logic_vector(1 downto 0);
        suspended: out std_logic;
        EXTERNAL_bcd: in std_logic_vector(3 downto 0);
        EXTERNAL_output: out std_logic_vector(6 downto 0)
    );
end SevenSegDigit;

architecture LLFSM of SevenSegDigit is
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
    constant STATE_Init: std_logic_vector(1 downto 0) := "00";
    constant STATE_Suspend: std_logic_vector(1 downto 0) := "01";
    constant STATE_ConvertBinary: std_logic_vector(1 downto 0) := "10";
    signal currentState: std_logic_vector(1 downto 0) := STATE_Init;
    signal targetState: std_logic_vector(1 downto 0) := STATE_Init;
    signal previousRinglet: std_logic_vector(1 downto 0) := "ZZ";
    signal suspendedFrom: std_logic_vector(1 downto 0) := STATE_Init;
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
    signal bcd: std_logic_vector(3 downto 0);
    signal output: std_logic_vector(6 downto 0);
    --Machine Variables
begin
process (clk)
    begin
        if (rising_edge(clk)) then
            case internalState is
                when ReadSnapshot =>
                    bcd <= EXTERNAL_bcd;
                    if (command = COMMAND_RESTART and currentState /= STATE_Init) then
                        currentState <= STATE_Init;
                        suspended <= '0';
                        suspendedFrom <= STATE_Init;
                        targetState <= STATE_Init;
                        if (previousRinglet = STATE_Suspend) then
                            internalState <= OnResume;
                        elsif (previousRinglet = STATE_Init) then
                            internalState <= NoOnEntry;
                        else
                            internalState <= OnEntry;
                        end if;
                    elsif (command = COMMAND_RESUME and currentState = STATE_Suspend and suspendedFrom /= STATE_Suspend) then
                        suspended <= '0';
                        currentState <= suspendedFrom;
                        targetState <= suspendedFrom;
                        if (previousRinglet = suspendedFrom) then
                            internalState <= NoOnEntry;
                        else
                            internalState <= OnResume;
                        end if;
                    elsif (command = COMMAND_SUSPEND and currentState /= STATE_Suspend) then
                        suspendedFrom <= currentState;
                        suspended <= '1';
                        currentState <= STATE_Suspend;
                        targetState <= STATE_Suspend;
                        if (previousRinglet = STATE_Suspend) then
                            internalState <= NoOnEntry;
                        else
                            internalState <= OnSuspend;
                        end if;
                    elsif (currentState = STATE_Suspend) then
                        suspended <= '1';
                        if (previousRinglet /= STATE_Suspend) then
                            internalState <= OnSuspend;
                        else
                            internalState <= NoOnEntry;
                        end if;
                    elsif (previousRinglet = STATE_Suspend) then
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
                        when STATE_ConvertBinary =>
                            case bcd is
                            	when x"0" => output <="1000000";
                            	when x"1" => output <= "1111001";
                            	when x"2" => output <= "0100100";
                            	when x"3" => output <= "0110000";
                            	when x"4" => output <= "0011001";
                            	when x"5" => output <= "0010010";
                            	when x"6" => output <= "0000010";
                            	when x"7" => output <= "1111000";
                            	when x"8" => output <= "0000000";
                            	when x"9" => output <= "0011000";
                            	when x"A" => output <= "0001000";
                            	when x"B" => output <= "0000011";
                            	when x"C" => output <= "1000110";
                            	when x"D" => output <= "0100001";
                            	when x"E" => output <= "0000110";
                            	when others => output <= "0001110";
                            end case;
                        when others =>
                            null;
                    end case;
                    internalState <= CheckTransition;
                when OnEntry =>
                    case currentState is
                        when STATE_ConvertBinary =>
                            case bcd is
                            	when x"0" => output <="1000000";
                            	when x"1" => output <= "1111001";
                            	when x"2" => output <= "0100100";
                            	when x"3" => output <= "0110000";
                            	when x"4" => output <= "0011001";
                            	when x"5" => output <= "0010010";
                            	when x"6" => output <= "0000010";
                            	when x"7" => output <= "1111000";
                            	when x"8" => output <= "0000000";
                            	when x"9" => output <= "0011000";
                            	when x"A" => output <= "0001000";
                            	when x"B" => output <= "0000011";
                            	when x"C" => output <= "1000110";
                            	when x"D" => output <= "0100001";
                            	when x"E" => output <= "0000110";
                            	when others => output <= "0001110";
                            end case;
                        when others =>
                            null;
                    end case;
                    internalState <= CheckTransition;
                when NoOnEntry =>
                    internalState <= CheckTransition;
                when CheckTransition =>
                    case currentState is
                        when STATE_Init =>
                            targetState <= STATE_ConvertBinary;
                            internalState <= OnExit;
                        when STATE_Suspend =>
                            internalState <= Internal;
                        when STATE_ConvertBinary =>
                            targetState <= STATE_Suspend;
                            internalState <= OnExit;
                        when others =>
                            null;
                    end case;
                when Internal =>
                    internalState <= WriteSnapshot;
                when OnExit =>
                    internalState <= WriteSnapshot;
                when WriteSnapshot =>
                    EXTERNAL_output <= output;
                    internalState <= ReadSnapshot;
                    previousRinglet <= currentState;
                    currentState <= targetState;
                when others =>
                    null;
            end case;
        end if;
    end process;
end LLFSM;