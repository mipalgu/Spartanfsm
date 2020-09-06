//
// UltrasonicDiscreteSingle_Variables.h
//
// Automatically created through MiPalCASE -- do not change manually!
//
#extern	triggerPin: out std_logic;	///<
#extern	echoPin: inout std_logic;	///<
#extern	distance: out std_logic_vector(15 downto 0);	///<
#machine	signal maxloops: unsigned(33 downto 0);	///<
#machine	signal SCHEDULE_LENGTH: unsigned(7 downto 0);	///<
#machine	signal SPEED_OF_SOUND: unsigned(8 downto 0);	///<
#machine	signal SONAR_OFFSET: unsigned(5 downto 0);	///<
#machine	signal MAX_DISTANCE: unsigned(21 downto 0);	///<
#machine	signal MAX_TIME: unsigned(33 downto 0);	///<
#machine	signal numloops: unsigned(23 downto 0);	///<
#machine	signal CLOCK_PERIOD: unsigned(4 downto 0);	///<
#machine	signal RINGLETS_PER_MS: unsigned(19 downto 0);	///<
#machine	signal i: unsigned(31 downto 0);	///<
#machine	signal RINGLETS_PER_S: unsigned(31 downto 0);	///<
#extern	LEDG: out std_logic_vector(8 downto 0);	///<
#extern	LEDR: out std_logic_vector(17 downto 0);	///<
#machine	signal lostState: std_logic_vector(3 downto 0);	///<
