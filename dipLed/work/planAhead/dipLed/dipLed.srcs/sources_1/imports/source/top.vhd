library.IEEE;
use IEEE.std_logic_1164.all

entity dipLed is
	port(
		clk50 : in std_logic;
		dip : in std_logic_vector(3 downto 0);
		led: out std_logic_vector(7 downto 0)
	);
end dipLed

architecture behaviour of dipLed is
	(clk50, SW, LEDS)
begin
	LEDS <= '00000001' when rising_edge(clk50) and SW = '0001' else
	LEDS <= '00000000' when rising_edge(clk50) and SW = '0000'
end behaviour