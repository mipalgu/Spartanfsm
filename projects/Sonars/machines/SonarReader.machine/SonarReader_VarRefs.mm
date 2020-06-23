//
// SonarReader_VarRefs.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wunused-variable"
#pragma clang diagnostic ignored "-Wshadow"

SonarReader *_m = static_cast<SonarReader *>(_machine);

#machine	&signal distance1: std_logic_vector(7 downto 0) = _m->signal distance1: std_logic_vector(7 downto 0);	///<
#machine	&signal distance2: std_logic_vector(7 downto 0) = _m->signal distance2: std_logic_vector(7 downto 0);	///<
#machine	&signal displayBusy: std_logic = _m->signal displayBusy: std_logic;	///<
#machine	&signal digit: unsigned(3 downto 0) = _m->signal digit: unsigned(3 downto 0);	///<
#machine	&signal output: std_logic_vector(7 downto 0) = _m->signal output: std_logic_vector(7 downto 0);	///<
#machine	&signal bcdData: std_logic_vector(11 downto 0) = _m->signal bcdData: std_logic_vector(11 downto 0);	///<
#machine	&signal distance1BCD: std_logic_vector(11 downto 0) = _m->signal distance1BCD: std_logic_vector(11 downto 0);	///<
#machine	&signal distance2BCD: std_logic_vector(11 downto 0) = _m->signal distance2BCD: std_logic_vector(11 downto 0);	///<
#machine	&signal sevSegInput: std_logic_vector(3 downto 0) = _m->signal sevSegInput: std_logic_vector(3 downto 0);	///<
#machine	&signal digitSelect: unsigned(3 downto 0) = _m->signal digitSelect: unsigned(3 downto 0);	///<
#machine	&signal sevSegBusy: std_logic = _m->signal sevSegBusy: std_logic;	///<
#machine	&signal displayData: std_logic_vector(7 downto 0) = _m->signal displayData: std_logic_vector(7 downto 0);	///<
#machine	&signal displayDigit: std_logic_vector(3 downto 0) = _m->signal displayDigit: std_logic_vector(3 downto 0);	///<
#machine	&signal sevSegOutput: std_logic_vector(6 downto 0) = _m->signal sevSegOutput: std_logic_vector(6 downto 0);	///<
#machine	&signal dataToSend: std_logic_vector(7 downto 0) = _m->signal dataToSend: std_logic_vector(7 downto 0);	///<
#extern	&address: out std_logic_vector(3 downto 0) = _m->address: out std_logic_vector(3 downto 0);	///<
#extern	&data: out std_logic_vector(7 downto 0) = _m->data: out std_logic_vector(7 downto 0);	///<
#extern	&trigger1: out std_logic = _m->trigger1: out std_logic;	///<
#extern	&trigger2: out std_logic = _m->trigger2: out std_logic;	///<
#extern	&echo1: in std_logic = _m->echo1: in std_logic;	///<
#extern	&echo2: in std_logic = _m->echo2: in std_logic;	///<

#pragma clang diagnostic pop
