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
#extern	&echoPin: inout std_logic = _m->echoPin: inout std_logic;	///<
#machine	&signal distance: unsigned(15 downto 0) = _m->signal distance: unsigned(15 downto 0);	///<
#machine	&signal maxloops: unsigned(23 downto 0) = _m->signal maxloops: unsigned(23 downto 0);	///<
#machine	&signal SCHEDULE_LENGTH: unsigned(15 downto 0) = _m->signal SCHEDULE_LENGTH: unsigned(15 downto 0);	///<
#machine	&signal SPEED_OF_SOUND: unsigned(15 downto 0) = _m->signal SPEED_OF_SOUND: unsigned(15 downto 0);	///<
#machine	&signal SONAR_OFFSET: unsigned(15 downto 0) = _m->signal SONAR_OFFSET: unsigned(15 downto 0);	///<
#machine	&signal MAX_DISTANCE: unsigned(23 downto 0) = _m->signal MAX_DISTANCE: unsigned(23 downto 0);	///<
#machine	&signal MAX_TIME: unsigned(31 downto 0) = _m->signal MAX_TIME: unsigned(31 downto 0);	///<
#machine	&signal numloops: unsigned(23 downto 0) = _m->signal numloops: unsigned(23 downto 0);	///<
#machine	&signal CLOCK_PERIOD: unsigned(15 downto 0) = _m->signal CLOCK_PERIOD: unsigned(15 downto 0);	///<
#machine	&signal RINGLETS_PER_MS: unsigned(15 downto 0) = _m->signal RINGLETS_PER_MS: unsigned(15 downto 0);	///<
#machine	&signal i: unsigned(15 downto 0) = _m->signal i: unsigned(15 downto 0);	///<

#pragma clang diagnostic pop
