library IEEE;
use IEEE.std_logic_1164.All;

entity top is
    port (
        CLOCK_50: in std_logic;
        CLOCK2_50: in std_logic;
        CLOCK3_50: in std_logic;
        triggers: out std_logic_vector(0 downto 0);
        echos: in std_logic_vector(0 downto 0);
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
	signal distance: std_logic_vector(15 downto 0) := x"3039";
    signal displayDistance: std_logic_vector(15 downto 0);
    signal allDigits: std_logic_vector(34 downto 0);
    constant COMMAND_NULL: std_logic_vector(1 downto 0) := "00";
    constant COMMAND_RESTART: std_logic_vector(1 downto 0) := "01";
    constant COMMAND_SUSPEND: std_logic_vector(1 downto 0) := "10";
    constant COMMAND_RESUME: std_logic_vector(1 downto 0) := "11";
    signal displaySuspended: std_logic;
    signal displayCommand: std_logic_vector(1 downto 0) := COMMAND_SUSPEND;
	
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
			EXTERNAL_echos: in std_logic_vector(numberOfSensors - 1 downto 0)
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
        command => "00",
		EXTERNAL_distance => distance,
		EXTERNAL_triggers => triggers,
		EXTERNAL_echos => echos
	);
    
    display: SevenSegDisplay generic map (
        N => 16,
        digits => 5
    )
    port map (
        clk => CLOCK_50,
        command => displayCommand,
        suspended => displaySuspended,
        EXTERNAL_number => displayDistance,
        EXTERNAL_sevSegDigits => allDigits
    );
    
    HEX1 <= allDigits(6 downto 0);
    HEX2 <= allDigits(13 downto 7);
    HEX3 <= allDigits(20 downto 14);
    HEX4 <= allDigits(27 downto 21);
    HEX5 <= allDigits(34 downto 28);
    
    displayDistance <= distance after 500 ms;
   
process (CLOCK_50)
begin
    if displaySuspended = '1' then
        displayCommand <= COMMAND_RESTART;
    elsif displaySuspended = '0' and displayCommand = COMMAND_RESTART then
        displayCommand <= COMMAND_NULL;
    end if;
end process;
	
end Behavioural;