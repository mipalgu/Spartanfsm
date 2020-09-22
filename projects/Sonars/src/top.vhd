library IEEE;
use IEEE.std_logic_1164.All;

entity top is
    port (
        CLOCK_50: in std_logic;
        CLOCK2_50: in std_logic;
        CLOCK3_50: in std_logic;
        GPIO: inout std_logic_vector(35 downto 0);
        --HEX0: out std_logic_vector(6 downto 0);
        HEX1: out std_logic_vector(6 downto 0);
        HEX2: out std_logic_vector(6 downto 0);
        HEX3: out std_logic_vector(6 downto 0);
        HEX4: out std_logic_vector(6 downto 0);
        HEX5: out std_logic_vector(6 downto 0)
        --HEX6: out std_logic_vector(6 downto 0);
        --HEX7: out std_logic_vector(6 downto 0)
    );
end top;

architecture Behavioural of top is
	signal distance: std_logic_vector(15 downto 0);
	signal platformCommand : std_logic_vector(1 downto 0) := "00";
	signal platformSuspended: std_logic;
    signal digits: std_logic_vector(34 downto 0);
	
	component SonarPlatform is
		generic (
			numberOfSensors: positive
		);
		port (
			clk: in std_logic;
			command: in std_logic_vector(1 downto 0);
			suspended: out std_logic;
			EXTERNAL_distance: out std_logic_vector(15 downto 0);
			EXTERNAL_triggers: out std_logic_vector(numberOfSensors - 1 downto 0);
			EXTERNAL_echos: inout std_logic_vector(numberOfSensors - 1 downto 0)
		);
	end component;
    
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

	sonars: SonarPlatform generic map (
		numberOfSensors => 1
	)
	port map (
		clk => CLOCK_50,
		command => platformCommand,
		suspended => platformSuspended,
		EXTERNAL_distance => distance,
		EXTERNAL_triggers => GPIO(0 downto 0),
		EXTERNAL_echos => GPIO(1 downto 1)
	);
    
    display: SevenSegDisplay generic map (
        N => 16,
        digits => 5
    )
    port map (
        clk => CLOCK_50,
        command => "00",
        EXTERNAL_number => distance,
        EXTERNAL_sevSegDigits => digits
    );
    
    HEX1 <= digits(6 downto 0);
    HEX2 <= digits(13 downto 7);
    HEX3 <= digits(20 downto 14);
    HEX4 <= digits(27 downto 21);
    HEX5 <= digits(34 downto 28);
	
end Behavioural;