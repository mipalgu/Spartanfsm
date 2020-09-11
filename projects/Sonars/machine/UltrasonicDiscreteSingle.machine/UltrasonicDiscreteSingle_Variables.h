//
// UltrasonicDiscreteSingle_Variables.h
//
// Automatically created through MiPalCASE -- do not change manually!
//
#extern	triggerPin: out std_logic;	///<
#extern	echo: inout std_logic;	///<
#extern	distance: out std_logic_vector(15 downto 0);	///<
#machine	constant SCHEDULE_LENGTH: unsigned(7 downto 0) := x"64";	///<
#machine	constant SPEED_OF_SOUND: unsigned(11 downto 0) := x"157";	///<
#machine	constant SONAR_OFFSET: unsigned(7 downto 0) := x"28";	///<
#machine	constant MAX_DISTANCE: unsigned(23 downto 0) := x"3D0900";	///<
#machine	constant MAX_TIME: unsigned(39 downto 0) := (MAX_DISTANCE * x"2") / SPEED_OF_SOUND *x"3E8";	///<
#machine	signal numloops: unsigned(39 downto 0);	///<
#machine	constant RINGLETS_PER_MS: unsigned(19 downto 0) := x"F4240" / SCHEDULE_LENGTH;	///<
#machine	signal i: unsigned(31 downto 0);	///<
#machine	constant RINGLETS_PER_S: unsigned(31 downto 0) :=  x"3E8" * RINGLETS_PER_MS;	///<
#machine	constant maxloops: unsigned(39 downto 0) := MAX_TIME / SCHEDULE_LENGTH;	///<
