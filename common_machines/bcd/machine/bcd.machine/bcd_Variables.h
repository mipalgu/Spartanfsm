//
// bcd_Variables.h
//
// Automatically created through MiPalCASE -- do not change manually!
//
#param	N: Integer;	///<
#param	digits: Integer;	///<
#extern	binary: in std_logic_vector(N - 1 downto 0);	///<
#extern	bcd: out std_logic_vector(digits * 4 - 1 downto 0);	///<
#machine	shared variable divisor: integer range 0 to 10 ** (digits - 1) := 10 ** (digits - 1);	///<
#machine	signal unsignedBinary: unsigned(N-1 downto 0);	///<
#machine	signal data: unsigned(3 downto 0);	///<
#machine	signal tempBcd: unsigned(N * 4 - 1 downto 0);	///<
#machine	shared variable exponent: integer range -1 to digits - 1 := digits - 1;	///<
