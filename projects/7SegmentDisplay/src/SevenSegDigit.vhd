--SevenSegDigit.vhd
--
--This is a generated file - DO NOT ALTER.
--Please use an LLFSM editor to change this file.
--Date Generated: 2020-09-05 21:22 AEST
--

library IEEE;
use IEEE.std_logic_1164.All;


entity SevenSegDigit is
    port (
        clk: in std_logic;
        EXTERNAL_count: in std_logic(3 downto 0);
        EXTERNAL_output: out std_logic_vector(6 downto 0)
    );
end SevenSegDigit;

architecture LLFSM of SevenSegDigit is
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
    constant STATE_Initial: std_logic_vector(4 downto 0) := "00000";
    constant STATE_SUSPENDED: std_logic_vector(4 downto 0) := "00001";
    constant STATE_InitialPseudoState: std_logic_vector(4 downto 0) := "00010";
    constant STATE_Zero: std_logic_vector(4 downto 0) := "00011";
    constant STATE_One: std_logic_vector(4 downto 0) := "00100";
    constant STATE_Two: std_logic_vector(4 downto 0) := "00101";
    constant STATE_Three: std_logic_vector(4 downto 0) := "00110";
    constant STATE_Four: std_logic_vector(4 downto 0) := "00111";
    constant STATE_Five: std_logic_vector(4 downto 0) := "01000";
    constant STATE_Six: std_logic_vector(4 downto 0) := "01001";
    constant STATE_Seven: std_logic_vector(4 downto 0) := "01010";
    constant STATE_Eight: std_logic_vector(4 downto 0) := "01011";
    constant STATE_Nine: std_logic_vector(4 downto 0) := "01100";
    constant STATE_A: std_logic_vector(4 downto 0) := "01101";
    constant STATE_B: std_logic_vector(4 downto 0) := "01110";
    constant STATE_C: std_logic_vector(4 downto 0) := "01111";
    constant STATE_D: std_logic_vector(4 downto 0) := "10000";
    constant STATE_E: std_logic_vector(4 downto 0) := "10001";
    constant STATE_Check: std_logic_vector(4 downto 0) := "10010";
    signal currentState: std_logic_vector(4 downto 0) := STATE_Initial;
    signal targetState: std_logic_vector(4 downto 0) := currentState;
    signal previousRinglet: std_logic_vector(4 downto 0) := STATE_Initial xor "11111";
    --Snapshot of External Variables
    signal count: std_logic(3 downto 0);
    signal output: std_logic_vector(6 downto 0);
    --Machine Variables
begin
process (clk)
    begin
        if (rising_edge(clk)) then
            case internalState is
                when ReadSnapshot =>
                    count <= EXTERNAL_count;
                    if (previousRinglet = currentState) then
                        internalState <= NoOnEntry;
                    else
                        internalState <= OnEntry;
                    end if;
                when OnEntry =>
                    case currentState is
                        when STATE_Initial =>
                            output <= (others => '0');
                        when STATE_Zero =>
                            output <= x"FE";
                        when others =>
                            null;
                    end case;
                    internalState <= CheckTransition;
                when CheckTransition =>
                    case currentState is
                        when STATE_Initial =>
                            if (true) then
                                targetState <= STATE_Check;
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
                        when STATE_Zero =>
                            if (true) then
                                targetState <= STATE_Check;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_One =>
                            internalState <= Internal;
                        when STATE_Two =>
                            internalState <= Internal;
                        when STATE_Three =>
                            internalState <= Internal;
                        when STATE_Four =>
                            internalState <= Internal;
                        when STATE_Five =>
                            internalState <= Internal;
                        when STATE_Six =>
                            internalState <= Internal;
                        when STATE_Seven =>
                            internalState <= Internal;
                        when STATE_Eight =>
                            internalState <= Internal;
                        when STATE_Nine =>
                            internalState <= Internal;
                        when STATE_A =>
                            internalState <= Internal;
                        when STATE_B =>
                            internalState <= Internal;
                        when STATE_C =>
                            internalState <= Internal;
                        when STATE_D =>
                            internalState <= Internal;
                        when STATE_E =>
                            internalState <= Internal;
                        when STATE_Check =>
                            if (count = x"0") then
                                targetState <= STATE_Zero;
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