----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:40:10 03/17/2018 
-- Design Name: 
-- Module Name:    LLFSM - Behavioral 
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

entity highFour is
	port(
		clk50: in std_logic;
		status: inout std_logic_vector(1 downto 0);
		currentState: inout std_logic_vector(1 downto 0);
		nextState: inout std_logic_vector(1 downto 0);
		leds: out std_logic_vector(7 downto 0);
		sw: in std_logic_vector(0 downto 0)
	);
end highFour;

architecture Behavioral of highFour is
--This State:
	constant this: std_logic_vector(1 downto 0) := "01";
--Set constant values for status bits
	constant onEntry: std_logic_vector(1 downto 0) := "00";
	constant checkTransition: std_logic_vector(1 downto 0) := "01";
	constant onExit: std_logic_vector(1 downto 0) := "10";
	constant internal: std_logic_vector(1 downto 0) := "11";
	
--LEDS Value for highFour
	constant ledsHighFour: std_logic_vector(7 downto 0) := "11110000";
	
--Set constant values for switch bit
	constant swON: std_logic_vector(0 downto 0) := "1";
	constant swOFF: std_logic_vector(0 downto 0) := "0";
	
--Transitionable states:
	constant lowFourState: std_logic_vector(1 downto 0) := "10";
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
				leds <= ledsHighFour;
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
				case sw is
					when swON =>
					--If dip switch is on then set target to lowFour LLFSM and transition to onExit substate
						nextState <= lowFourState;
						status <= onExit;
					when swOFF =>
					--if dip switch is off then transition to internal substate
						status <= internal;
					when others =>
					--Redundent Case
						null;
				end case;
			when others =>
				null;
		end case;
	when others =>
		null;
	end case;
end if;
end process;

end Behavioral;

