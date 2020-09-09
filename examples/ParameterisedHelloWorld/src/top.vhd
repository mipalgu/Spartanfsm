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

	component ParameterisedHelloWorld is
		generic (
			  NGreen: Integer;
			  NRed: Integer
		 );
		port (
			  clk: in std_logic;
			  restart: in std_logic;
			  resume: in std_logic;
			  suspend: in std_logic;
			  suspended: out std_logic;
			  EXTERNAL_LEDG: out std_logic_vector(NGREEN - 1 downto 0);
			  EXTERNAL_LEDR: out std_logic_vector(NRED - 1 downto 0)
		 );
	end component;

begin
	param_gen: ParameterisedHelloWorld generic map(
		NGreen => 9,
		NRed => 18
	)
	port map(
		clk => CLOCK_50,
		restart => '1',
		resume => '0',
		suspend => '0',
		suspended => suspended,
		EXTERNAL_LEDG => LEDG,
		EXTERNAL_LEDR => LEDR
	);

end Behavioral;