----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:20:14 03/14/2018 
-- Design Name: 
-- Module Name:    lightShowFSM - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity lightShowFSM is
	port(
		clk50: in std_logic; --clock
		sw: in std_logic_vector(0 downto 0); --dip switch 1
		leds: out std_logic_vector(7 downto 0) --LEDS
	);
end lightShowFSM;

architecture Behavioral of lightShowFSM is
	--Set constant values for status bits
	constant OnEntry: std_logic_vector(1 downto 0) := "00";
	constant CheckTransition: std_logic_vector(1 downto 0) := "01";
	constant OnExit: std_logic_vector(1 downto 0) := "10";
	constant Internal: std_logic_vector(1 downto 0) := "11";
	
	--initial status
	signal internalState: std_logic_vector(1 downto 0) := onEntry;
	
	--Set constant values for state bits
	constant HighFour: std_logic_vector(1 downto 0) := "01";
	constant LowFour: std_logic_vector(1 downto 0) := "10";
	constant ExitState: std_logic_vector(1 downto 0) := "11";
	
	--initial state bits: leds 7 -> 4 are logic high
	signal currentState: std_logic_vector(1 downto 0) := highFour;
	
	--Set constant values for switch bit
	constant swON: std_logic_vector(0 downto 0) := "1";
	constant swOFF: std_logic_vector(0 downto 0) := "0";
	
	--Constant LED Values for states
	constant ledsError: std_logic_vector(7 downto 0) := "10101010";
	constant ledsHighFour: std_logic_vector(7 downto 0) := "11110000";
	constant ledsLowFour: std_logic_vector(7 downto 0) := "00001111";
	
	--initial next state
	signal nextState: std_logic_vector(1 downto 0);
begin

process (clk50)

	begin
		
		if (rising_edge(clk50)) then
			case internalState is
				when OnEntry =>
					internalState <= CheckTransition;
				when Internal =>
					internalState <= CheckTransition;
				when OnExit =>
					currentState <= nextState;
					internalState <= OnEntry;
				when others =>
					null;
			end case;
			case currentState is
				when HighFour =>
					case internalState is
						when Internal =>
							leds <= ledsHighFour;
						when others =>
							null;
					end case;
				when LowFour =>
					case internalState is
						when Internal =>
							leds <= ledsLowFour;
						when others =>
							null;
					end case;
				when ExitState =>
					case internalState is
						when Internal =>
							leds <= ledsError;
						when others =>
							null;
					end case;
				when others =>
					currentState <= ExitState;
					internalState <= OnEntry;
			end case;
		end if;
		if (falling_edge(clk50)) then
			case currentState is
				when HighFour =>
					case internalState is
						when CheckTransition =>
							case sw is
								when swON =>
									nextState <= LowFour;
									internalState <= OnExit;
								when swOFF =>
									internalState <= Internal;
								when others =>
									null;
							end case;
						when others =>
							null;
					end case;
				when LowFour =>
					case internalState is
						when CheckTransition =>
							case sw is
								when swOFF =>
									nextState <= HighFour;
									internalState <= OnExit;
								when swON =>
									internalState <= Internal;
								when others =>
									null;
							end case;
						when others =>
							null;
					end case;
				when ExitState =>
					case internalState is
						when CheckTransition =>
							nextState <= HighFour;
							internalState <= OnExit;
						when others =>
							null;
					end case;
				when others =>
					currentState <= ExitState;
					internalState <= OnEntry;
			end case;
		end if;
							
	end process;

end Behavioral;

