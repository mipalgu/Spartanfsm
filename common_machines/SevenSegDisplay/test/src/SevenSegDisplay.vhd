--SevenSegDisplay.vhd
--
--This is a generated file - DO NOT ALTER.
--Please use an LLFSM editor to change this file.
--Date Generated: 2020-09-10 23:56 AEST
--

library IEEE;
use IEEE.std_logic_1164.All;
use ieee.numeric_std.all;
use digit.digit_array_pkg.all;

-- REQUIRES VHDL2008

entity SevenSegDisplay is
    generic (
        N: integer;
        digits: Integer
    );
    port (
        clk: in std_logic;
        restart: in std_logic;
        resume: in std_logic;
        suspend: in std_logic;
        suspended: out std_logic;
        EXTERNAL_number: in std_logic_vector(N - 1 downto 0);
        EXTERNAL_sevSegDigits: out digit_array(digits - 1 downto 0)(7 downto 0)
    );
end SevenSegDisplay;

architecture LLFSM of SevenSegDisplay is
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
    constant STATE_WaitForBCDEncoding: std_logic_vector(2 downto 0) := "011";
    constant STATE_SendToDisplays: std_logic_vector(2 downto 0) := "100";
    constant STATE_ChangeDigit: std_logic_vector(2 downto 0) := "101";
    signal currentState: std_logic_vector(2 downto 0) := STATE_Initial;
    signal targetState: std_logic_vector(2 downto 0) := currentState;
    signal previousRinglet: std_logic_vector(2 downto 0) := STATE_Initial xor "111";
    signal suspendedFrom: std_logic_vector(2 downto 0) := STATE_Initial;
    --Snapshot of External Variables
    signal number: std_logic_vector(N - 1 downto 0);
    signal sevSegDigits: digit_array(digits - 1 downto 0)(7 downto 0);
    --Machine Variables
    signal restartBcd: std_logic := '1';
    signal suspendedBcd: std_logic;
    signal bcdOut: std_logic_vector(digits * 4 - 1 downto 0);
    shared variable currentDigit: Integer range 0 to digits := 0;
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
                    number <= EXTERNAL_number;
                    if (previousRinglet = currentState) then
                        internalState <= NoOnEntry;
                    else
                        internalState <= OnEntry;
                    end if;
                when OnEntry =>
                    case currentState is
                        when STATE_WaitForBCDEncoding =>
                            restartBcd <= '1';
                        when STATE_SendToDisplays =>
                            sevSegDigits(currentDigit) <= bcdOut(currentDigit * 4 + 3 downto currentDigit * 4);
                        when STATE_ChangeDigit =>
                            currentDigit := currentDigit + 1;
                        when others =>
                            null;
                    end case;
                    internalState <= CheckTransition;
                when CheckTransition =>
                    case currentState is
                        when STATE_Initial =>
                            if (true) then
                                targetState <= STATE_WaitForBCDEncoding;
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
                        when STATE_WaitForBCDEncoding =>
                            if (suspendedBcd = '1') then
                                targetState <= STATE_SendToDisplays;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_SendToDisplays =>
                            if (true) then
                                targetState <= STATE_ChangeDigit;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_ChangeDigit =>
                            if (currentDigit < digits) then
                                targetState <= STATE_SendToDisplays;
                                internalState <= OnExit;
                            elsif (true) and (not (currentDigit < digits)) then
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
                            currentDigit := 0;
                            restartBcd <= '0';
                        when others =>
                            null;
                    end case;
                    internalState <= WriteSnapshot;
                when NoOnEntry =>
                    internalState <= CheckTransition;
                when WriteSnapshot =>
                    EXTERNAL_sevSegDigits <= sevSegDigits;
                    internalState <= CheckForSuspension;
                    previousRinglet <= currentState;
                    currentState <= targetState;
                when others =>
                    null;
            end case;
        end if;
    end process;
end LLFSM;