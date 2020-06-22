//
// BinaryToSingleDigitBCDEncoder_VarRefs.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wunused-variable"
#pragma clang diagnostic ignored "-Wshadow"

BinaryToSingleDigitBCDEncoder *_m = static_cast<BinaryToSingleDigitBCDEncoder *>(_machine);

#extern	&binary: in std_logic_vector(3 downto 0) = _m->binary: in std_logic_vector(3 downto 0);	///<
#extern	&bcd: out std_logic_vector(3 downto 0) = _m->bcd: out std_logic_vector(3 downto 0);	///<
#extern	&busy: out std_logic = _m->busy: out std_logic;	///<
#extern	&carry: out std_logic = _m->carry: out std_logic;	///<
#machine	&oldBinary: std_logic_vector(3 downto 0) = _m->oldBinary: std_logic_vector(3 downto 0);	///<
#machine	&bitsShifted: unsigned(2 downto 0) = _m->bitsShifted: unsigned(2 downto 0);	///<

#pragma clang diagnostic pop
