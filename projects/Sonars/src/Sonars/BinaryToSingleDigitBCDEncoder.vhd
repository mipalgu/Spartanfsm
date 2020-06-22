--BinaryToSingleDigitBCDEncoder.vhd
--
--This is a generated file - DO NOT ALTER.
--Please use an LLFSM editor to change this file.
--Date Generated: 2020-06-22 09:50 EDT
--

library IEEE;
use IEEE.std_logic_1164.All;
use IEEE.numeric_std.all;

entity BinaryToSingleDigitBCDEncoder is
    port (
        clk: in std_logic;
        EXTERNAL_binary: in std_logic_vector(3 downto 0);
        EXTERNAL_bcd: out std_logic_vector(3 downto 0);
        EXTERNAL_busy: out std_logic;
        EXTERNAL_carry: out std_logic
    );
end BinaryToSingleDigitBCDEncoder;

architecture LLFSM of BinaryToSingleDigitBCDEncoder is
    --Internal State Representation Bits
    constant OnEntry: std_logic_vector(2 downto 0) := "000";
    constant CheckTransition: std_logic_vector(2 downto 0) := "001";
    constant OnExit: std_logic_vector(2 downto 0) := "010";
    constant Internal: std_logic_vector(2 downto 0) := "011";
    constant ReadSnapshot: std_logic_vector(2 downto 0) := "100";
    constant WriteSnapshot: std_logic_vector(2 downto 0) := "101";
    signal internalState: std_logic_vector(2 downto 0) := ReadSnapshot;
    --State Representation Bits
    constant STATE_Initial: std_logic_vector(3 downto 0) := "0000";
    constant STATE_SUSPENDED: std_logic_vector(3 downto 0) := "0001";
    constant STATE_SetBusy: std_logic_vector(3 downto 0) := "0010";
    constant STATE_WaitForNewInput: std_logic_vector(3 downto 0) := "0011";
    constant STATE_CheckCarryBit: std_logic_vector(3 downto 0) := "0100";
    constant STATE_SetHighCarryBit: std_logic_vector(3 downto 0) := "0101";
    constant STATE_SetLowCarryBit: std_logic_vector(3 downto 0) := "0110";
    constant STATE_EncodeWithCarry: std_logic_vector(3 downto 0) := "0111";
    constant STATE_EncodeWithoutCarry: std_logic_vector(3 downto 0) := "1000";
    constant STATE_CountShifts: std_logic_vector(3 downto 0) := "1001";
    constant STATE_CheckLastCarry: std_logic_vector(3 downto 0) := "1010";
    constant STATE_InitialPseudoState: std_logic_vector(3 downto 0) := "1011";
    signal currentState: std_logic_vector(3 downto 0) := STATE_Initial;
    signal targetState: std_logic_vector(3 downto 0) := currentState;
    signal previousRinglet: std_logic_vector(3 downto 0) := STATE_Initial xor "1111";
    --Snapshot of External Variables
    signal binary: std_logic_vector(3 downto 0);
    signal bcd: std_logic_vector(3 downto 0);
    signal busy: std_logic;
    signal carry: std_logic;
    --Machine Variables
    signal oldBinary: std_logic_vector(3 downto 0);
    signal bitsShifted: unsigned(2 downto 0);
    signal oldBcd: std_logic_vector(3 downto 0);
begin
process (clk)
    begin
        if (rising_edge(clk)) then
            case internalState is
                when ReadSnapshot =>
                    binary <= EXTERNAL_binary;
                    if (previousRinglet = currentState) then
                        internalState <= CheckTransition;
                    else
                        internalState <= OnEntry;
                    end if;
                when OnEntry =>
                    case currentState is
                        when STATE_Initial=>
                            busy <= '0';
                            bcd <= "0000";
                            carry <= '0';
                            oldBinary <= "0000";
                        when STATE_SetBusy=>
                            busy <= '1';
                            bitsShifted <= "000";
                        when STATE_WaitForNewInput=>
                            busy <= '0';
                        when STATE_SetHighCarryBit=>
                            carry <= '1';
                        when STATE_SetLowCarryBit=>
                            carry <= '0';
                        when STATE_EncodeWithCarry=>
                            bcd(0) <= binary(3 - to_integer(bitsShifted));
                            bcd(1) <= not oldBcd(0);
                            bcd(2) <= not (oldBcd(1) xor oldBcd(0));
                            bcd(3) <= oldBcd(3) and oldBcd(0);
                        when STATE_EncodeWithoutCarry=>
                            bcd <= oldBcd(2 downto 0) & binary(3 - to_integer(bitsShifted));
                        when STATE_CountShifts=>
                            bitsShifted <= bitsShifted + 1;
                        when STATE_CheckLastCarry=>
                            oldBcd <= bcd;
                        when others =>
                            null;
                    end case;
                    internalState <= CheckTransition;
                when CheckTransition =>
                    case currentState is
                        when STATE_Initial=>
                            if (oldBinary /= binary) then
                                targetState <= STATE_SetBusy;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_SUSPENDED=>
                            internalState <= Internal;
                        when STATE_SetBusy=>
                            if (true) then
                                targetState <= STATE_CheckLastCarry;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_WaitForNewInput=>
                            if (oldBinary /= binary) then
                                targetState <= STATE_SetBusy;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_CheckCarryBit=>
                            if (bcd(3) = '1') then
                                targetState <= STATE_SetHighCarryBit;
                                internalState <= OnExit;
                            elsif (bcd(2) = '1' AND (bcd(1) = '1' OR bcd(0) = '1')) and (not (bcd(3) = '1')) then
                                targetState <= STATE_SetHighCarryBit;
                                internalState <= OnExit;
                            elsif (true) and (not (bcd(2) = '1' AND (bcd(1) = '1' OR bcd(0) = '1'))) and (not (bcd(3) = '1')) then
                                targetState <= STATE_SetLowCarryBit;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_SetHighCarryBit=>
                            if (true) then
                                targetState <= STATE_CountShifts;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_SetLowCarryBit=>
                            if (true) then
                                targetState <= STATE_CountShifts;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_EncodeWithCarry=>
                            if (true) then
                                targetState <= STATE_CheckCarryBit;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_EncodeWithoutCarry=>
                            if (true) then
                                targetState <= STATE_CheckCarryBit;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_CountShifts=>
                            if (bitsShifted < 4) then
                                targetState <= STATE_CheckLastCarry;
                                internalState <= OnExit;
                            elsif (true) and (not (bitsShifted < 4)) then
                                targetState <= STATE_WaitForNewInput;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_CheckLastCarry=>
                            if (carry = '1') then
                                targetState <= STATE_EncodeWithCarry;
                                internalState <= OnExit;
                            elsif (true) and (not (carry = '1')) then
                                targetState <= STATE_EncodeWithoutCarry;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_InitialPseudoState=>
                            if (true) then
                                targetState <= STATE_Initial;
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
                        when STATE_Initial=>
                            oldBinary <= binary;
                        when STATE_WaitForNewInput=>
                            oldBinary <= binary;
                        when others =>
                            null;
                    end case;
                    internalState <= WriteSnapshot;
                when WriteSnapshot =>
                    EXTERNAL_bcd <= bcd;
                    EXTERNAL_busy <= busy;
                    EXTERNAL_carry <= carry;
                    internalState <= ReadSnapshot;
                    previousRinglet <= currentState;
                    currentState <= targetState;
                when others =>
                    null;
            end case;
        end if;
    end process;
end LLFSM;