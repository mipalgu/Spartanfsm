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
	signal displayOutput: std_logic_vector(55 downto 0);
	signal number: std_logic_vector(23 downto 0) := x"BC614E"; -- The number is 12345678
	signal displaySuspended: std_logic;
    constant COMMAND_NULL: std_logic_vector(1 downto 0) := "00";
    constant COMMAND_RESTART: std_logic_vector(1 downto 0) := "01";
    constant COMMAND_SUSPEND: std_logic_vector(1 downto 0) := "10";
    constant COMMAND_RESUME: std_logic_vector(1 downto 0) := "11";
    signal displayCommand: std_logic_vector(1 downto 0) := COMMAND_NULL;
	
	
	component SevenSegDisplay is
		generic (
            N: positive;
            digits: positive
        );
        port (
            clk: in std_logic;
            command: in std_logic_vector(1 downto 0);
            suspended: out std_logic;
            EXTERNAL_number: in std_logic_vector(N - 1 downto 0);
            EXTERNAL_sevSegDigits: out std_logic_vector(7 * digits - 1 downto 0)
        );
	end component;

begin

	disp: SevenSegDisplay generic map (
		N => 24,
		digits => 8
	)
	port map (
		clk => CLOCK_50,
		command => displayCommand,
		suspended => displaySuspended,
		EXTERNAL_number => number,
		EXTERNAL_sevSegDigits => displayOutput
	);

	HEX0 <= displayOutput(6 downto 0);
	HEX1 <= displayOutput(13 downto 7);
	HEX2 <= displayOutput(20 downto 14);
	HEX3 <= displayOutput(27 downto 21);
	HEX4 <= displayOutput(34 downto 28);
	HEX5 <= displayOutput(41 downto 35);
	HEX6 <= displayOutput(48 downto 42);
	HEX7 <= displayOutput(55 downto 49);

process (CLOCK_50)
begin
	if (rising_edge(CLOCK_50)) then
		if (displaySuspended = '1') then
			displayCommand <= COMMAND_RESTART;
		else
			displayCommand <= COMMAND_NULL;
		end if;
	end if;
end process;

end Behavioral;