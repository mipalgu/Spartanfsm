--SevenSegDigit.vhd
--
--This is a generated file - DO NOT ALTER.
--Please use an LLFSM editor to change this file.
--Date Generated: 2020-10-06 16:12 AEST
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
    constant STATE_Init: std_logic_vector(4 downto 0) := "00000";
    constant STATE_Suspend: std_logic_vector(4 downto 0) := "00001";
    constant STATE_Zero: std_logic_vector(4 downto 0) := "00010";
    constant STATE_One: std_logic_vector(4 downto 0) := "00011";
    constant STATE_Two: std_logic_vector(4 downto 0) := "00100";
    constant STATE_Three: std_logic_vector(4 downto 0) := "00101";
    constant STATE_Four: std_logic_vector(4 downto 0) := "00110";
    constant STATE_Five: std_logic_vector(4 downto 0) := "00111";
    constant STATE_Six: std_logic_vector(4 downto 0) := "01000";
    constant STATE_Seven: std_logic_vector(4 downto 0) := "01001";
    constant STATE_Eight: std_logic_vector(4 downto 0) := "01010";
    constant STATE_Nine: std_logic_vector(4 downto 0) := "01011";
    constant STATE_A: std_logic_vector(4 downto 0) := "01100";
    constant STATE_B: std_logic_vector(4 downto 0) := "01101";
    constant STATE_C: std_logic_vector(4 downto 0) := "01110";
    constant STATE_D: std_logic_vector(4 downto 0) := "01111";
    constant STATE_E: std_logic_vector(4 downto 0) := "10000";
    constant STATE_F: std_logic_vector(4 downto 0) := "10001";
    signal currentState: std_logic_vector(4 downto 0) := STATE_Init;
    signal targetState: std_logic_vector(4 downto 0) := STATE_Init;
    signal previousRinglet: std_logic_vector(4 downto 0) := "ZZZZZ";
    signal suspendedFrom: std_logic_vector(4 downto 0) := STATE_Init;
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
                        when STATE_Zero =>
                            output <="1000000";
                        when STATE_One =>
                            output <= "1111001";
                        when STATE_Two =>
                            output <= "0100100";
                        when STATE_Three =>
                            output <= "0110000";
                        when STATE_Four =>
                            output <= "0011001";
                        when STATE_Five =>
                            output <= "0010010";
                        when STATE_Six =>
                            output <= "0000010";
                        when STATE_Seven =>
                            output <= "1111000";
                        when STATE_Eight =>
                            output <= "0000000";
                        when STATE_Nine =>
                            output <= "0011000";
                        when STATE_A =>
                            output <= "0001000";
                        when STATE_B =>
                            output <= "0000011";
                        when STATE_C =>
                            output <= "1000110";
                        when STATE_D =>
                            output <= "0100001";
                        when STATE_E =>
                            output <= "0000110";
                        when STATE_F =>
                            output <= "0001110";
                        when others =>
                            null;
                    end case;
                    internalState <= CheckTransition;
                when OnEntry =>
                    case currentState is
                        when STATE_Zero =>
                            output <="1000000";
                        when STATE_One =>
                            output <= "1111001";
                        when STATE_Two =>
                            output <= "0100100";
                        when STATE_Three =>
                            output <= "0110000";
                        when STATE_Four =>
                            output <= "0011001";
                        when STATE_Five =>
                            output <= "0010010";
                        when STATE_Six =>
                            output <= "0000010";
                        when STATE_Seven =>
                            output <= "1111000";
                        when STATE_Eight =>
                            output <= "0000000";
                        when STATE_Nine =>
                            output <= "0011000";
                        when STATE_A =>
                            output <= "0001000";
                        when STATE_B =>
                            output <= "0000011";
                        when STATE_C =>
                            output <= "1000110";
                        when STATE_D =>
                            output <= "0100001";
                        when STATE_E =>
                            output <= "0000110";
                        when STATE_F =>
                            output <= "0001110";
                        when others =>
                            null;
                    end case;
                    internalState <= CheckTransition;
                when NoOnEntry =>
                    internalState <= CheckTransition;
                when CheckTransition =>
                    case currentState is
                        when STATE_Init =>
                            if (bcd = x"0") then
                                targetState <= STATE_Zero;
                                internalState <= OnExit;
                            elsif (bcd = x"1") and (not (bcd = x"0")) then
                                targetState <= STATE_One;
                                internalState <= OnExit;
                            elsif (bcd = x"2") and (not (bcd = x"1")) and (not (bcd = x"0")) then
                                targetState <= STATE_Two;
                                internalState <= OnExit;
                            elsif (bcd = x"3") and (not (bcd = x"2")) and (not (bcd = x"1")) and (not (bcd = x"0")) then
                                targetState <= STATE_Three;
                                internalState <= OnExit;
                            elsif (bcd = x"4") and (not (bcd = x"3")) and (not (bcd = x"2")) and (not (bcd = x"1")) and (not (bcd = x"0")) then
                                targetState <= STATE_Four;
                                internalState <= OnExit;
                            elsif (bcd = x"5") and (not (bcd = x"4")) and (not (bcd = x"3")) and (not (bcd = x"2")) and (not (bcd = x"1")) and (not (bcd = x"0")) then
                                targetState <= STATE_Five;
                                internalState <= OnExit;
                            elsif (bcd = x"6") and (not (bcd = x"5")) and (not (bcd = x"4")) and (not (bcd = x"3")) and (not (bcd = x"2")) and (not (bcd = x"1")) and (not (bcd = x"0")) then
                                targetState <= STATE_Six;
                                internalState <= OnExit;
                            elsif (bcd = x"7") and (not (bcd = x"6")) and (not (bcd = x"5")) and (not (bcd = x"4")) and (not (bcd = x"3")) and (not (bcd = x"2")) and (not (bcd = x"1")) and (not (bcd = x"0")) then
                                targetState <= STATE_Seven;
                                internalState <= OnExit;
                            elsif (bcd = x"8") and (not (bcd = x"7")) and (not (bcd = x"6")) and (not (bcd = x"5")) and (not (bcd = x"4")) and (not (bcd = x"3")) and (not (bcd = x"2")) and (not (bcd = x"1")) and (not (bcd = x"0")) then
                                targetState <= STATE_Eight;
                                internalState <= OnExit;
                            elsif (bcd = x"9") and (not (bcd = x"8")) and (not (bcd = x"7")) and (not (bcd = x"6")) and (not (bcd = x"5")) and (not (bcd = x"4")) and (not (bcd = x"3")) and (not (bcd = x"2")) and (not (bcd = x"1")) and (not (bcd = x"0")) then
                                targetState <= STATE_Nine;
                                internalState <= OnExit;
                            elsif (bcd = x"a") and (not (bcd = x"9")) and (not (bcd = x"8")) and (not (bcd = x"7")) and (not (bcd = x"6")) and (not (bcd = x"5")) and (not (bcd = x"4")) and (not (bcd = x"3")) and (not (bcd = x"2")) and (not (bcd = x"1")) and (not (bcd = x"0")) then
                                targetState <= STATE_A;
                                internalState <= OnExit;
                            elsif (bcd = x"b") and (not (bcd = x"a")) and (not (bcd = x"9")) and (not (bcd = x"8")) and (not (bcd = x"7")) and (not (bcd = x"6")) and (not (bcd = x"5")) and (not (bcd = x"4")) and (not (bcd = x"3")) and (not (bcd = x"2")) and (not (bcd = x"1")) and (not (bcd = x"0")) then
                                targetState <= STATE_B;
                                internalState <= OnExit;
                            elsif (bcd = x"c") and (not (bcd = x"b")) and (not (bcd = x"a")) and (not (bcd = x"9")) and (not (bcd = x"8")) and (not (bcd = x"7")) and (not (bcd = x"6")) and (not (bcd = x"5")) and (not (bcd = x"4")) and (not (bcd = x"3")) and (not (bcd = x"2")) and (not (bcd = x"1")) and (not (bcd = x"0")) then
                                targetState <= STATE_C;
                                internalState <= OnExit;
                            elsif (bcd = x"d") and (not (bcd = x"c")) and (not (bcd = x"b")) and (not (bcd = x"a")) and (not (bcd = x"9")) and (not (bcd = x"8")) and (not (bcd = x"7")) and (not (bcd = x"6")) and (not (bcd = x"5")) and (not (bcd = x"4")) and (not (bcd = x"3")) and (not (bcd = x"2")) and (not (bcd = x"1")) and (not (bcd = x"0")) then
                                targetState <= STATE_D;
                                internalState <= OnExit;
                            elsif (bcd = x"e") and (not (bcd = x"d")) and (not (bcd = x"c")) and (not (bcd = x"b")) and (not (bcd = x"a")) and (not (bcd = x"9")) and (not (bcd = x"8")) and (not (bcd = x"7")) and (not (bcd = x"6")) and (not (bcd = x"5")) and (not (bcd = x"4")) and (not (bcd = x"3")) and (not (bcd = x"2")) and (not (bcd = x"1")) and (not (bcd = x"0")) then
                                targetState <= STATE_E;
                                internalState <= OnExit;
                            elsif (bcd = x"f") and (not (bcd = x"e")) and (not (bcd = x"d")) and (not (bcd = x"c")) and (not (bcd = x"b")) and (not (bcd = x"a")) and (not (bcd = x"9")) and (not (bcd = x"8")) and (not (bcd = x"7")) and (not (bcd = x"6")) and (not (bcd = x"5")) and (not (bcd = x"4")) and (not (bcd = x"3")) and (not (bcd = x"2")) and (not (bcd = x"1")) and (not (bcd = x"0")) then
                                targetState <= STATE_F;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_Suspend =>
                            internalState <= Internal;
                        when STATE_Zero =>
                            targetState <= STATE_Suspend;
                            internalState <= OnExit;
                        when STATE_One =>
                            targetState <= STATE_Suspend;
                            internalState <= OnExit;
                        when STATE_Two =>
                            targetState <= STATE_Suspend;
                            internalState <= OnExit;
                        when STATE_Three =>
                            targetState <= STATE_Suspend;
                            internalState <= OnExit;
                        when STATE_Four =>
                            targetState <= STATE_Suspend;
                            internalState <= OnExit;
                        when STATE_Five =>
                            targetState <= STATE_Suspend;
                            internalState <= OnExit;
                        when STATE_Six =>
                            targetState <= STATE_Suspend;
                            internalState <= OnExit;
                        when STATE_Seven =>
                            targetState <= STATE_Suspend;
                            internalState <= OnExit;
                        when STATE_Eight =>
                            targetState <= STATE_Suspend;
                            internalState <= OnExit;
                        when STATE_Nine =>
                            targetState <= STATE_Suspend;
                            internalState <= OnExit;
                        when STATE_A =>
                            targetState <= STATE_Suspend;
                            internalState <= OnExit;
                        when STATE_B =>
                            targetState <= STATE_Suspend;
                            internalState <= OnExit;
                        when STATE_C =>
                            targetState <= STATE_Suspend;
                            internalState <= OnExit;
                        when STATE_D =>
                            targetState <= STATE_Suspend;
                            internalState <= OnExit;
                        when STATE_E =>
                            targetState <= STATE_Suspend;
                            internalState <= OnExit;
                        when STATE_F =>
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