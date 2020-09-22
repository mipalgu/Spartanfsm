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
#extern	&echo: in std_logic = _m->echo: in std_logic;	///<
#extern	&distance: out std_logic_vector(15 downto 0) = _m->distance: out std_logic_vector(15 downto 0);	///<
#machine	&constant SCHEDULE_LENGTH: natural := 100 = _m->constant SCHEDULE_LENGTH: natural := 100;	///<
#machine	&constant SPEED_OF_SOUND: natural := 343 = _m->constant SPEED_OF_SOUND: natural := 343;	///<
#machine	&constant SONAR_OFFSET: natural := 40 = _m->constant SONAR_OFFSET: natural := 40;	///<
#machine	&constant MAX_DISTANCE: natural := 4000000 = _m->constant MAX_DISTANCE: natural := 4000000;	///<
#machine	&constant MAX_TIME: natural := MAX_DISTANCE * 2 / SPEED_OF_SOUND * 1000 = _m->constant MAX_TIME: natural := MAX_DISTANCE * 2 / SPEED_OF_SOUND * 1000;	///<
#machine	&signal numloops: unsigned(39 downto 0) = _m->signal numloops: unsigned(39 downto 0);	///<
#machine	&constant maxloops: unsigned(39 downto 0) := to_unsigned(MAX_TIME / SCHEDULE_LENGTH, 40) = _m->constant maxloops: unsigned(39 downto 0) := to_unsigned(MAX_TIME / SCHEDULE_LENGTH, 40);	///<

#pragma clang diagnostic pop
