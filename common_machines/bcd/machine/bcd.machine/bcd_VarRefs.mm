//
// bcd_VarRefs.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wunused-variable"
#pragma clang diagnostic ignored "-Wshadow"

bcd *_m = static_cast<bcd *>(_machine);

#param	&N: Integer = _m->N: Integer;	///<
#param	&digits: Integer = _m->digits: Integer;	///<
#extern	&binary: in std_logic_vector(N - 1 downto 0) = _m->binary: in std_logic_vector(N - 1 downto 0);	///<
#extern	&bcd: out std_logic_vector(digits * 4 - 1 downto 0) = _m->bcd: out std_logic_vector(digits * 4 - 1 downto 0);	///<
#extern	&enable: in std_logic = _m->enable: in std_logic;	///<
#extern	&busy: out std_logic = _m->busy: out std_logic;	///<
int	& = _m->;	///<

#pragma clang diagnostic pop
