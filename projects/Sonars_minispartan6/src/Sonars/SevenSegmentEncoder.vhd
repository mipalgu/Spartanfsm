--SevenSegmentEncoder.vhd
--
--This is a generated file - DO NOT ALTER.
--Please use an LLFSM editor to change this file.
--Date Generated: 2020-06-24 20:22 EDT
--

library IEEE;
use IEEE.std_logic_1164.All;


entity SevenSegmentEncoder is
    port (
        clk: in std_logic;
        EXTERNAL_data: in std_logic_vector(3 downto 0);
        EXTERNAL_sevenSegmentData: out std_logic_vector(6 downto 0);
        EXTERNAL_busy: out std_logic
    );
end SevenSegmentEncoder;

architecture LLFSM of SevenSegmentEncoder is
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
    constant STATE_Compare: std_logic_vector(4 downto 0) := "00011";
    constant STATE_Zero: std_logic_vector(4 downto 0) := "00100";
    constant STATE_One: std_logic_vector(4 downto 0) := "00101";
    constant STATE_Two: std_logic_vector(4 downto 0) := "00110";
    constant STATE_Three: std_logic_vector(4 downto 0) := "00111";
    constant STATE_Four: std_logic_vector(4 downto 0) := "01000";
    constant STATE_Five: std_logic_vector(4 downto 0) := "01001";
    constant STATE_Six: std_logic_vector(4 downto 0) := "01010";
    constant STATE_Seven: std_logic_vector(4 downto 0) := "01011";
    constant STATE_Eight: std_logic_vector(4 downto 0) := "01100";
    constant STATE_Nine: std_logic_vector(4 downto 0) := "01101";
    constant STATE_Wait: std_logic_vector(4 downto 0) := "01110";
    constant STATE_Error: std_logic_vector(4 downto 0) := "01111";
    constant STATE_Dash: std_logic_vector(4 downto 0) := "10000";
    signal currentState: std_logic_vector(4 downto 0) := STATE_Initial;
    signal targetState: std_logic_vector(4 downto 0) := currentState;
    signal previousRinglet: std_logic_vector(4 downto 0) := STATE_Initial xor "11111";
    --Snapshot of External Variables
    signal data: std_logic_vector(3 downto 0);
    signal sevenSegmentData: std_logic_vector(6 downto 0);
    signal busy: std_logic;
    --Machine Variables
    signal latchedData: std_logic_vector(3 downto 0);
begin
process (clk)
    begin
        if (rising_edge(clk)) then
            case internalState is
                when ReadSnapshot =>
                    data <= EXTERNAL_data;
                    if (previousRinglet = currentState) then
                        internalState <= NoOnEntry;
                    else
                        internalState <= OnEntry;
                    end if;
                when OnEntry =>
                    case currentState is
                        when STATE_Initial =>
                            sevenSegmentData <= "0000000";
                            latchedData <= data;
                        when STATE_Zero =>
                            sevenSegmentData <= "1111110";
                        when STATE_One =>
                            sevenSegmentData <= "0110000";
                        when STATE_Two =>
                            sevenSegmentData <= "1101101";
                        when STATE_Three =>
                            sevenSegmentData <= "1111001";
                        when STATE_Four =>
                            sevenSegmentData <= "0110011";
                        when STATE_Five =>
                            sevenSegmentData <= "1011011";
                        when STATE_Six =>
                            sevenSegmentData <= "1011111";
                        when STATE_Seven =>
                            sevenSegmentData <= "1110000";
                        when STATE_Eight =>
                            sevenSegmentData <= "1111111";
                        when STATE_Nine =>
                            sevenSegmentData <= "1110011";
                        when STATE_Wait =>
                            busy <= '0';
                        when STATE_Error =>
                            sevenSegmentData <= "1001111";
                        when STATE_Dash =>
                            sevenSegmentData <= "0000001";
                        when others =>
                            null;
                    end case;
                    internalState <= CheckTransition;
                when CheckTransition =>
                    case currentState is
                        when STATE_Initial =>
                            if (true) then
                                targetState <= STATE_Compare;
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
                        when STATE_Compare =>
                            if (latchedData = x"0") then
                                targetState <= STATE_Zero;
                                internalState <= OnExit;
                            elsif (latchedData = x"A") and (not (latchedData = x"0")) then
                                targetState <= STATE_One;
                                internalState <= OnExit;
                            elsif (true) and (not (latchedData = x"A")) and (not (latchedData = x"0")) then
                                targetState <= STATE_Two;
                                internalState <= OnExit;
                            elsif (latchedData = x"1") and (not (true)) and (not (latchedData = x"A")) and (not (latchedData = x"0")) then
                                targetState <= STATE_Three;
                                internalState <= OnExit;
                            elsif (latchedData = x"2") and (not (latchedData = x"1")) and (not (true)) and (not (latchedData = x"A")) and (not (latchedData = x"0")) then
                                targetState <= STATE_Four;
                                internalState <= OnExit;
                            elsif (latchedData = x"3") and (not (latchedData = x"2")) and (not (latchedData = x"1")) and (not (true)) and (not (latchedData = x"A")) and (not (latchedData = x"0")) then
                                targetState <= STATE_Five;
                                internalState <= OnExit;
                            elsif (latchedData = x"4") and (not (latchedData = x"3")) and (not (latchedData = x"2")) and (not (latchedData = x"1")) and (not (true)) and (not (latchedData = x"A")) and (not (latchedData = x"0")) then
                                targetState <= STATE_Six;
                                internalState <= OnExit;
                            elsif (latchedData = x"5") and (not (latchedData = x"4")) and (not (latchedData = x"3")) and (not (latchedData = x"2")) and (not (latchedData = x"1")) and (not (true)) and (not (latchedData = x"A")) and (not (latchedData = x"0")) then
                                targetState <= STATE_Seven;
                                internalState <= OnExit;
                            elsif (latchedData = x"6") and (not (latchedData = x"5")) and (not (latchedData = x"4")) and (not (latchedData = x"3")) and (not (latchedData = x"2")) and (not (latchedData = x"1")) and (not (true)) and (not (latchedData = x"A")) and (not (latchedData = x"0")) then
                                targetState <= STATE_Eight;
                                internalState <= OnExit;
                            elsif (latchedData = x"7") and (not (latchedData = x"6")) and (not (latchedData = x"5")) and (not (latchedData = x"4")) and (not (latchedData = x"3")) and (not (latchedData = x"2")) and (not (latchedData = x"1")) and (not (true)) and (not (latchedData = x"A")) and (not (latchedData = x"0")) then
                                targetState <= STATE_Nine;
                                internalState <= OnExit;
                            elsif (latchedData = x"8") and (not (latchedData = x"7")) and (not (latchedData = x"6")) and (not (latchedData = x"5")) and (not (latchedData = x"4")) and (not (latchedData = x"3")) and (not (latchedData = x"2")) and (not (latchedData = x"1")) and (not (true)) and (not (latchedData = x"A")) and (not (latchedData = x"0")) then
                                targetState <= STATE_Dash;
                                internalState <= OnExit;
                            elsif (latchedData = x"9") and (not (latchedData = x"8")) and (not (latchedData = x"7")) and (not (latchedData = x"6")) and (not (latchedData = x"5")) and (not (latchedData = x"4")) and (not (latchedData = x"3")) and (not (latchedData = x"2")) and (not (latchedData = x"1")) and (not (true)) and (not (latchedData = x"A")) and (not (latchedData = x"0")) then
                                targetState <= STATE_Error;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_Zero =>
                            if (true) then
                                targetState <= STATE_Wait;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_One =>
                            if (true) then
                                targetState <= STATE_Wait;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_Two =>
                            if (true) then
                                targetState <= STATE_Wait;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_Three =>
                            if (true) then
                                targetState <= STATE_Wait;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_Four =>
                            if (true) then
                                targetState <= STATE_Wait;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_Five =>
                            if (true) then
                                targetState <= STATE_Wait;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_Six =>
                            if (true) then
                                targetState <= STATE_Wait;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_Seven =>
                            if (true) then
                                targetState <= STATE_Wait;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_Eight =>
                            if (true) then
                                targetState <= STATE_Wait;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_Nine =>
                            if (true) then
                                targetState <= STATE_Wait;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_Wait =>
                            if (latchedData /= data) then
                                targetState <= STATE_Compare;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_Error =>
                            if (true) then
                                targetState <= STATE_Wait;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_Dash =>
                            if (true) then
                                targetState <= STATE_Wait;
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
                            busy <= '1';
                        when STATE_Wait =>
                            busy <= '1';
                            latchedData <= data;
                        when others =>
                            null;
                    end case;
                    internalState <= WriteSnapshot;
                when NoOnEntry =>
                    internalState <= CheckTransition;
                when WriteSnapshot =>
                    EXTERNAL_sevenSegmentData <= sevenSegmentData;
                    EXTERNAL_busy <= busy;
                    internalState <= ReadSnapshot;
                    previousRinglet <= currentState;
                    currentState <= targetState;
                when others =>
                    null;
            end case;
        end if;
    end process;
end LLFSM;