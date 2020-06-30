----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    03:58:39 06/30/2020 
-- Design Name: 
-- Module Name:    Send5 - Behavioral 
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

entity Send5 is
	port (
		slaveClk: in std_logic;
		dataLine: out std_logic;
		cs: out std_logic
	);
end Send5;

architecture Behavioral of Send5 is
	signal address: std_logic_vector(7 downto 0);
	signal enable: std_logic := '0';
	signal busy: std_logic;
	signal data: std_logic_vector(7 downto 0);
	signal state: std_logic_vector(3 downto 0) := "0000";

	component SevenSegTransmitter is
		port (
			slaveClk: in std_logic;
			data: in std_logic_vector(7 downto 0);
			address: in std_logic_vector(7 downto 0);
			enable: inout std_logic;
			dataLine: out std_logic;
			cs: out std_logic;
			busy: out std_logic
		);
	end component;

begin

	sevSeg: SevenSegTransmitter port map (
		slaveClk => slaveClk,
		data => data,
		address => address,
		enable => enable,
		dataLine => dataLine,
		cs => cs,
		busy => busy
	);

process (slaveClk)
begin
	if (rising_edge(slaveClk)) then
		if (busy = '0') then
			case state is
				when "0000" =>
					address <= x"0C"; -- No shutdown
					data <= x"01";
					enable <= '1';
					state <= "0001";
				when "0001" =>
					address <= x"09"; -- No BCD
					data <= x"00";
					enable <= '1';
					state <= "0010";
				when "0010" =>
					address <= x"0A"; -- Intensity
					data <= x"0C";
					enable <= '1';
					state <= "0011";
				when "0011" =>
					address <= x"0B"; -- Digits to display
					data <= x"07";
					enable <= '1';
					state <= "0100";
				when "0100" =>
					address <= x"0F"; -- No Display Test
					data <= x"00";
					enable <= '1';
					state <= "0101";
				when "0101" =>
					address <= x"01"; -- Digit 0
					data <= x"05";
					enable <= '1';
					state <= "0110";
				when "0110" =>
					address <= x"02"; -- Digit 1
					data <= x"05";
					enable <= '1';
					state <= "0111";
				when "0111" => 
					address <= x"03"; -- Digit 2
					data <= x"05";
					enable <= '1';
					state <= "1000";
				when "1000" =>
					address <= x"04"; -- Digit 3
					data <= x"05";
					enable <= '1';
					state <= "1001";
				when "1001" =>
					address <= x"05"; -- Digit 4
					data <= x"05";
					enable <= '1';
					state <= "1010";
				when "1010" =>
					address <= x"06"; -- Digit 5
					data <= x"05";
					enable <= '1';
					state <= "1011";
				when "1011" =>
					address <= x"07"; -- Digit 6
					data <= x"05";
					enable <= '1';
					state <= "1100";
				when "1100" =>
					address <= x"08"; -- Digit 7
					data <= x"05";
					enable <= '1';
					state <= "1101";
				when "1101" =>
					enable <= '0';
					state <= "1110";
				when others =>
					null;
			end case;
		end if;
	end if;
	
	
end process;

end Behavioral;

