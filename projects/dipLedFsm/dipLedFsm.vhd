----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:37:46 03/14/2018 
-- Design Name: 
-- Module Name:    dipLedFsm - Behavioral 
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

entity dipLedFsm is
	port(
		sw: in std_logic_vector(0 downto 0); --dip switch
		clk50: in std_logic;
		leds: inout std_logic_vector(7 downto 0)
	);
end dipLedFsm;

architecture Behavioral of dipLedFsm is
signal currentState: std_logic;
constant swON: std_logic_vector := "1";
constant swOFF: std_logic_vector := "0";
constant lightsON: std_logic := '1';
constant lightsOFF: std_logic := '0';
begin

process (clk50)
	begin
		if (rising_edge(clk50)) then
			case sw is
				when swOFF =>
					currentState <= lightsOFF;
				when swON =>
					currentState <= lightsON;
				when others =>
					currentState <= 'Z';
			end case;
		end if;
		if (falling_edge(clk50)) then
			case currentState is
				when lightsOFF =>
					leds <= "00000000";
				when lightsON =>
					leds <= "11111111";
				when others =>
					leds <= "10101010";
			end case;
		end if;
	end process;

end Behavioral;

