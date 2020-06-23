//
// EightBitBinaryToBCDEncoder_Variables.h
//
// Automatically created through MiPalCASE -- do not change manually!
//
#extern	data: in std_logic_vector(7 downto 0);	///<
#extern	busy: out std_logic;	///<
#extern	bcd: out std_logic_vector(11 downto 0);	///<
#machine	signal bitsShifted: unsigned(3 downto 0);	///<
#machine	signal latchedData: std_logic_vector(7 downto 0);	///<
#machine	signal carryBits: std_logic_vector(2 downto 0);	///<
#machine	signal binary: std_logic;	///<
#machine	signal busyEncoders: std_logic_vector(2 downto 0);	///<
#machine	signal enable: std_logic;	///<
#machine	signal encoderOutputs: std_logic_vector(11 downto 0);	///<
#machine	signal originalData: std_logic_vector(7 downto 0);	///<
#machine	signal reset: std_logic;	///<
