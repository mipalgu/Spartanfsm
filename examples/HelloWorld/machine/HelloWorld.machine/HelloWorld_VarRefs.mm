//
// HelloWorld_VarRefs.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wunused-variable"
#pragma clang diagnostic ignored "-Wshadow"

HelloWorld *_m = static_cast<HelloWorld *>(_machine);

#extern	&LED: out std_logic = _m->LED: out std_logic;	///<
#machine	&constant RINGLETS_PER_S: unsigned(23 downto 0) := x"7F2816" = _m->constant RINGLETS_PER_S: unsigned(23 downto 0) := x"7F2816";	///<
#machine	&signal i: unsigned(23 downto 0) = _m->signal i: unsigned(23 downto 0);	///<

#pragma clang diagnostic pop
