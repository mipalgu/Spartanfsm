----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:46:05 03/13/2018 
-- Design Name: 
-- Module Name:    dipLED - Behavioral 
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

entity dipLED is
	port(
		clk50 : in std_logic;
		sw : in std_logic_vector(3 downto 0);
		leds: inout std_logic_vector(7 downto 0)
	);
end dipLED;

architecture Behavioral of dipLED is
begin
process(clk50)
	begin
		if rising_edge(clk50) then
			if sw = "0001" then
				if leds = "00000000" then
					leds <= "11111111";
				end if;
			else
				if leds /= "00000000" then
					leds <= "00000000";
				end if;
			end if;
		end if;
	end process;
end Behavioral;

