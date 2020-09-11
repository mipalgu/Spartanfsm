//
// SonarPlatform_Variables.h
//
// Automatically created through MiPalCASE -- do not change manually!
//
#extern	distance: out std_logic_vector(15 downto 0);	///<
#param	numberOfSensors: positive;	///<
#extern	triggers: out std_logic_vector(numberOfSensors - 1 downto 0);	///<
#extern	echos: inout std_logic_vector(numberOfSensors - 1 downto 0);	///<
#machine	signal smallestDistance: std_logic_vector(15 downto 0);	///<
#machine	signal sensorRestart: std_logic;	///<
#machine	signal sensorsSuspended: std_logic_vector(numberOfSensors - 1 downto 0);	///<
#machine	constant allSuspended: std_logic_vector(numberOfSensors - 1 downto 0) := (others => '1');	///<
#machine	signal sensorFusionRestart: std_logic;	///<
#machine	signal sensorFusionSuspend: std_logic;	///<
#machine	signal sensorSuspend: std_logic;	///<
#machine	signal sensorFusionSuspended: std_logic;	///<
