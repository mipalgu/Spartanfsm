//
// SevenSegDisplay_VarRefs.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wunused-variable"
#pragma clang diagnostic ignored "-Wshadow"

SevenSegDisplay *_m = static_cast<SevenSegDisplay *>(_machine);

#param	&N: integer = _m->N: integer;	///<
#param	&digits: Integer = _m->digits: Integer;	///<
#extern	&number: in std_logic_vector(N - 1 downto 0) = _m->number: in std_logic_vector(N - 1 downto 0);	///<
#extern	&sevSegDigits: out digit_array(digits - 1 downto 0)(7 downto 0) = _m->sevSegDigits: out digit_array(digits - 1 downto 0)(7 downto 0);	///<
#machine	&signal restartBcd: std_logic := '1' = _m->signal restartBcd: std_logic := '1';	///<
#machine	&signal suspendedBcd: std_logic = _m->signal suspendedBcd: std_logic;	///<
#machine	&signal bcdOut: std_logic_vector(digits * 4 - 1 downto 0) = _m->signal bcdOut: std_logic_vector(digits * 4 - 1 downto 0);	///<
#machine	&shared variable currentDigit: Integer range 0 to digits := 0 = _m->shared variable currentDigit: Integer range 0 to digits := 0;	///<

#pragma clang diagnostic pop
