library IEEE;
use IEEE.std_logic_1164.All;

library altera; 
use altera.altera_primitives_components.all; 

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
		  HEX7: out std_logic_vector(6 downto 0);
		  LEDG: out std_logic_vector(8 downto 0);
		  LEDR: out std_logic_vector(17 downto 0)
    );
end top;

architecture Behavioural of top is
	signal distance: std_logic_vector(15 downto 0);
	signal reset: std_logic := '1';
	signal enable: std_logic := '0';
	signal busy: std_logic;
	signal bcd: std_logic_vector(19 downto 0);
	signal encodedDistance: std_logic_vector(19 downto 0);
	signal echoIn: std_logic;
	signal echoOut: std_logic;
	signal sendEcho: std_logic;
	signal triggerLatched: std_logic;

	component UltrasonicDiscreteSingle is
		port (
			clk: in std_logic;
			EXTERNAL_triggerPin: out std_logic;
			EXTERNAL_echoIn: in std_logic;
			EXTERNAL_distance: out std_logic_vector(15 downto 0);
			EXTERNAL_LEDG: out std_logic_vector(8 downto 0);
         EXTERNAL_LEDR: out std_logic_vector(17 downto 0);
			EXTERNAL_echoOut: out std_logic;
         EXTERNAL_sendEcho: out std_logic
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
	
	component ALT_IOBUF is
		generic (
			IO_STANDARD: string;
			CURRENT_STRENGTH_NEW: String;
			ENABLE_BUS_HOLD: STRING;
			WEAK_PULL_UP_RESISTOR: STRING;
			LOCATION: STRING
		);
		port (
			i: in std_logic;
			oe: in std_logic;
			io: inout std_logic;
			o: out std_logic
		);
	end component;
	
	component ALT_OUTBUF is
		generic (
			IO_STANDARD: string;
			LOCATION: string;
			CURRENT_STRENGTH: string;
			ENABLE_BUS_HOLD: string;
			WEAK_PULL_UP_RESISTOR: string
		);
		port (
			i: in std_logic;
			o: out std_logic
		);
	end component;
	
begin

--	echo_buf: ALT_IOBUF generic map (
--		IO_STANDARD => "3.3-V LVTTL",
--		CURRENT_STRENGTH_NEW => "8mA",
--		ENABLE_BUS_HOLD => "none",
--		WEAK_PULL_UP_RESISTOR => "off",
--		LOCATION => "IOBANK_4"
--	) 
--	port map (
--		i => echoOut, 
--		oe => sendEcho, 
--		o => echoIn, 
--		io => GPIO(1)
--	);


	trigger_buf: ALT_OUTBUF generic map (
		IO_STANDARD => "3.3-V LVTTL",
		LOCATION => "IOBANK_4",
		CURRENT_STRENGTH => "8mA",
		ENABLE_BUS_HOLD => "off",
		WEAK_PULL_UP_RESISTOR => "off"
	)
	port map (
		i => triggerLatched,
		o => GPIO(0)
	);


	s1: UltrasonicDiscreteSingle port map (
		clk => CLOCK_50,
		EXTERNAL_triggerPin => triggerLatched,
		EXTERNAL_echoIn => GPIO(1),
		EXTERNAL_distance => distance,
		EXTERNAL_LEDG => LEDG,
		EXTERNAL_LEDR => LEDR,
		EXTERNAL_echoOut => GPIO(1),
      EXTERNAL_sendEcho => sendEcho
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