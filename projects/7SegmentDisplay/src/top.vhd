library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

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
		HEX7: out std_logic_vector(6 downto 0);
		Key: in std_logic_vector(3 downto 0)
	);
end top;

architecture Behavioural of top is

	signal encodedNumber: std_logic_vector(6 downto 0);
	signal count: std_logic_vector(3 downto 0);
	
	component SevenSegDigit is
    port (
        clk: in std_logic;
        EXTERNAL_count: in std_logic_vector(3 downto 0);
        EXTERNAL_output: out std_logic_vector(6 downto 0)
    );
	end component;
	
	component DigitFlipper is
    port (
        clk: in std_logic;
        EXTERNAL_count: out std_logic_vector(3 downto 0);
        EXTERNAL_increaseButton: in std_logic;
        EXTERNAL_decreaseButton: in std_logic
    );
	end component;

begin

	dig: SevenSegDigit port map (
		clk => CLOCK_50,
		EXTERNAL_count => count,
		EXTERNAL_output => encodedNumber
	);
	
	flip: DigitFlipper port map (
      clk => CLOCK_50,
        EXTERNAL_count => count,
        EXTERNAL_increaseButton => Key(2),
        EXTERNAL_decreaseButton => Key(3)
    );
	
	Hex0 <= encodedNumber;
	Hex1 <= encodedNumber;
	Hex2 <= encodedNumber;
	Hex3 <= encodedNumber;
	Hex4 <= encodedNumber;
	Hex5 <= encodedNumber;
	Hex6 <= encodedNumber;
	Hex7 <= encodedNumber;

end architecture;