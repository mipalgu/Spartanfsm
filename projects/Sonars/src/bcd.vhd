--bcd.vhd
--
--This is a generated file - DO NOT ALTER.
--Please use an LLFSM editor to change this file.
--Date Generated: 2020-09-10 22:32 AEST
--

library IEEE;
use IEEE.std_logic_1164.All;
use IEEE.numeric_std.all;

entity bcd is
    generic (
        N: Integer;
        digits: Integer
    );
    port (
        clk: in std_logic;
        restart: in std_logic;
        resume: in std_logic;
        suspend: in std_logic;
        suspended: out std_logic;
        EXTERNAL_binary: in std_logic_vector(N - 1 downto 0);
        EXTERNAL_bcd: out std_logic_vector(digits * 4 - 1 downto 0)
    );
end bcd;

architecture LLFSM of bcd is
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
    constant STATE_FindSignificantBits: std_logic_vector(2 downto 0) := "011";
    constant STATE_ConvertToBcd: std_logic_vector(2 downto 0) := "100";
    constant STATE_UpdateBcdVariable: std_logic_vector(2 downto 0) := "101";
    signal currentState: std_logic_vector(2 downto 0) := STATE_Initial;
    signal targetState: std_logic_vector(2 downto 0) := currentState;
    signal previousRinglet: std_logic_vector(2 downto 0) := STATE_Initial xor "111";
    signal suspendedFrom: std_logic_vector(2 downto 0) := STATE_Initial;
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
                    binary <= EXTERNAL_binary;
                    if (previousRinglet = currentState) then
                        internalState <= NoOnEntry;
                    else
                        internalState <= OnEntry;
                    end if;
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
                        when STATE_InitialPseudoState =>
                            if (true) then
                                targetState <= STATE_Initial;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
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
                when NoOnEntry =>
                    internalState <= CheckTransition;
                when WriteSnapshot =>
                    EXTERNAL_bcd <= bcd;
                    internalState <= CheckForSuspension;
                    previousRinglet <= currentState;
                    currentState <= targetState;
                when others =>
                    null;
            end case;
        end if;
    end process;
end LLFSM;