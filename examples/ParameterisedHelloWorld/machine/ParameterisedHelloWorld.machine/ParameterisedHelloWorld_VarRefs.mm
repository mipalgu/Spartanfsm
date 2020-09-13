//
// ParameterisedHelloWorld_VarRefs.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wunused-variable"
#pragma clang diagnostic ignored "-Wshadow"

ParameterisedHelloWorld *_m = static_cast<ParameterisedHelloWorld *>(_machine);

#param	&NGreen: Integer = _m->NGreen: Integer;	///<
#param	&NRed: Integer = _m->NRed: Integer;	///<
#extern	&LEDG: out std_logic_vector(NGREEN - 1 downto 0) = _m->LEDG: out std_logic_vector(NGREEN - 1 downto 0);	///<
#extern	&LEDR: out std_logic_vector(NRED - 1 downto 0) = _m->LEDR: out std_logic_vector(NRED - 1 downto 0);	///<

#pragma clang diagnostic pop
