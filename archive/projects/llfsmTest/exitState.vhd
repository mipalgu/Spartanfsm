----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:05:50 03/17/2018 
-- Design Name: 
-- Module Name:    exitState - Behavioral 
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

entity exitState is
	port(
		clk50: in std_logic;
		status: inout std_logic_vector(1 downto 0);
		currentState: inout std_logic_vector(1 downto 0);
		nextState: inout std_logic_vector(1 downto 0);
		leds: out std_logic_vector(7 downto 0)
	);
end exitState;

architecture Behavioral of exitState is
--This state:
	constant this: std_logic_vector(1 downto 0) := "11";
--Set constant values for status bits
	constant onEntry: std_logic_vector(1 downto 0) := "00";
	constant checkTransition: std_logic_vector(1 downto 0) := "01";
	constant onExit: std_logic_vector(1 downto 0) := "10";
	constant internal: std_logic_vector(1 downto 0) := "11";
	
	constant highFourState: std_logic_vector(1 downto 0) := "01";
	
	constant ledsError: std_logic_vector(7 downto 0) := "10101010";
begin

process(clk50)
begin
if (rising_edge(clk50)) then
	case currentState is
	when this =>
		case status is
			when onEntry =>
				status <= checkTransition;
			when internal =>
				leds <= ledsError;
				status <= checkTransition;
			when onExit =>
				currentState <= nextState;
				status <= onEntry;
			when others =>
				null;
		end case;
	when others =>
		null;
	end case;
end if;
if (falling_edge(clk50)) then
	case currentState is
	when this =>
		case status is
			when checkTransition =>
				nextState <= highFourState;
				status <= onExit;
			when others =>
				null;
		end case;
	when others =>
		null;
	end case;
end if;
end process;

end Behavioral;

