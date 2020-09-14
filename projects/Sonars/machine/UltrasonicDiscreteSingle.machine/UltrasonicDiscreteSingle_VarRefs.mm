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
#extern	&echo: inout std_logic = _m->echo: inout std_logic;	///<
#extern	&distance: out std_logic_vector(15 downto 0) = _m->distance: out std_logic_vector(15 downto 0);	///<
#machine	&constant SCHEDULE_LENGTH: unsigned(7 downto 0) := x"78" = _m->constant SCHEDULE_LENGTH: unsigned(7 downto 0) := x"78";	///<
#machine	&constant SPEED_OF_SOUND: unsigned(11 downto 0) := x"157" = _m->constant SPEED_OF_SOUND: unsigned(11 downto 0) := x"157";	///<
#machine	&constant SONAR_OFFSET: unsigned(7 downto 0) := x"28" = _m->constant SONAR_OFFSET: unsigned(7 downto 0) := x"28";	///<
#machine	&constant MAX_DISTANCE: unsigned(23 downto 0) := x"3D0900" = _m->constant MAX_DISTANCE: unsigned(23 downto 0) := x"3D0900";	///<
#machine	&constant MAX_TIME: unsigned(39 downto 0) := (MAX_DISTANCE * x"2") / SPEED_OF_SOUND *x"3E8" = _m->constant MAX_TIME: unsigned(39 downto 0) := (MAX_DISTANCE * x"2") / SPEED_OF_SOUND *x"3E8";	///<
#machine	&signal numloops: unsigned(39 downto 0) = _m->signal numloops: unsigned(39 downto 0);	///<
#machine	&constant maxloops: unsigned(39 downto 0) := MAX_TIME / SCHEDULE_LENGTH = _m->constant maxloops: unsigned(39 downto 0) := MAX_TIME / SCHEDULE_LENGTH;	///<

#pragma clang diagnostic pop
