//
// BinaryToSingleDigitBCDEncoder_Variables.h
//
// Automatically created through MiPalCASE -- do not change manually!
//
#extern	binary: in std_logic_vector(3 downto 0);	///<
#extern	bcd: out std_logic_vector(3 downto 0);	///<
#extern	busy: out std_logic;	///<
#extern	carry: out std_logic;	///<
#machine	signal oldBinary: std_logic_vector(3 downto 0);	///<
#machine	signal bitsShifted: unsigned(2 downto 0);	///<
#machine	signal oldBcd: std_logic_vector(3 downto 0);	///<
