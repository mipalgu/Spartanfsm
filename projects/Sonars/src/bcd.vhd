--bcd.vhd
--
--This is a generated file - DO NOT ALTER.
--Please use an LLFSM editor to change this file.
--Date Generated: 2020-09-21 03:19 AEST
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

entity bcd is
    generic (
        N: Integer;
        digits: Integer
    );
    port (
        clk: in std_logic;
        command: in std_logic_vector(1 downto 0);
        suspended: out std_logic;
        EXTERNAL_binary: in std_logic_vector(N - 1 downto 0);
        EXTERNAL_bcd: out std_logic_vector(digits * 4 - 1 downto 0)
    );
end bcd;

architecture LLFSM of bcd is
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
    constant STATE_FindSignificantBits: std_logic_vector(2 downto 0) := "010";
    constant STATE_ConvertToBcd: std_logic_vector(2 downto 0) := "011";
    constant STATE_UpdateBcdVariable: std_logic_vector(2 downto 0) := "100";
    signal currentState: std_logic_vector(2 downto 0) := STATE_Initial;
    signal targetState: std_logic_vector(2 downto 0) := currentState;
    signal previousRinglet: std_logic_vector(2 downto 0) := "ZZZ";
    signal suspendedFrom: std_logic_vector(2 downto 0) := STATE_Initial;
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
    signal binary: std_logic_vector(N - 1 downto 0);
    signal bcd: std_logic_vector(digits * 4 - 1 downto 0);
    --Machine Variables
    constant maxDivisor: integer := 10 ** (digits - 1);
    signal unsignedBinary: unsigned(N-1 downto 0);
    shared variable data: integer range 0 to 2**N - 1;
    signal tempBcd: unsigned(digits * 4 - 1 downto 0);
    shared variable exponent: integer range -1 to digits - 1 := digits - 1;
    shared variable divisor: integer range 0 to 10 ** (digits - 1) := 10 ** (digits - 1);
begin
process (clk)
    begin
        if (rising_edge(clk)) then
            case internalState is
                when ReadSnapshot =>
                    binary <= EXTERNAL_binary;
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
                        when STATE_FindSignificantBits =>
                            data := to_integer(unsignedBinary) / divisor;
                        when STATE_ConvertToBcd =>
                            tempBcd(exponent * 4 + 3 downto exponent * 4) <= to_unsigned(data, 4);
                            exponent := exponent - 1;
                            divisor := divisor / 10;
                        when STATE_UpdateBcdVariable =>
                            bcd <= std_logic_vector(tempBcd);
                        when others =>
                            null;
                    end case;
                    internalState <= CheckTransition;
                when OnEntry =>
                    case currentState is
                        when STATE_FindSignificantBits =>
                            data := to_integer(unsignedBinary) / divisor;
                        when STATE_ConvertToBcd =>
                            tempBcd(exponent * 4 + 3 downto exponent * 4) <= to_unsigned(data, 4);
                            exponent := exponent - 1;
                            divisor := divisor / 10;
                        when STATE_UpdateBcdVariable =>
                            bcd <= std_logic_vector(tempBcd);
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
                                targetState <= STATE_FindSignificantBits;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_SUSPENDED =>
                            internalState <= Internal;
                        when STATE_FindSignificantBits =>
                            if (true) then
                                targetState <= STATE_ConvertToBcd;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_ConvertToBcd =>
                            if (exponent >= 0) then
                                targetState <= STATE_FindSignificantBits;
                                internalState <= OnExit;
                            elsif (true) and (not (exponent >= 0)) then
                                targetState <= STATE_UpdateBcdVariable;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_UpdateBcdVariable =>
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
                        when STATE_Initial =>
                            unsignedBinary <= unsigned(binary);
                            tempBcd <= (others => '0');
                            exponent := digits - 1;
                            divisor := maxDivisor;
                        when STATE_FindSignificantBits =>
                            unsignedBinary <= unsignedBinary - data * divisor;
                        when others =>
                            null;
                    end case;
                    internalState <= WriteSnapshot;
                when WriteSnapshot =>
                    EXTERNAL_bcd <= bcd;
                    internalState <= ReadSnapshot;
                    previousRinglet <= currentState;
                    currentState <= targetState;
                when others =>
                    null;
            end case;
        end if;
    end process;
end LLFSM;