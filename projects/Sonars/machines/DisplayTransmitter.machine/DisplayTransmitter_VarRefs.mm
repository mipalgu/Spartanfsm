//
// DisplayTransmitter_VarRefs.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wunused-variable"
#pragma clang diagnostic ignored "-Wshadow"

DisplayTransmitter *_m = static_cast<DisplayTransmitter *>(_machine);

#extern	&data: in std_logic_vector(15 downto 0) = _m->data: in std_logic_vector(15 downto 0);	///<
#extern	&busy: out std_logic = _m->busy: out std_logic;	///<
#machine	&signal latchedData: std_logic_vector(15 downto 0) = _m->signal latchedData: std_logic_vector(15 downto 0);	///<
#extern	&dataLine: out std_logic = _m->dataLine: out std_logic;	///<
#machine	&signal dataToSend: std_logic_vector(15 downto 0) = _m->signal dataToSend: std_logic_vector(15 downto 0);	///<
#machine	&signal bitsShifted: unsigned(4 downto 0) = _m->signal bitsShifted: unsigned(4 downto 0);	///<
#extern	&cs: out std_logic = _m->cs: out std_logic;	///<

#pragma clang diagnostic pop
