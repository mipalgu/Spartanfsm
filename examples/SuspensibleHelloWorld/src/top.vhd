library IEEE;
use IEEE.std_logic_1164.all;

entity top is
	port(
		CLOCK_50: in std_logic;
		LEDG: out std_logic_vector(8 downto 0);
		LEDR: out std_logic_vector(17 downto 0)
	);
end top;

architecture Behavioral of top is
	signal suspended: std_logic;
	signal ledValue: std_logic;

	component ParentMachine is
		port (
			clk: in std_logic;
			command: in std_logic_vector(1 downto 0);
			suspended: out std_logic;
			EXTERNAL_LED: out std_logic
		);
	end component;

begin

	parentMachine_gen: ParentMachine port map (
		clk => CLOCK_50,
		command => "11",
		suspended => suspended,
		EXTERNAL_LED => ledValue
	);
	
	LEDG <= (others => ledValue);
	LEDR <= (others => ledValue);

end Behavioral;