//
// UltrasonicDiscreteSingle_Variables.h
//
// Automatically created through MiPalCASE -- do not change manually!
//
#extern	triggerPin: out std_logic;	///<
#extern	echoIn: in std_logic;	///<
#extern	distance: out std_logic_vector(15 downto 0);	///<
#machine	signal maxloops: unsigned(39 downto 0);	///<
#machine	constant SCHEDULE_LENGTH: unsigned(7 downto 0) := x"64";	///<
#machine	constant SPEED_OF_SOUND: unsigned(11 downto 0) := x"157";	///<
#machine	constant SONAR_OFFSET: unsigned(7 downto 0) := x"28";	///<
#machine	constant MAX_DISTANCE: unsigned(23 downto 0) := x"3D0900";	///<
#machine	signal MAX_TIME: unsigned(39 downto 0);	///<
#machine	signal numloops: unsigned(39 downto 0);	///<
#machine	signal RINGLETS_PER_MS: unsigned(19 downto 0);	///<
#machine	signal i: unsigned(31 downto 0);	///<
#machine	signal RINGLETS_PER_S: unsigned(31 downto 0);	///<
#extern	LEDG: out std_logic_vector(8 downto 0);	///<
#extern	LEDR: out std_logic_vector(17 downto 0);	///<
#machine	signal lostState: std_logic_vector(3 downto 0);	///<
#extern	echoOut: out std_logic;	///<
#extern	sendEcho: out std_logic;	///<
