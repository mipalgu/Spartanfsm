//
// DisplayGateway_VarRefs.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wunused-variable"
#pragma clang diagnostic ignored "-Wshadow"

DisplayGateway *_m = static_cast<DisplayGateway *>(_machine);

#extern	&addressLine: out std_logic_vector(3 downto 0) = _m->addressLine: out std_logic_vector(3 downto 0);	///<
#extern	&dataLine: out std_logic_vector(7 downto 0) = _m->dataLine: out std_logic_vector(7 downto 0);	///<
#extern	&data: in std_logic_vector(7 downto 0) = _m->data: in std_logic_vector(7 downto 0);	///<
#extern	&digit: in std_logic_vector(3 downto 0) = _m->digit: in std_logic_vector(3 downto 0);	///<
#machine	&signal i: unsigned(15 downto 0) = _m->signal i: unsigned(15 downto 0);	///<
#machine	&signal latchedData: std_logic_vector(7 downto 0) = _m->signal latchedData: std_logic_vector(7 downto 0);	///<
#machine	&signal latchedDigit: std_logic_vector(3 downto 0) = _m->signal latchedDigit: std_logic_vector(3 downto 0);	///<
#extern	&busy: out std_logic = _m->busy: out std_logic;	///<

#pragma clang diagnostic pop
