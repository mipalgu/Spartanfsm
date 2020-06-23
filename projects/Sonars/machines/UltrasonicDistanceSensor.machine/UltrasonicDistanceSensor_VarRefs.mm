//
// UltrasonicDistanceSensor_VarRefs.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wunused-variable"
#pragma clang diagnostic ignored "-Wshadow"

UltrasonicDistanceSensor *_m = static_cast<UltrasonicDistanceSensor *>(_machine);

#extern	&echo: in std_logic = _m->echo: in std_logic;	///<
#extern	&trigger: out std_logic = _m->trigger: out std_logic;	///<
#extern	&distance: out unsigned(7 downto 0) = _m->distance: out unsigned(7 downto 0);	///<
#machine	&signal i: unsigned(23 downto 0) = _m->signal i: unsigned(23 downto 0);	///<
#machine	&constant SPEED_OF_SOUND: unsigned(15 downto 0) := x"84D0" = _m->constant SPEED_OF_SOUND: unsigned(15 downto 0) := x"84D0";	///<
#machine	&constant DOUBLE_FREQ: unsigned(27 downto 0) := x"5F5E100" = _m->constant DOUBLE_FREQ: unsigned(27 downto 0) := x"5F5E100";	///<
#extern	&resetEcho: out std_logic = _m->resetEcho: out std_logic;	///<
#machine	&constant TIMEOUT: unsigned(23 downto 0) := x"59C284" = _m->constant TIMEOUT: unsigned(23 downto 0) := x"59C284";	///<
#machine	&constant RINGET_LENGTH: unsigned(2 downto 0) := x"6" = _m->constant RINGET_LENGTH: unsigned(2 downto 0) := x"6";	///<

#pragma clang diagnostic pop
