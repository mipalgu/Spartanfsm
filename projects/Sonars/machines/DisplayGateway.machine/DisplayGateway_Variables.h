//
// DisplayGateway_Variables.h
//
// Automatically created through MiPalCASE -- do not change manually!
//
#extern	addressLine: out std_logic_vector(3 downto 0);	///<
#extern	dataLine: out std_logic_vector(7 downto 0);	///<
#extern	data: in std_logic_vector(7 downto 0);	///<
#extern	digit: in std_logic_vector(3 downto 0);	///<
#machine	signal i: unsigned(15 downto 0);	///<
#machine	signal latchedData: std_logic_vector(7 downto 0);	///<
#machine	signal latchedDigit: std_logic_vector(3 downto 0);	///<
#extern	busy: out std_logic;	///<
