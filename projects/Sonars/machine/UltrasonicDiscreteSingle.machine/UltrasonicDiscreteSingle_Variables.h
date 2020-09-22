//
// UltrasonicDiscreteSingle_Variables.h
//
// Automatically created through MiPalCASE -- do not change manually!
//
#extern	triggerPin: out std_logic;	///<
#extern	echo: in std_logic;	///<
#extern	distance: out std_logic_vector(15 downto 0);	///<
#machine	constant SCHEDULE_LENGTH: natural := 100;	///<
#machine	constant SPEED_OF_SOUND: natural := 343;	///<
#machine	constant SONAR_OFFSET: natural := 40;	///<
#machine	constant MAX_DISTANCE: natural := 4000000;	///<
#machine	constant MAX_TIME: natural := MAX_DISTANCE * 2 / SPEED_OF_SOUND * 1000;	///<
#machine	shared variable numloops: natural := 0;	///<
#machine	constant maxloops: natural:= MAX_TIME / SCHEDULE_LENGTH;	///<
#extern	hasResult: out std_logic;	///<
