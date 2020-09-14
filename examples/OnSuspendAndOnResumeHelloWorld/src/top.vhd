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
	signal childCommand: std_logic_vector(1 downto 0);
	signal childLed: std_logic;
	
	component OnsuspendAndOnResumeHelloWorld is
		port (
			  clk: in std_logic;
			  command: in std_logic_vector(1 downto 0);
			  suspended: out std_logic;
			  EXTERNAL_commandMe: out std_logic_vector(1 downto 0);
			  EXTERNAL_LED: out std_logic
		 );
	end component;

begin
	
	hello_world_gen: OnSuspendAndOnResumeHelloWorld port map (
        clk => CLOCK_50,
        command => childCommand,
        EXTERNAL_commandMe => childCommand,
        EXTERNAL_LED => childLed
	);
	
	LEDG <= (others => childLed);
	LEDR <= (others => childLed);
	
end Behavioral;