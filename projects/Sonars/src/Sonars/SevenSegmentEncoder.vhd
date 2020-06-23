--SevenSegmentEncoder.vhd
--
--This is a generated file - DO NOT ALTER.
--Please use an LLFSM editor to change this file.
--Date Generated: 2020-06-23 02:18 EDT
--

library IEEE;
use IEEE.std_logic_1164.All;


entity SevenSegmentEncoder is
    port (
        clk: in std_logic;
        EXTERNAL_data: in std_logic_vector(3 downto 0);
        EXTERNAL_sevenSegmentData: out std_logic_vector(6 downto 0)
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
    signal internalState: std_logic_vector(2 downto 0) := ReadSnapshot;
    --State Representation Bits
    constant STATE_Initial: std_logic_vector(3 downto 0) := "0000";
    constant STATE_SUSPENDED: std_logic_vector(3 downto 0) := "0001";
    constant STATE_InitialPseudoState: std_logic_vector(3 downto 0) := "0010";
    constant STATE_Compare: std_logic_vector(3 downto 0) := "0011";
    constant STATE_Zero: std_logic_vector(3 downto 0) := "0100";
    constant STATE_One: std_logic_vector(3 downto 0) := "0101";
    constant STATE_Two: std_logic_vector(3 downto 0) := "0110";
    constant STATE_Three: std_logic_vector(3 downto 0) := "0111";
    constant STATE_Four: std_logic_vector(3 downto 0) := "1000";
    constant STATE_Five: std_logic_vector(3 downto 0) := "1001";
    constant STATE_Six: std_logic_vector(3 downto 0) := "1010";
    constant STATE_Seven: std_logic_vector(3 downto 0) := "1011";
    constant STATE_Eight: std_logic_vector(3 downto 0) := "1100";
    constant STATE_Nine: std_logic_vector(3 downto 0) := "1101";
    constant STATE_Wait: std_logic_vector(3 downto 0) := "1110";
    constant STATE_Error: std_logic_vector(3 downto 0) := "1111";
    signal currentState: std_logic_vector(3 downto 0) := STATE_Initial;
    signal targetState: std_logic_vector(3 downto 0) := currentState;
    signal previousRinglet: std_logic_vector(3 downto 0) := STATE_Initial xor "1111";
    --Snapshot of External Variables
    signal data: std_logic_vector(3 downto 0);
    signal sevenSegmentData: std_logic_vector(6 downto 0);
    --Machine Variables
    signal oldData: std_logic_vector(3 downto 0);
begin
process (clk)
    begin
        if (rising_edge(clk)) then
            case internalState is
                when ReadSnapshot =>
                    data <= EXTERNAL_data;
                    if (previousRinglet = currentState) then
                        internalState <= CheckTransition;
                    else
                        internalState <= OnEntry;
                    end if;
                when OnEntry =>
                    case currentState is
                        when STATE_Initial=>
                            sevenSegmentData <= "0000000";
                        when STATE_Zero=>
                            sevenSegmentData <= "1111110";
                        when STATE_One=>
                            sevenSegmentData <= "0110000";
                        when STATE_Two=>
                            sevenSegmentData <= "1101101";
                        when STATE_Three=>
                            sevenSegmentData <= "1111001";
                        when STATE_Four=>
                            sevenSegmentData <= "0110011";
                        when STATE_Five=>
                            sevenSegmentData <= "1011011";
                        when STATE_Six=>
                            sevenSegmentData <= "1011111";
                        when STATE_Seven=>
                            sevenSegmentData <= "1110000";
                        when STATE_Eight=>
                            sevenSegmentData <= "1111111";
                        when STATE_Nine=>
                            sevenSegmentData <= "1110011";
                        when STATE_Error=>
                            sevenSegmentData <= "1001111";
                        when others =>
                            null;
                    end case;
                    internalState <= CheckTransition;
                when CheckTransition =>
                    case currentState is
                        when STATE_Initial=>
                            if (true) then
                                targetState <= STATE_Compare;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_SUSPENDED=>
                            internalState <= Internal;
                        when STATE_InitialPseudoState=>
                            if (true) then
                                targetState <= STATE_Initial;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_Compare=>
                            if (data = x"0") then
                                targetState <= STATE_Zero;
                                internalState <= OnExit;
                            elsif (true) and (not (data = x"0")) then
                                targetState <= STATE_One;
                                internalState <= OnExit;
                            elsif (data = x"1") and (not (true)) and (not (data = x"0")) then
                                targetState <= STATE_Two;
                                internalState <= OnExit;
                            elsif (data = x"2") and (not (data = x"1")) and (not (true)) and (not (data = x"0")) then
                                targetState <= STATE_Three;
                                internalState <= OnExit;
                            elsif (data = x"3") and (not (data = x"2")) and (not (data = x"1")) and (not (true)) and (not (data = x"0")) then
                                targetState <= STATE_Four;
                                internalState <= OnExit;
                            elsif (data = x"4") and (not (data = x"3")) and (not (data = x"2")) and (not (data = x"1")) and (not (true)) and (not (data = x"0")) then
                                targetState <= STATE_Five;
                                internalState <= OnExit;
                            elsif (data = x"5") and (not (data = x"4")) and (not (data = x"3")) and (not (data = x"2")) and (not (data = x"1")) and (not (true)) and (not (data = x"0")) then
                                targetState <= STATE_Six;
                                internalState <= OnExit;
                            elsif (data = x"6") and (not (data = x"5")) and (not (data = x"4")) and (not (data = x"3")) and (not (data = x"2")) and (not (data = x"1")) and (not (true)) and (not (data = x"0")) then
                                targetState <= STATE_Seven;
                                internalState <= OnExit;
                            elsif (data = x"7") and (not (data = x"6")) and (not (data = x"5")) and (not (data = x"4")) and (not (data = x"3")) and (not (data = x"2")) and (not (data = x"1")) and (not (true)) and (not (data = x"0")) then
                                targetState <= STATE_Eight;
                                internalState <= OnExit;
                            elsif (data = x"8") and (not (data = x"7")) and (not (data = x"6")) and (not (data = x"5")) and (not (data = x"4")) and (not (data = x"3")) and (not (data = x"2")) and (not (data = x"1")) and (not (true)) and (not (data = x"0")) then
                                targetState <= STATE_Nine;
                                internalState <= OnExit;
                            elsif (data = x"9") and (not (data = x"8")) and (not (data = x"7")) and (not (data = x"6")) and (not (data = x"5")) and (not (data = x"4")) and (not (data = x"3")) and (not (data = x"2")) and (not (data = x"1")) and (not (true)) and (not (data = x"0")) then
                                targetState <= STATE_Error;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_Zero=>
                            if (true) then
                                targetState <= STATE_Wait;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_One=>
                            if (true) then
                                targetState <= STATE_Wait;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_Two=>
                            if (true) then
                                targetState <= STATE_Wait;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_Three=>
                            if (true) then
                                targetState <= STATE_Wait;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_Four=>
                            if (true) then
                                targetState <= STATE_Wait;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_Five=>
                            if (true) then
                                targetState <= STATE_Wait;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_Six=>
                            if (true) then
                                targetState <= STATE_Wait;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_Seven=>
                            if (true) then
                                targetState <= STATE_Wait;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_Eight=>
                            if (true) then
                                targetState <= STATE_Wait;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_Nine=>
                            if (true) then
                                targetState <= STATE_Wait;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_Wait=>
                            if (data /= oldData) then
                                targetState <= STATE_Compare;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_Error=>
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
                        when STATE_Compare=>
                            oldData <= data;
                        when others =>
                            null;
                    end case;
                    internalState <= WriteSnapshot;
                when WriteSnapshot =>
                    EXTERNAL_sevenSegmentData <= sevenSegmentData;
                    internalState <= ReadSnapshot;
                    previousRinglet <= currentState;
                    currentState <= targetState;
                when others =>
                    null;
            end case;
        end if;
    end process;
end LLFSM;