library IEEE;
use IEEE.std_logic_1164.All;

entity PixelFlip is
    port(
        clk50: in std_logic;
        redOut: out std_logic_vector(7 downto 0);
        greenOut: out std_logic_vector(7 downto 0)
    );
end PixelFlip;

architecture Behavioural of PixelFlip is
    --Internal State Representation Bits
    constant OnEntry: std_logic_vector(1 downto 0) := "00";
    constant CheckTransition: std_logic_vector(1 downto 0) := "01";
    constant OnExit: std_logic_vector(1 downto 0) := "10";
    constant Internal: std_logic_vector(1 downto 0) := "11";
    signal internalState: std_logic_vector(1 downto 0) := OnEntry;
    constant Compare: std_logic_vector(1 downto 0) := "00";
    constant Red: std_logic_vector(1 downto 0) := "01";
    constant Green: std_logic_vector(1 downto 0) := "10";
    constant Waits: std_logic_vector(1 downto 0) := "11";
    signal currentState: std_logic_vector(1 downto 0) := Compare;
    signal targetState: std_logic_vector(1 downto 0);

    signal pastRed: std_logic_vector(7 downto 0) := "00000000";
    signal pastGreen: std_logic_vector(7 downto 0) := "00000000";
	 
	 signal i: integer := 0;
	 
begin
process (clk50)
    begin
        if (rising_edge(clk50)) then
            case currentState is
                when Compare =>
                    case internalState is
                        when OnEntry =>
                            
                            internalState <= CheckTransition;
                        when Internal =>
                            
                            internalState <= CheckTransition;
                        when OnExit =>
                            
                            if (currentState = targetState) then
                                internalState <= internal;
                            else
                                internalState <= OnEntry;
                            end if;
                            currentState <= targetState;
                        when others =>
                            null;
                    end case;
                when Red =>
                    case internalState is
                        when OnEntry =>
                            redOut <= "11111111";
                            greenOut <= "00000000";
                            internalState <= CheckTransition;
                        when Internal =>
                            
                            internalState <= CheckTransition;
                        when OnExit =>
                            pastRed <= "11111111";
                            pastGreen <= "00000000";
                            if (currentState = targetState) then
                                internalState <= internal;
                            else
                                internalState <= OnEntry;
                            end if;
                            currentState <= targetState;
                        when others =>
                            null;
                    end case;
                when Green =>
                    case internalState is
                        when OnEntry =>
                            redOut <= "00000000";
                            greenOut <= "11111111";
                            internalState <= CheckTransition;
                        when Internal =>
                            
                            internalState <= CheckTransition;
                        when OnExit =>
                            pastGreen <= "11111111";
                            pastRed <= "00000000";
                            if (currentState = targetState) then
                                internalState <= internal;
                            else
                                internalState <= OnEntry;
                            end if;
                            currentState <= targetState;
                        when others =>
                            null;
                    end case;
                when Waits =>
                    case internalState is
                        when OnEntry =>
                            i <= 0;
                            internalState <= CheckTransition;
                        when Internal =>
                            i <= i + 1;
                            internalState <= CheckTransition;
                        when OnExit =>
                            
                            if (currentState = targetState) then
                                internalState <= internal;
                            else
                                internalState <= OnEntry;
                            end if;
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
                        when Compare =>
                            if (pastRed /= "11111111") then
                                targetState <= Red;
                                internalState <= OnExit;
                            elsif (pastGreen /= "11111111") and (not (pastRed /= "11111111")) then
                                targetState <= Green;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when Red =>
                            if (true) then
                                targetState <= Waits;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when Green =>
                            if (true) then
                                targetState <= Waits;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when Waits =>
                            if (i >= 50000000) then
                                targetState <= Compare;
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
