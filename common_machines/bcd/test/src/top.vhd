library IEEE;
use IEEE.std_logic_1164.all;

entity top is
	port (
		CLOCK_50: in std_logic;
		HEX0: out std_logic_vector(6 downto 0);
		HEX1: out std_logic_vector(6 downto 0);
		HEX2: out std_logic_vector(6 downto 0);
		HEX3: out std_logic_vector(6 downto 0);
		HEX4: out std_logic_vector(6 downto 0);
		HEX5: out std_logic_vector(6 downto 0);
		HEX6: out std_logic_vector(6 downto 0);
		HEX7: out std_logic_vector(6 downto 0)
	);
end top;

architecture Behavioral of top is
	
	signal number: std_logic_vector(7 downto 0) := x"7B";
	signal bcdOut: std_logic_vector(11 downto 0);
	signal suspended: std_logic;
	signal restart: std_logic := '1';
	
	component bcd is
		generic (
			N: Integer;
			digits: Integer
		);
		port (
			clk: in std_logic;
			restart: in std_logic;
			resume: in std_logic;
			suspend: in std_logic;
			suspended: out std_logic;
			EXTERNAL_binary: in std_logic_vector(N - 1 downto 0);
			EXTERNAL_bcd: out std_logic_vector(digits * 4 - 1 downto 0)
		);
	end component;
	
	component SevenSegDigit is
		port (
			clk: in std_logic;
			EXTERNAL_count: in std_logic_vector(3 downto 0);
			EXTERNAL_output: out std_logic_vector(6 downto 0)
		);
end component;

begin
	
	bcd_gen: bcd generic map(
		N => 8,
		digits => 3
	)
	port map (
		clk => CLOCK_50,
		restart => restart,
		resume => '0',
		suspend => '0',
		suspended => suspended,
		EXTERNAL_binary => number,
		EXTERNAL_bcd => bcdOut
	);
	
	digit0: SevenSegDigit port map (
		clk => CLOCK_50,
		EXTERNAL_count=> bcdOut(3 downto 0),
		EXTERNAL_output=> HEX0
	);
	
	digit1: SevenSegDigit port map (
		clk => CLOCK_50,
		EXTERNAL_count=> bcdOut(7 downto 4),
		EXTERNAL_output=> HEX1
	);
	
	digit2: SevenSegDigit port map (
		clk => CLOCK_50,
		EXTERNAL_count=> bcdOut(11 downto 8),
		EXTERNAL_output=> HEX2
	);

process(CLOCK_50)
begin
	if (rising_edge(CLOCK_50)) then
		if (suspended = '1') then
			restart <= '0';
		else
			restart <= '1';
		end if;
	end if;
end process;

end Behavioral;