library IEEE;
use IEEE.std_logic_1164.All;

entity top is
    port (
        CLOCK_50: in std_logic;
        GPIO: inout std_logic_vector(35 downto 0)
    );
end top;

architecture Behavioural of top is
	signal distance: std_logic_vector(15 downto 0);

	component UltrasonicDiscreteSingle is
		port (
			clk: in std_logic;
			EXTERNAL_triggerPin: out std_logic;
			EXTERNAL_echoPin: inout std_logic;
			EXTERNAL_distance: out std_logic_vector(15 downto 0)
		);
	end component;
	
begin

	s1: UltrasonicDiscreteSingle port map (
		clk => CLOCK_50,
		EXTERNAL_triggerPin => GPIO(0),
		EXTERNAL_echoPin => GPIO(1),
		EXTERNAL_distance => distance
	);
	
end Behavioural;