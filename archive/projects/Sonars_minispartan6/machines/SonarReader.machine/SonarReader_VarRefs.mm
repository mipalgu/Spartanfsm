//
// SonarReader_VarRefs.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wunused-variable"
#pragma clang diagnostic ignored "-Wshadow"

SonarReader *_m = static_cast<SonarReader *>(_machine);

#machine	&signal distance1: unsigned(7 downto 0) = _m->signal distance1: unsigned(7 downto 0);	///<
#machine	&signal distance2: unsigned(7 downto 0) = _m->signal distance2: unsigned(7 downto 0);	///<
#machine	&signal displayBusy: std_logic = _m->signal displayBusy: std_logic;	///<
#machine	&signal digit: unsigned(3 downto 0) = _m->signal digit: unsigned(3 downto 0);	///<
#machine	&signal output: std_logic_vector(7 downto 0) = _m->signal output: std_logic_vector(7 downto 0);	///<
#machine	&signal bcdData: std_logic_vector(11 downto 0) = _m->signal bcdData: std_logic_vector(11 downto 0);	///<
#machine	&signal bcdOutput:  std_logic_vector(11 downto 0) = _m->signal bcdOutput:  std_logic_vector(11 downto 0);	///<
#machine	&signal sevSegInput: std_logic_vector(3 downto 0) = _m->signal sevSegInput: std_logic_vector(3 downto 0);	///<
#machine	&signal digitSelect: unsigned(3 downto 0) = _m->signal digitSelect: unsigned(3 downto 0);	///<
#machine	&signal sevSegBusy: std_logic = _m->signal sevSegBusy: std_logic;	///<
#machine	&signal displayData: std_logic_vector(7 downto 0) = _m->signal displayData: std_logic_vector(7 downto 0);	///<
#machine	&signal displayDigit: std_logic_vector(3 downto 0) = _m->signal displayDigit: std_logic_vector(3 downto 0);	///<
#machine	&signal sevSegOutput: std_logic_vector(6 downto 0) = _m->signal sevSegOutput: std_logic_vector(6 downto 0);	///<
#machine	&signal dataToSend: std_logic_vector(7 downto 0) = _m->signal dataToSend: std_logic_vector(7 downto 0);	///<
#extern	&dataLine: out std_logic = _m->dataLine: out std_logic;	///<
#extern	&trigger1: out std_logic = _m->trigger1: out std_logic;	///<
#extern	&trigger2: out std_logic = _m->trigger2: out std_logic;	///<
#extern	&echo1: in std_logic = _m->echo1: in std_logic;	///<
#extern	&echo2: in std_logic = _m->echo2: in std_logic;	///<
#machine	&signal bcdInput: std_logic_vector(7 downto 0) = _m->signal bcdInput: std_logic_vector(7 downto 0);	///<
#machine	&signal bcdBusy: std_logic = _m->signal bcdBusy: std_logic;	///<
#extern	&slaveClk: in std_logic = _m->slaveClk: in std_logic;	///<
#extern	&cs: out std_logic = _m->cs: out std_logic;	///<

#pragma clang diagnostic pop
