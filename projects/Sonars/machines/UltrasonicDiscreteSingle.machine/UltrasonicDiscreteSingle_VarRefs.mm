//
// UltrasonicDiscreteSingle_VarRefs.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wunused-variable"
#pragma clang diagnostic ignored "-Wshadow"

UltrasonicDiscreteSingle *_m = static_cast<UltrasonicDiscreteSingle *>(_machine);

#extern	&triggerPin: out std_logic = _m->triggerPin: out std_logic;	///<
#extern	&echoIn: in std_logic = _m->echoIn: in std_logic;	///<
#extern	&distance: out std_logic_vector(15 downto 0) = _m->distance: out std_logic_vector(15 downto 0);	///<
#machine	&signal maxloops: unsigned(33 downto 0) = _m->signal maxloops: unsigned(33 downto 0);	///<
#machine	&signal SCHEDULE_LENGTH: unsigned(7 downto 0) = _m->signal SCHEDULE_LENGTH: unsigned(7 downto 0);	///<
#machine	&signal SPEED_OF_SOUND: unsigned(8 downto 0) = _m->signal SPEED_OF_SOUND: unsigned(8 downto 0);	///<
#machine	&signal SONAR_OFFSET: unsigned(5 downto 0) = _m->signal SONAR_OFFSET: unsigned(5 downto 0);	///<
#machine	&signal MAX_DISTANCE: unsigned(21 downto 0) = _m->signal MAX_DISTANCE: unsigned(21 downto 0);	///<
#machine	&signal MAX_TIME: unsigned(33 downto 0) = _m->signal MAX_TIME: unsigned(33 downto 0);	///<
#machine	&signal numloops: unsigned(23 downto 0) = _m->signal numloops: unsigned(23 downto 0);	///<
#machine	&signal CLOCK_PERIOD: unsigned(4 downto 0) = _m->signal CLOCK_PERIOD: unsigned(4 downto 0);	///<
#machine	&signal RINGLETS_PER_MS: unsigned(19 downto 0) = _m->signal RINGLETS_PER_MS: unsigned(19 downto 0);	///<
#machine	&signal i: unsigned(31 downto 0) = _m->signal i: unsigned(31 downto 0);	///<
#machine	&signal RINGLETS_PER_S: unsigned(31 downto 0) = _m->signal RINGLETS_PER_S: unsigned(31 downto 0);	///<
#extern	&LEDG: out std_logic_vector(8 downto 0) = _m->LEDG: out std_logic_vector(8 downto 0);	///<
#extern	&LEDR: out std_logic_vector(17 downto 0) = _m->LEDR: out std_logic_vector(17 downto 0);	///<
#machine	&signal lostState: std_logic_vector(3 downto 0) = _m->signal lostState: std_logic_vector(3 downto 0);	///<
#extern	&echoOut: out std_logic = _m->echoOut: out std_logic;	///<
#extern	&sendEcho: out std_logic = _m->sendEcho: out std_logic;	///<

#pragma clang diagnostic pop
