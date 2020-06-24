//
// DisplayGateway_Variables.h
//
// Automatically created through MiPalCASE -- do not change manually!
//
#extern	dataLine: out std_logic;	///<
#extern	data: in std_logic_vector(7 downto 0);	///<
#extern	digit: in std_logic_vector(3 downto 0);	///<
#machine	signal i: unsigned(15 downto 0);	///<
#extern	busy: out std_logic;	///<
#machine	constant PULSE_LENGTH: unsigned(15 downto 0) := x"FFFF";	///<
#extern	cs: out std_logic;	///<
#machine	signal txBusy: std_logic;	///<
#machine	signal txData: std_logic_vector(15 downto 0);	///<
#machine	signal latchedData: std_logic_vector(7 downto 0);	///<
#machine	signal latchedDigit: std_logic_vector(3 downto 0);	///<
