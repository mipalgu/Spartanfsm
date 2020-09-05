//
// SingleDigitBCDEncoderWithShifting_VarRefs.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wunused-variable"
#pragma clang diagnostic ignored "-Wshadow"

SingleDigitBCDEncoderWithShifting *_m = static_cast<SingleDigitBCDEncoderWithShifting *>(_machine);

#extern	&binary: in std_logic = _m->binary: in std_logic;	///<
#extern	&enable: in std_logic = _m->enable: in std_logic;	///<
#extern	&busy: out std_logic = _m->busy: out std_logic;	///<
#extern	&bcd: out std_logic_vector(3 downto 0) = _m->bcd: out std_logic_vector(3 downto 0);	///<
#extern	&reset: in std_logic = _m->reset: in std_logic;	///<
#extern	&carry: out std_logic = _m->carry: out std_logic;	///<
#machine	&signal latchedBinary: std_logic = _m->signal latchedBinary: std_logic;	///<

#pragma clang diagnostic pop
