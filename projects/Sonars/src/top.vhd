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
		  HEX7: out std_logic_vector(6 downto 0)
    );
end top;

architecture Behavioural of top is
	signal distance: std_logic_vector(15 downto 0);
	signal platformRestart: std_logic;
	signal platformSuspended: std_logic;
	
	component SonarPlatform is
		generic (
			numberOfSensors: positive
		);
		port (
			clk: in std_logic;
			restart: in std_logic;
			resume: in std_logic;
			suspend: in std_logic;
			suspended: out std_logic;
			EXTERNAL_distance: out std_logic_vector(15 downto 0);
			EXTERNAL_triggers: out std_logic_vector(numberOfSensors - 1 downto 0);
			EXTERNAL_echos: inout std_logic_vector(numberOfSensors - 1 downto 0)
		);
	end component;
	
begin

	sonars: SonarPlatform generic map (
		numberOfSensors => 1
	)
	port map (
		clk => CLOCK_50,
		restart => platformRestart,
		resume => '0',
		suspend => '0',
		suspended => platformSuspended,
		EXTERNAL_distance => distance,
		EXTERNAL_triggers => GPIO(0 downto 0),
		EXTERNAL_echos => GPIO(1 downto 1)
	);
	
end Behavioural;