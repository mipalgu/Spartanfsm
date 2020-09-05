//
// SensorFusion_VarRefs.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wunused-variable"
#pragma clang diagnostic ignored "-Wshadow"

SensorFusion *_m = static_cast<SensorFusion *>(_machine);

#extern	&distance: out std_logic_vector(15 downto 0) = _m->distance: out std_logic_vector(15 downto 0);	///<
#machine	&signal distance: std_logic_vector(47 downto 0) = _m->signal distance: std_logic_vector(47 downto 0);	///<
#extern	&trigger: out std_logic_vector(2 downto 0) = _m->trigger: out std_logic_vector(2 downto 0);	///<
#extern	&echo: inout std_logic_vector(2 downto 0) = _m->echo: inout std_logic_vector(2 downto 0);	///<
#machine	&signal smallestDistance: integer(15 downto 0) = _m->signal smallestDistance: integer(15 downto 0);	///<

#pragma clang diagnostic pop
