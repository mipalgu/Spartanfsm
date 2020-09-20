library IEEE;
use IEEE.std_logic_1164.all;

entity top is
	port (
		CLOCK_50: in std_logic;
		LEDG: out std_logic_vector(8 downto 0);
		LEDR: out std_logic_vector(17 downto 0)
	);
end top;

architecture Behavioral of top is
	signal suspended: std_logic;
	signal ledValue: std_logic;
	
	component HelloWorld is
		port (
			  clk: in std_logic;
			  command: in std_logic_vector(1 downto 0);
			  suspended: out std_logic;
			  EXTERNAL_LED: out std_logic
		 );
	end component;

begin
	
	LEDG <= (others => ledValue);
	LEDR <= (others => ledValue);

	helloWorld_gen: HelloWorld port map (
		clk => CLOCK_50,
		command => "00",
		suspended => suspended,
		EXTERNAL_LED => ledValue
	);
	
end Behavioral;