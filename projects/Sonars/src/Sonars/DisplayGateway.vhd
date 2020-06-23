--DisplayGateway.vhd
--
--This is a generated file - DO NOT ALTER.
--Please use an LLFSM editor to change this file.
--Date Generated: 2020-06-23 03:18 EDT
--

library IEEE;
use IEEE.std_logic_1164.All;
use IEEE.numeric_std.all;

entity DisplayGateway is
    port (
        clk: in std_logic;
        EXTERNAL_addressLine: out std_logic_vector(3 downto 0);
        EXTERNAL_dataLine: out std_logic_vector(7 downto 0);
        EXTERNAL_data: in std_logic_vector(7 downto 0);
        EXTERNAL_digit: in std_logic_vector(3 downto 0);
        EXTERNAL_busy: out std_logic
    );
end DisplayGateway;

architecture LLFSM of DisplayGateway is
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
    constant STATE_NoShutdown: std_logic_vector(3 downto 0) := "0011";
    constant STATE_SetNoDecoding: std_logic_vector(3 downto 0) := "0100";
    constant STATE_SetIntensity: std_logic_vector(3 downto 0) := "0101";
    constant STATE_AllDigitsOn: std_logic_vector(3 downto 0) := "0110";
    constant STATE_DisableDisplayTest: std_logic_vector(3 downto 0) := "0111";
    constant STATE_LatchData: std_logic_vector(3 downto 0) := "1000";
    constant STATE_SendData: std_logic_vector(3 downto 0) := "1001";
    constant STATE_Wait: std_logic_vector(3 downto 0) := "1010";
    constant STATE_CheckIfDifferent: std_logic_vector(3 downto 0) := "1011";
    signal currentState: std_logic_vector(3 downto 0) := STATE_Initial;
    signal targetState: std_logic_vector(3 downto 0) := currentState;
    signal previousRinglet: std_logic_vector(3 downto 0) := STATE_Initial xor "1111";
    --Snapshot of External Variables
    signal addressLine: std_logic_vector(3 downto 0);
    signal dataLine: std_logic_vector(7 downto 0);
    signal data: std_logic_vector(7 downto 0);
    signal digit: std_logic_vector(3 downto 0);
    signal busy: std_logic;
    --Machine Variables
    signal i: unsigned(15 downto 0);
    signal latchedData: std_logic_vector(7 downto 0);
    signal latchedDigit: std_logic_vector(3 downto 0);
begin
process (clk)
    begin
        if (rising_edge(clk)) then
            case internalState is
                when ReadSnapshot =>
                    data <= EXTERNAL_data;
                    digit <= EXTERNAL_digit;
                    if (previousRinglet = currentState) then
                        internalState <= CheckTransition;
                    else
                        internalState <= OnEntry;
                    end if;
                when OnEntry =>
                    case currentState is
                        when STATE_Initial=>
                            busy <= '1';
                        when STATE_NoShutdown=>
                            addressLine <= x"C";
                            dataLine <= x"01";
                        when STATE_SetNoDecoding=>
                            addressLine <= x"9";
                            dataLine <= x"00";
                        when STATE_SetIntensity=>
                            addressLine <= x"A";
                            dataLine <= x"0B";
                        when STATE_AllDigitsOn=>
                            addressLine <= x"B";
                            dataLine <= x"07";
                        when STATE_DisableDisplayTest=>
                            addressLine <= x"F";
                            dataLine <= x"00";
                        when STATE_LatchData=>
                            latchedData <= data;
                            latchedDigit <= digit;
                        when STATE_SendData=>
                            addressLine <= latchedDigit;
                            dataLine <= latchedData;
                        when STATE_Wait=>
                            i <= x"0000";
                        when STATE_CheckIfDifferent=>
                            busy <= '0';
                        when others =>
                            null;
                    end case;
                    internalState <= CheckTransition;
                when CheckTransition =>
                    case currentState is
                        when STATE_Initial=>
                            if (true) then
                                targetState <= STATE_NoShutdown;
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
                        when STATE_NoShutdown=>
                            if (true) then
                                targetState <= STATE_SetNoDecoding;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_SetNoDecoding=>
                            if (true) then
                                targetState <= STATE_SetIntensity;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_SetIntensity=>
                            if (true) then
                                targetState <= STATE_AllDigitsOn;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_AllDigitsOn=>
                            if (true) then
                                targetState <= STATE_DisableDisplayTest;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_DisableDisplayTest=>
                            if (true) then
                                targetState <= STATE_LatchData;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_LatchData=>
                            if (true) then
                                targetState <= STATE_SendData;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_SendData=>
                            if (true) then
                                targetState <= STATE_Wait;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_Wait=>
                            if (i > x"30D4") then
                                targetState <= STATE_CheckIfDifferent;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_CheckIfDifferent=>
                            if (latchedData /= data) then
                                targetState <= STATE_LatchData;
                                internalState <= OnExit;
                            elsif (latchedDigit /= digit) and (not (latchedData /= data)) then
                                targetState <= STATE_LatchData;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when others =>
                            null;
                    end case;
                when Internal =>
                    case currentState is
                        when STATE_Wait=>
                            i <= i + 1;
                        when others =>
                            null;
                    end case;
                    internalState <= WriteSnapshot;
                when OnExit =>
                    case currentState is
                        when STATE_CheckIfDifferent=>
                            busy <= '1';
                        when others =>
                            null;
                    end case;
                    internalState <= WriteSnapshot;
                when WriteSnapshot =>
                    EXTERNAL_addressLine <= addressLine;
                    EXTERNAL_dataLine <= dataLine;
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