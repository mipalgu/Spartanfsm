----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    03:31:46 06/30/2020 
-- Design Name: 
-- Module Name:    SevenSegTransmitter - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity SevenSegTransmitter is
	port (
		slaveClk: in std_logic;
		data: in std_logic_vector(7 downto 0);
		address: in std_logic_vector(7 downto 0);
		enable: in std_logic;
		dataLine: out std_logic;
		cs: out std_logic;
		busy: out std_logic
	);
end SevenSegTransmitter;

architecture Behavioral of SevenSegTransmitter is
	signal bitsShifted: unsigned(2 downto 0);
	signal previousEnable: std_logic;
	signal txData: std_logic_vector(15 downto 0);
begin

process(slaveClk)
	begin
		if rising_edge(slaveClk) then
			if enable = '0' then
				previousEnable <= '0';
			elsif previousEnable = '0' and enable = '1' then
				previousEnable <= '1';
				bitsShifted <= "000";
				txData <= address & data;
			elsif enable = '1' then
				previousEnable <= '1';
				if (bitsShifted = 15) then
					cs <= '1';
				elsif (bitsShifted = 16) then
					busy <= '0';
					bitsShifted <= (others => '0');
				else
					cs <= '0';
					busy <= '1';
					dataLine <= txData(15);
					txData <= txData(14 downto 0) & "0";
					bitsShifted <= bitsShifted + 1;
				end if;
			end if;
		end if;
	end process;
end Behavioral;

