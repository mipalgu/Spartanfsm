//
// SevenSegmentTester_VarRefs.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wunused-variable"
#pragma clang diagnostic ignored "-Wshadow"

SevenSegmentTester *_m = static_cast<SevenSegmentTester *>(_machine);

#extern	&dataLine: out std_logic = _m->dataLine: out std_logic;	///<
#extern	&slaveClk: in std_logic = _m->slaveClk: in std_logic;	///<
#extern	&cs: out std_logic = _m->cs: out std_logic;	///<
#machine	&signal data: std_logic_vector(7 downto 0) = _m->signal data: std_logic_vector(7 downto 0);	///<
#machine	&signal digit: unsigned(3 downto 0) = _m->signal digit: unsigned(3 downto 0);	///<
#machine	&signal busy: std_logic = _m->signal busy: std_logic;	///<

#pragma clang diagnostic pop
