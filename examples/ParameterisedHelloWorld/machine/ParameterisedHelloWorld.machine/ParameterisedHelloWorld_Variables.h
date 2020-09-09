//
// ParameterisedHelloWorld_Variables.h
//
// Automatically created through MiPalCASE -- do not change manually!
//
#machine	constant RINGLETS_PER_S: unsigned(23 downto 0) := x"7F2816";	///<
#machine	signal i: unsigned(23 downto 0);	///<
#param	NGreen: Integer;	///<
#param	NRed: Integer;	///<
#extern	LEDG: out std_logic_vector(NGREEN - 1 downto 0);	///<
#extern	LEDR: out std_logic_vector(NRED - 1 downto 0);	///<
