//
// SixteenBitBinaryToBCDEncoder_VarRefs.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wunused-variable"
#pragma clang diagnostic ignored "-Wshadow"

SixteenBitBinaryToBCDEncoder *_m = static_cast<SixteenBitBinaryToBCDEncoder *>(_machine);

#extern	&data: in std_logic_vector(15 downto 0) = _m->data: in std_logic_vector(15 downto 0);	///<
#extern	&busy: out std_logic = _m->busy: out std_logic;	///<
#extern	&bcd: out std_logic_vector(19 downto 0) = _m->bcd: out std_logic_vector(19 downto 0);	///<
#machine	&signal bitsShifted: unsigned(3 downto 0) = _m->signal bitsShifted: unsigned(3 downto 0);	///<
#machine	&signal latchedData: std_logic_vector(15 downto 0) = _m->signal latchedData: std_logic_vector(15 downto 0);	///<
#machine	&signal carryBits: std_logic_vector(4 downto 0) = _m->signal carryBits: std_logic_vector(4 downto 0);	///<
#machine	&signal binary: std_logic = _m->signal binary: std_logic;	///<
#machine	&signal busyEncoders: std_logic_vector(4 downto 0) = _m->signal busyEncoders: std_logic_vector(4 downto 0);	///<
#machine	&signal enable: std_logic = _m->signal enable: std_logic;	///<
#machine	&signal encoderOutputs: std_logic_vector(19 downto 0) = _m->signal encoderOutputs: std_logic_vector(19 downto 0);	///<
#machine	&signal originalData: std_logic_vector(15 downto 0) = _m->signal originalData: std_logic_vector(15 downto 0);	///<
#machine	&signal reset: std_logic = _m->signal reset: std_logic;	///<

#pragma clang diagnostic pop
