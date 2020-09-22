--SingleDigitBCDEncoderWithShifting.vhd
--
--This is a generated file - DO NOT ALTER.
--Please use an LLFSM editor to change this file.
--Date Generated: 2020-06-24 20:23 EDT
--

library IEEE;
use IEEE.std_logic_1164.All;


entity SingleDigitBCDEncoderWithShifting is
    port (
        clk: in std_logic;
        EXTERNAL_binary: in std_logic;
        EXTERNAL_enable: in std_logic;
        EXTERNAL_busy: out std_logic;
        EXTERNAL_bcd: out std_logic_vector(3 downto 0);
        EXTERNAL_reset: in std_logic;
        EXTERNAL_carry: out std_logic
    );
end SingleDigitBCDEncoderWithShifting;

architecture LLFSM of SingleDigitBCDEncoderWithShifting is
    --Internal State Representation Bits
    constant OnEntry: std_logic_vector(2 downto 0) := "000";
    constant CheckTransition: std_logic_vector(2 downto 0) := "001";
    constant OnExit: std_logic_vector(2 downto 0) := "010";
    constant Internal: std_logic_vector(2 downto 0) := "011";
    constant ReadSnapshot: std_logic_vector(2 downto 0) := "100";
    constant WriteSnapshot: std_logic_vector(2 downto 0) := "101";
    constant NoOnEntry: std_logic_vector(2 downto 0) := "110";
    signal internalState: std_logic_vector(2 downto 0) := ReadSnapshot;
    --State Representation Bits
    constant STATE_Initial: std_logic_vector(3 downto 0) := "0000";
    constant STATE_SUSPENDED: std_logic_vector(3 downto 0) := "0001";
    constant STATE_ResetRegisters: std_logic_vector(3 downto 0) := "0010";
    constant STATE_SetBusy: std_logic_vector(3 downto 0) := "0011";
    constant STATE_EncodeWithCarry: std_logic_vector(3 downto 0) := "0100";
    constant STATE_EncodeWithoutCarry: std_logic_vector(3 downto 0) := "0101";
    constant STATE_SetCarry: std_logic_vector(3 downto 0) := "0110";
    constant STATE_WaitForEnable: std_logic_vector(3 downto 0) := "0111";
    constant STATE_InitialPseudoState: std_logic_vector(3 downto 0) := "1000";
    signal currentState: std_logic_vector(3 downto 0) := STATE_Initial;
    signal targetState: std_logic_vector(3 downto 0) := currentState;
    signal previousRinglet: std_logic_vector(3 downto 0) := STATE_Initial xor "1111";
    --Snapshot of External Variables
    signal binary: std_logic;
    signal enable: std_logic;
    signal busy: std_logic;
    signal bcd: std_logic_vector(3 downto 0);
    signal reset: std_logic;
    signal carry: std_logic;
    --Machine Variables
    signal latchedBinary: std_logic;
begin
process (clk)
    begin
        if (rising_edge(clk)) then
            case internalState is
                when ReadSnapshot =>
                    binary <= EXTERNAL_binary;
                    enable <= EXTERNAL_enable;
                    reset <= EXTERNAL_reset;
                    if (previousRinglet = currentState) then
                        internalState <= NoOnEntry;
                    else
                        internalState <= OnEntry;
                    end if;
                when OnEntry =>
                    case currentState is
                        when STATE_ResetRegisters =>
                            bcd <= "0000";
                            busy <= '0';
                            latchedBinary <= '0';
                            carry <= '0';
                        when STATE_SetBusy =>
                            busy <= '1';
                        when STATE_EncodeWithCarry =>
                            bcd(0) <= latchedBinary;
                            bcd(1) <= not bcd(0);
                            bcd(2) <= not (bcd(1) xor bcd(0));
                            bcd(3) <= bcd(3) and bcd(0);
                        when STATE_EncodeWithoutCarry =>
                            bcd <= bcd(2 downto 0) & latchedBinary;
                        when STATE_SetCarry =>
                            carry <= bcd(3) or (bcd(2) and bcd(1)) or (bcd(2) and bcd(0));
                        when STATE_WaitForEnable =>
                            busy <= '0';
                        when others =>
                            null;
                    end case;
                    internalState <= CheckTransition;
                when CheckTransition =>
                    case currentState is
                        when STATE_Initial =>
                            if (true) then
                                targetState <= STATE_ResetRegisters;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_SUSPENDED =>
                            internalState <= Internal;
                        when STATE_ResetRegisters =>
                            if (enable = '1') then
                                targetState <= STATE_SetBusy;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_SetBusy =>
                            if (carry = '1') then
                                targetState <= STATE_EncodeWithCarry;
                                internalState <= OnExit;
                            elsif (true) and (not (carry = '1')) then
                                targetState <= STATE_EncodeWithoutCarry;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_EncodeWithCarry =>
                            if (true) then
                                targetState <= STATE_SetCarry;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_EncodeWithoutCarry =>
                            if (true) then
                                targetState <= STATE_SetCarry;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_SetCarry =>
                            if (enable = '0') then
                                targetState <= STATE_WaitForEnable;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_WaitForEnable =>
                            if (reset = '0') then
                                targetState <= STATE_ResetRegisters;
                                internalState <= OnExit;
                            elsif (enable = '1') and (not (reset = '0')) then
                                targetState <= STATE_SetBusy;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_InitialPseudoState =>
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
                        when STATE_ResetRegisters =>
                            latchedBinary <= binary;
                        when STATE_WaitForEnable =>
                            latchedBinary <= binary;
                        when others =>
                            null;
                    end case;
                    internalState <= WriteSnapshot;
                when NoOnEntry =>
                    internalState <= CheckTransition;
                when WriteSnapshot =>
                    EXTERNAL_busy <= busy;
                    EXTERNAL_bcd <= bcd;
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