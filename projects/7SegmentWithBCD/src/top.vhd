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

architecture Behavioural of top is
	signal bcd: std_logic_vector(19 downto 0);
	signal enable: std_logic := '1';
	signal busy: std_logic;
	signal converted: std_logic := '0';
	signal reset: std_logic := '1';
	
	component SingleDigitBCDEncoderWithShifting is
         port (
             clk: in std_logic;
             EXTERNAL_binary: in std_logic;
				 EXTERNAL_enable: in std_logic;
				 EXTERNAL_busy: out std_logic;
				 EXTERNAL_bcd: out std_logic_vector(3 downto 0);
				 EXTERNAL_reset: in std_logic;
				 EXTERNAL_carry: out std_logic
         );
	 end component;
	
--	component SixteenBitBinaryToBCDEncoder is
--		port (
--        clk: in std_logic;
--        EXTERNAL_data: in std_logic_vector(15 downto 0);
--        EXTERNAL_busy: out std_logic;
--        EXTERNAL_bcd: out std_logic_vector(19 downto 0)
--    );
--	end component;

	component binary_to_bcd is
		generic (
			bits: Integer;
			digits: Integer
		);
		port (
			clk		:	IN		STD_LOGIC;											--system clock
			reset_n	:	IN		STD_LOGIC;											--active low asynchronus reset
			ena		:	IN		STD_LOGIC;											--latches in new binary number and starts conversion
			binary	:	IN		STD_LOGIC_VECTOR(bits-1 DOWNTO 0);			--binary number to convert
			busy		:	OUT	STD_LOGIC;											--indicates conversion in progress
			bcd		:	OUT	STD_LOGIC_VECTOR(digits*4-1 DOWNTO 0)	--resulting BCD number
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

	bcdEncoder: binary_to_bcd generic map (
		bits => 16,
		digits => 5
	) port map (
         clk => CLOCK_50,
			reset_n => reset,
			ena => enable,
			binary => x"3039",
			busy => busy,
			bcd => bcd
     );
	  
	digit0: SevenSegDigit port map (
		clk => CLOCK_50,
		EXTERNAL_count => bcd(3 downto 0),
		EXTERNAL_output => HEX1
	);
	
	digit1: SevenSegDigit port map (
		clk => CLOCK_50,
		EXTERNAL_count => bcd(7 downto 4),
		EXTERNAL_output => HEX2
	);
	
	digit2: SevenSegDigit port map (
		clk => CLOCK_50,
		EXTERNAL_count => bcd(11 downto 8),
		EXTERNAL_output => HEX3
	);
	
	digit3: SevenSegDigit port map (
		clk => CLOCK_50,
		EXTERNAL_count => bcd(15 downto 12),
		EXTERNAL_output => HEX4
	);
	
	digit4: SevenSegDigit port map (
		clk => CLOCK_50,
		EXTERNAL_count => bcd(19 downto 16),
		EXTERNAL_output => HEX5
	);
	
	HEX0 <= (others => '1');
	HEX6 <= (others => '1');
	HEX7 <= (others => '1');

process (CLOCK_50)
begin
	if rising_edge(CLOCK_50) then
		if (not converted) = '1' then
			if busy = '0' then
				reset <= '0';
				enable <= '1';
			else
				reset <= '1';
				enable <= '0';
				converted <= '1';
			end if;
		end if;
	end if;
end process;
	
end Behavioural;