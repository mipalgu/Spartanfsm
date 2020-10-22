//
// SonarPlatform_Variables.h
//
// Automatically created through MiPalCASE -- do not change manually!
//
#extern	distance: out std_logic_vector(15 downto 0);	///<
#param	numberOfSensors: positive;	///<
#extern	triggers: out std_logic_vector(numberOfSensors - 1 downto 0);	///<
#extern	echos: in std_logic_vector(numberOfSensors - 1 downto 0);	///<
#machine	signal smallestDistance: std_logic_vector(15 downto 0);	///<
#machine	constant allHigh: std_logic_vector(numberOfSensors - 1 downto 0) := (others => '1');	///<
#machine	signal sensorsSuspended: std_logic_vector(numberOfSensors - 1 downto 0);	///<
#machine	signal sensorFusionSuspended: std_logic;	///<
#machine	signal allOutputs: std_logic_vector(numberOfSensors * 16 - 1 downto 0);	///<
#machine	signal sensorCommand: std_logic_vector(1 downto 0) := COMMAND_NULL;	///<
#machine	signal sensorFusionCommand: std_logic_vector(1 downto 0) := COMMAND_NULL;	///<
#machine	constant allLow: std_logic_vector(numberOfSensors - 1 downto 0) := (others => '0');	///<
