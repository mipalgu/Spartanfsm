library IEEE;
use IEEE.std_logic_1164.All;

entity top is
    port (
        CLOCK_50: in std_logic;
		  CLOCK2_50: in std_logic;
		  CLOCK3_50: in std_logic;
        GPIO: inout std_logic_vector(35 downto 0);
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

architecture Behavioural of top is
	signal distance: std_logic_vector(15 downto 0);
	signal reset: std_logic := '1';
	signal enable: std_logic := '0';
	signal busy: std_logic;
	signal bcd: std_logic_vector(19 downto 0);
	signal encodedDistance: std_logic_vector(19 downto 0);

	component UltrasonicDiscreteSingle is
		port (
			clk: in std_logic;
			EXTERNAL_triggerPin: out std_logic;
			EXTERNAL_echoPin: inout std_logic;
			EXTERNAL_distance: out std_logic_vector(15 downto 0)
		);
	end component;
	
	component SevenSegDigit is
		 port (
			  clk: in std_logic;
			  EXTERNAL_count: in std_logic_vector(3 downto 0);
			  EXTERNAL_output: out std_logic_vector(6 downto 0)
		 );
	end component;
	
	component binary_to_bcd IS
		GENERIC(
			bits		:	INTEGER;		--size of the binary input numbers in bits
			digits	:	INTEGER);		--number of BCD digits to convert to
		PORT(
			clk		:	IN		STD_LOGIC;											--system clock
			reset_n	:	IN		STD_LOGIC;											--active low asynchronus reset
			ena		:	IN		STD_LOGIC;											--latches in new binary number and starts conversion
			binary	:	IN		STD_LOGIC_VECTOR(bits-1 DOWNTO 0);			--binary number to convert
			busy		:	OUT	STD_LOGIC;											--indicates conversion in progress
			bcd		:	OUT	STD_LOGIC_VECTOR(digits*4-1 DOWNTO 0));	--resulting BCD number
	END component;
	
begin

	s1: UltrasonicDiscreteSingle port map (
		clk => CLOCK_50,
		EXTERNAL_triggerPin => GPIO(0),
		EXTERNAL_echoPin => GPIO(1),
		EXTERNAL_distance => distance
	);
	
	bcd_encoder: binary_to_bcd generic map (
		bits => 16,
		digits => 5
	) port map (
		clk => CLOCK2_50,
		reset_n => reset,
		ena => enable,
		binary => distance,
		busy => busy,
		bcd => encodedDistance
	);
	
	digit0: SevenSegDigit port map (
		clk => CLOCK3_50,
		EXTERNAL_count => bcd(3 downto 0),
		EXTERNAL_output => Hex1
	);
	
	digit1: SevenSegDigit port map (
		clk => CLOCK3_50,
		EXTERNAL_count => bcd(7 downto 4),
		EXTERNAL_output => Hex2
	);
	
	digit2: SevenSegDigit port map (
		clk => CLOCK3_50,
		EXTERNAL_count => bcd(11 downto 8),
		EXTERNAL_output => Hex3
	);
	
	digit3: SevenSegDigit port map (
		clk => CLOCK3_50,
		EXTERNAL_count => bcd(15 downto 12),
		EXTERNAL_output => Hex4
	);
	
	digit4: SevenSegDigit port map (
		clk => CLOCK3_50,
		EXTERNAL_count => bcd(19 downto 16),
		EXTERNAL_output => Hex5
	);
	
	HEX0 <= (others => '1');
	HEX6 <= (others => '1');
	HEX7 <= (others => '1');

process (CLOCK2_50)
begin

if rising_edge(CLOCK2_50) then
	if busy = '0' then
		bcd <= encodedDistance;
		enable <= '1';
	else
		enable <= '0';
	end if;
end if;

end process;
	
end Behavioural;