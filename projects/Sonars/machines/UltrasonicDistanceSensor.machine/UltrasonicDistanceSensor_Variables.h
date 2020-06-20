//
// UltrasonicDistanceSensor_Variables.h
//
// Automatically created through MiPalCASE -- do not change manually!
//
#extern	echo: in std_logic;	///<
#extern	trigger: out std_logic;	///<
#extern	distance: out unsigned(8 downto 0);	///<
#machine	signal i: unsigned(23 downto 0);	///<
#machine	constant SPEED_OF_SOUND: unsigned(15 downto 0) := x"84D0";	///<
#machine	constant DOUBLE_FREQ: unsigned(27 downto 0) := x"5F5E100";	///<
#extern	resetEcho: out std_logic;	///<
#machine	constant TIMEOUT: unsigned(23 downto 0) := x"59C284";	///<
