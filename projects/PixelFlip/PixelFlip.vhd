library IEEE;
use IEEE.std_logic_1164.All;
use IEEE.numeric_std.all;

entity PixelFlip is
    port (
        clk: in std_logic;
        EXTERNAL_redOut: out std_logic_vector(7 downto 0);
        EXTERNAL_greenOut: out std_logic_vector(7 downto 0)
    );
end PixelFlip;

architecture LLFSM of PixelFlip is
    --Internal State Representation Bits
    constant OnEntry: std_logic_vector(2 downto 0) := "000";
    constant CheckTransition: std_logic_vector(2 downto 0) := "001";
    constant OnExit: std_logic_vector(2 downto 0) := "010";
    constant Internal: std_logic_vector(2 downto 0) := "011";
    constant ReadToSnapshot: std_logic_vector(2 downto 0) := "100";
    constant WriteFromSnapshot: std_logic_vector(2 downto 0) := "101";
    signal internalState: std_logic_vector(2 downto 0) := ReadToSnapshot;
    --State Representation Bits
    constant STATE_Compare: std_logic_vector(1 downto 0) := "00";
    constant STATE_Red: std_logic_vector(1 downto 0) := "01";
    constant STATE_Green: std_logic_vector(1 downto 0) := "10";
    constant STATE_Wait: std_logic_vector(1 downto 0) := "11";
    signal currentState: std_logic_vector(1 downto 0) := STATE_Compare;
    signal targetState: std_logic_vector(1 downto 0) := currentState;
    signal previousRinglet: std_logic_vector(1 downto 0) := STATE_Compare xor "11";
    --Snapshot of External Variables
    signal redOut: std_logic_vector(7 downto 0);
    signal greenOut: std_logic_vector(7 downto 0);
    --Machine Variables
    signal pastRed: std_logic_vector(7 downto 0) := "00000000";
    signal pastGreen: std_logic_vector(7 downto 0) := "00000000";
    signal i: unsigned(25 downto 0);
begin
process (clk)
    begin
        if (rising_edge(clk)) then
            case currentState is
                when STATE_Compare =>
                    case internalState is
                        when OnEntry =>
                            internalState <= CheckTransition;
                        when Internal =>
                            internalState <= WriteFromSnapshot;
                        when OnExit =>
                            internalState <= WriteFromSnapshot;
                        when WriteFromSnapshot =>
                            EXTERNAL_redOut <= redOut;
                            EXTERNAL_greenOut <= greenOut;
                            internalState <= ReadToSnapshot;
                            previousRinglet <= currentState;
                            currentState <= targetState;
                        when others =>
                            null;
                    end case;
                when STATE_Red =>
                    case internalState is
                        when OnEntry =>
                            redOut <= "11111111";
                            greenOut <= "00000000";
                            internalState <= CheckTransition;
                        when Internal =>
                            internalState <= WriteFromSnapshot;
                        when OnExit =>
                            pastRed <= "11111111";
                            pastGreen <= "00000000";
                            internalState <= WriteFromSnapshot;
                        when WriteFromSnapshot =>
                            EXTERNAL_redOut <= redOut;
                            EXTERNAL_greenOut <= greenOut;
                            internalState <= ReadToSnapshot;
                            previousRinglet <= currentState;
                            currentState <= targetState;
                        when others =>
                            null;
                    end case;
                when STATE_Green =>
                    case internalState is
                        when OnEntry =>
                            redOut <= "00000000";
                            greenOut <= "11111111";
                            internalState <= CheckTransition;
                        when Internal =>
                            internalState <= WriteFromSnapshot;
                        when OnExit =>
                            pastGreen <= "11111111";
                            pastRed <= "00000000";
                            internalState <= WriteFromSnapshot;
                        when WriteFromSnapshot =>
                            EXTERNAL_redOut <= redOut;
                            EXTERNAL_greenOut <= greenOut;
                            internalState <= ReadToSnapshot;
                            previousRinglet <= currentState;
                            currentState <= targetState;
                        when others =>
                            null;
                    end case;
                when STATE_Wait =>
                    case internalState is
                        when OnEntry =>
                            i <= "00000000000000000000000000";
                            internalState <= CheckTransition;
                        when Internal =>
                            i <= i + "00000000000000000000000001";
                            internalState <= WriteFromSnapshot;
                        when OnExit =>
                            internalState <= WriteFromSnapshot;
                        when WriteFromSnapshot =>
                            EXTERNAL_redOut <= redOut;
                            EXTERNAL_greenOut <= greenOut;
                            internalState <= ReadToSnapshot;
                            previousRinglet <= currentState;
                            currentState <= targetState;
                        when others =>
                            null;
                    end case;
                when others =>
                    null;
            end case;
        end if;
        if (falling_edge(clk)) then
            case internalState is
                when CheckTransition =>
                    case currentState is
                        when STATE_Compare =>
                            if (pastRed /= "11111111") then
                                targetState <= STATE_Red;
                                internalState <= OnExit;
                            elsif (pastGreen /= "11111111") and (not (pastRed /= "11111111")) then
                                targetState <= STATE_Green;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_Red =>
                            if (true) then
                                targetState <= STATE_Wait;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_Green =>
                            if (true) then
                                targetState <= STATE_Wait;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_Wait =>
                            if (i >= "10111110101111000010000000") then
                                targetState <= STATE_Compare;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when others =>
                            null;
                    end case;
                when ReadToSnapshot =>
                    if (previousRinglet = currentState) then
                        internalState <= CheckTransition;
                    else
                        internalState <= OnEntry;
                    end if;
                when others =>
                    null;
            end case;
        end if;
    end process;
end LLFSM;