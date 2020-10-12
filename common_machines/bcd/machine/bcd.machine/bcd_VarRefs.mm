//
// bcd_VarRefs.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wunused-variable"
#pragma clang diagnostic ignored "-Wshadow"

bcd *_m = static_cast<bcd *>(_machine);

#param	&N: Integer = _m->N: Integer;	///< 
#param	&digits: Integer = _m->digits: Integer;	///< 
#extern	&binary: in std_logic_vector(N - 1 downto 0) = _m->binary: in std_logic_vector(N - 1 downto 0);	///< 
#extern	&bcd: out std_logic_vector(digits * 4 - 1 downto 0) = _m->bcd: out std_logic_vector(digits * 4 - 1 downto 0);	///< 
#machine	&constant maxDivisor: integer := 10 ** (digits - 1) = _m->constant maxDivisor: integer := 10 ** (digits - 1);	///< 
#machine	&signal unsignedBinary: unsigned(N-1 downto 0) = _m->signal unsignedBinary: unsigned(N-1 downto 0);	///< 
#machine	&shared variable data: integer range 0 to 2**N - 1 = _m->shared variable data: integer range 0 to 2**N - 1;	///< 
#machine	&signal tempBcd: unsigned(digits * 4 - 1 downto 0) = _m->signal tempBcd: unsigned(digits * 4 - 1 downto 0);	///< 
#machine	&shared variable exponent: integer range -1 to digits - 1 := digits - 1 = _m->shared variable exponent: integer range -1 to digits - 1 := digits - 1;	///< 
#machine	&shared variable divisor: integer range 0 to 10 ** (digits - 1) := 10 ** (digits - 1) = _m->shared variable divisor: integer range 0 to 10 ** (digits - 1) := 10 ** (digits - 1);	///< 

#pragma clang diagnostic pop
