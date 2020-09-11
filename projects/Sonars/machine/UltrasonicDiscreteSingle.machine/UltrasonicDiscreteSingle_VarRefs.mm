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
#machine	&signal maxloops: unsigned(39 downto 0) = _m->signal maxloops: unsigned(39 downto 0);	///<
#machine	&constant SCHEDULE_LENGTH: unsigned(7 downto 0) := x"64" = _m->constant SCHEDULE_LENGTH: unsigned(7 downto 0) := x"64";	///<
#machine	&constant SPEED_OF_SOUND: unsigned(11 downto 0) := x"157" = _m->constant SPEED_OF_SOUND: unsigned(11 downto 0) := x"157";	///<
#machine	&constant SONAR_OFFSET: unsigned(7 downto 0) := x"28" = _m->constant SONAR_OFFSET: unsigned(7 downto 0) := x"28";	///<
#machine	&constant MAX_DISTANCE: unsigned(23 downto 0) := x"3D0900" = _m->constant MAX_DISTANCE: unsigned(23 downto 0) := x"3D0900";	///<
#machine	&signal MAX_TIME: unsigned(39 downto 0) = _m->signal MAX_TIME: unsigned(39 downto 0);	///<
#machine	&signal numloops: unsigned(39 downto 0) = _m->signal numloops: unsigned(39 downto 0);	///<
#machine	&signal RINGLETS_PER_MS: unsigned(19 downto 0) = _m->signal RINGLETS_PER_MS: unsigned(19 downto 0);	///<
#machine	&signal i: unsigned(31 downto 0) = _m->signal i: unsigned(31 downto 0);	///<
#machine	&signal RINGLETS_PER_S: unsigned(31 downto 0) = _m->signal RINGLETS_PER_S: unsigned(31 downto 0);	///<
#extern	&LEDG: out std_logic_vector(8 downto 0) = _m->LEDG: out std_logic_vector(8 downto 0);	///<
#extern	&LEDR: out std_logic_vector(17 downto 0) = _m->LEDR: out std_logic_vector(17 downto 0);	///<
#machine	&signal lostState: std_logic_vector(3 downto 0) = _m->signal lostState: std_logic_vector(3 downto 0);	///<
#extern	&echoOut: out std_logic = _m->echoOut: out std_logic;	///<
#extern	&sendEcho: out std_logic = _m->sendEcho: out std_logic;	///<

#pragma clang diagnostic pop
