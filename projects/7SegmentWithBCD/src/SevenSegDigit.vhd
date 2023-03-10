--SevenSegDigit.vhd
--
--This is a generated file - DO NOT ALTER.
--Please use an LLFSM editor to change this file.
--Date Generated: 2020-09-06 00:03 AEST
--

library IEEE;
use IEEE.std_logic_1164.All;


entity SevenSegDigit is
    port (
        clk: in std_logic;
        EXTERNAL_count: in std_logic_vector(3 downto 0);
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
    constant STATE_F: std_logic_vector(4 downto 0) := "10011";
    signal currentState: std_logic_vector(4 downto 0) := STATE_Initial;
    signal targetState: std_logic_vector(4 downto 0) := currentState;
    signal previousRinglet: std_logic_vector(4 downto 0) := STATE_Initial xor "11111";
    --Snapshot of External Variables
    signal count: std_logic_vector(3 downto 0);
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
                            if (true) then
                                targetState <= STATE_Check;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_Two =>
                            if (true) then
                                targetState <= STATE_Check;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_Three =>
                            if (true) then
                                targetState <= STATE_Check;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_Four =>
                            if (true) then
                                targetState <= STATE_Check;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_Five =>
                            if (true) then
                                targetState <= STATE_Check;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_Six =>
                            if (true) then
                                targetState <= STATE_Check;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_Seven =>
                            if (true) then
                                targetState <= STATE_Check;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_Eight =>
                            if (true) then
                                targetState <= STATE_Check;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_Nine =>
                            if (true) then
                                targetState <= STATE_Check;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_A =>
                            if (true) then
                                targetState <= STATE_Check;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_B =>
                            if (true) then
                                targetState <= STATE_Check;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_C =>
                            if (true) then
                                targetState <= STATE_Check;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_D =>
                            if (true) then
                                targetState <= STATE_Check;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_E =>
                            if (true) then
                                targetState <= STATE_Check;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_Check =>
                            if (count = x"0") then
                                targetState <= STATE_Zero;
                                internalState <= OnExit;
                            elsif (count = x"1") and (not (count = x"0")) then
                                targetState <= STATE_One;
                                internalState <= OnExit;
                            elsif (count = x"2") and (not (count = x"1")) and (not (count = x"0")) then
                                targetState <= STATE_Two;
                                internalState <= OnExit;
                            elsif (count = x"3") and (not (count = x"2")) and (not (count = x"1")) and (not (count = x"0")) then
                                targetState <= STATE_Three;
                                internalState <= OnExit;
                            elsif (count = x"4") and (not (count = x"3")) and (not (count = x"2")) and (not (count = x"1")) and (not (count = x"0")) then
                                targetState <= STATE_Four;
                                internalState <= OnExit;
                            elsif (count = x"5") and (not (count = x"4")) and (not (count = x"3")) and (not (count = x"2")) and (not (count = x"1")) and (not (count = x"0")) then
                                targetState <= STATE_Five;
                                internalState <= OnExit;
                            elsif (count = x"6") and (not (count = x"5")) and (not (count = x"4")) and (not (count = x"3")) and (not (count = x"2")) and (not (count = x"1")) and (not (count = x"0")) then
                                targetState <= STATE_Six;
                                internalState <= OnExit;
                            elsif (count = x"7") and (not (count = x"6")) and (not (count = x"5")) and (not (count = x"4")) and (not (count = x"3")) and (not (count = x"2")) and (not (count = x"1")) and (not (count = x"0")) then
                                targetState <= STATE_Seven;
                                internalState <= OnExit;
                            elsif (count = x"8") and (not (count = x"7")) and (not (count = x"6")) and (not (count = x"5")) and (not (count = x"4")) and (not (count = x"3")) and (not (count = x"2")) and (not (count = x"1")) and (not (count = x"0")) then
                                targetState <= STATE_Eight;
                                internalState <= OnExit;
                            elsif (count = x"9") and (not (count = x"8")) and (not (count = x"7")) and (not (count = x"6")) and (not (count = x"5")) and (not (count = x"4")) and (not (count = x"3")) and (not (count = x"2")) and (not (count = x"1")) and (not (count = x"0")) then
                                targetState <= STATE_Nine;
                                internalState <= OnExit;
                            elsif (count = x"a") and (not (count = x"9")) and (not (count = x"8")) and (not (count = x"7")) and (not (count = x"6")) and (not (count = x"5")) and (not (count = x"4")) and (not (count = x"3")) and (not (count = x"2")) and (not (count = x"1")) and (not (count = x"0")) then
                                targetState <= STATE_A;
                                internalState <= OnExit;
                            elsif (count = x"b") and (not (count = x"a")) and (not (count = x"9")) and (not (count = x"8")) and (not (count = x"7")) and (not (count = x"6")) and (not (count = x"5")) and (not (count = x"4")) and (not (count = x"3")) and (not (count = x"2")) and (not (count = x"1")) and (not (count = x"0")) then
                                targetState <= STATE_B;
                                internalState <= OnExit;
                            elsif (count = x"c") and (not (count = x"b")) and (not (count = x"a")) and (not (count = x"9")) and (not (count = x"8")) and (not (count = x"7")) and (not (count = x"6")) and (not (count = x"5")) and (not (count = x"4")) and (not (count = x"3")) and (not (count = x"2")) and (not (count = x"1")) and (not (count = x"0")) then
                                targetState <= STATE_C;
                                internalState <= OnExit;
                            elsif (count = x"d") and (not (count = x"c")) and (not (count = x"b")) and (not (count = x"a")) and (not (count = x"9")) and (not (count = x"8")) and (not (count = x"7")) and (not (count = x"6")) and (not (count = x"5")) and (not (count = x"4")) and (not (count = x"3")) and (not (count = x"2")) and (not (count = x"1")) and (not (count = x"0")) then
                                targetState <= STATE_D;
                                internalState <= OnExit;
                            elsif (count = x"e") and (not (count = x"d")) and (not (count = x"c")) and (not (count = x"b")) and (not (count = x"a")) and (not (count = x"9")) and (not (count = x"8")) and (not (count = x"7")) and (not (count = x"6")) and (not (count = x"5")) and (not (count = x"4")) and (not (count = x"3")) and (not (count = x"2")) and (not (count = x"1")) and (not (count = x"0")) then
                                targetState <= STATE_E;
                                internalState <= OnExit;
                            elsif (count = x"f") and (not (count = x"e")) and (not (count = x"d")) and (not (count = x"c")) and (not (count = x"b")) and (not (count = x"a")) and (not (count = x"9")) and (not (count = x"8")) and (not (count = x"7")) and (not (count = x"6")) and (not (count = x"5")) and (not (count = x"4")) and (not (count = x"3")) and (not (count = x"2")) and (not (count = x"1")) and (not (count = x"0")) then
                                targetState <= STATE_F;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_F =>
                            if (true) then
                                targetState <= STATE_Check;
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