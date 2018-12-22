library IEEE;
use IEEE.std_logic_1164.All;

entity LightShow is
    port(
        clk50: in std_logic;
        sw: in std_logic_vector(0 downto 0);
        leds: out std_logic_vector(7 downto 0)
    );
end LightShow;

architecture Behavioural of LightShow is
    --Internal State Representation Bits
    constant OnEntry: std_logic_vector(1 downto 0) := "00";
    constant CheckTransition: std_logic_vector(1 downto 0) := "01";
    constant OnExit: std_logic_vector(1 downto 0) := "10";
    constant Internal: std_logic_vector(1 downto 0) := "11";
    signal internalState: std_logic_vector(1 downto 0) := OnEntry;
    constant InitialPseudoState: std_logic_vector(1 downto 0) := "00";
    constant HighFour: std_logic_vector(1 downto 0) := "01";
    constant LowFour: std_logic_vector(1 downto 0) := "10";
    signal currentState: std_logic_vector(1 downto 0) := InitialPseudoState;
    signal targetState: std_logic_vector(1 downto 0);
    constant swON: std_logic_vector(0 downto 0) := "1";
    constant swOFF: std_logic_vector(0 downto 0):= "0";
    constant ledsLowFour: std_logic_vector(7 downto 0) := "00001111";
    constant ledsHighFour: std_logic_vector(7 downto 0) := "11110000";
begin
process (clk50)
    begin
        if (rising_edge(clk50)) then
            case currentState is
                when InitialPseudoState =>
                    case internalState is
                        when OnEntry =>
                            
                            internalState <= CheckTransition;
                        when Internal =>
                            
                            internalState <= CheckTransition;
                        when OnExit =>
                            
                            internalState <= OnEntry;
                            currentState <= targetState;
                        when others =>
                            null;
                    end case;
                when HighFour =>
                    case internalState is
                        when OnEntry =>
                            
                            internalState <= CheckTransition;
                        when Internal =>
                            leds <= ledsHighFour;
                            internalState <= CheckTransition;
                        when OnExit =>
                            
                            internalState <= OnEntry;
                            currentState <= targetState;
                        when others =>
                            null;
                    end case;
                when LowFour =>
                    case internalState is
                        when OnEntry =>
                            
                            internalState <= CheckTransition;
                        when Internal =>
                            leds <= ledsLowFour;
                            internalState <= CheckTransition;
                        when OnExit =>
                            
                            internalState <= OnEntry;
                            currentState <= targetState;
                        when others =>
                            null;
                    end case;
                when others =>
                    null;
            end case;
        end if;
        if (falling_edge(clk50)) then
            case internalState is
                when CheckTransition =>
                    case currentState is
                        When InitialPseudoState =>
                            targetState <= HighFour;
                            internalState <= OnExit;
                        when HighFour =>
                            if (sw = swON) then
                                targetState <= LowFour;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when LowFour =>
                            if (sw = swOFF) then
                                targetState <= HighFour;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when others =>
                            null;
                    end case;
                when others =>
                    null;
            end case;
        end if;
    end process;
end Behavioural;
