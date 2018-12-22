//
// PixelFlip_VarRefs.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wunused-variable"
#pragma clang diagnostic ignored "-Wshadow"

PixelFlip *_m = static_cast<PixelFlip *>(_machine);

#extern	&redOut: out std_logic_vector(7 downto 0) = _m->redOut: out std_logic_vector(7 downto 0);	///< 
#extern	&greenOut: out std_logic_vector(7 downto 0) = _m->greenOut: out std_logic_vector(7 downto 0);	///< 
#machine	&signal pastRed: std_logic_vector(7 downto 0) := "00000000" = _m->signal pastRed: std_logic_vector(7 downto 0) := "00000000";	///< 
#machine	&signal pastGreen: std_logic_vector(7 downto 0) := "00000000" = _m->signal pastGreen: std_logic_vector(7 downto 0) := "00000000";	///< 
#machine	&signal i: unsigned(25 downto 0) = _m->signal i: unsigned(25 downto 0);	///< 

#pragma clang diagnostic pop
