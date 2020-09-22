//
// SonarReader_Variables.h
//
// Automatically created through MiPalCASE -- do not change manually!
//
#machine	signal distance1: unsigned(7 downto 0);	///<
#machine	signal distance2: unsigned(7 downto 0);	///<
#machine	signal displayBusy: std_logic;	///<
#machine	signal digit: unsigned(3 downto 0);	///<
#machine	signal output: std_logic_vector(7 downto 0);	///<
#machine	signal bcdData: std_logic_vector(11 downto 0);	///<
#machine	signal bcdOutput:  std_logic_vector(11 downto 0);	///<
#machine	signal sevSegInput: std_logic_vector(3 downto 0);	///<
#machine	signal digitSelect: unsigned(3 downto 0);	///<
#machine	signal sevSegBusy: std_logic;	///<
#machine	signal displayData: std_logic_vector(7 downto 0);	///<
#machine	signal displayDigit: std_logic_vector(3 downto 0);	///<
#machine	signal sevSegOutput: std_logic_vector(6 downto 0);	///<
#machine	signal dataToSend: std_logic_vector(7 downto 0);	///<
#extern	dataLine: out std_logic;	///<
#extern	trigger1: out std_logic;	///<
#extern	trigger2: out std_logic;	///<
#extern	echo1: in std_logic;	///<
#extern	echo2: in std_logic;	///<
#machine	signal bcdInput: std_logic_vector(7 downto 0);	///<
#machine	signal bcdBusy: std_logic;	///<
#extern	slaveClk: in std_logic;	///<
#extern	cs: out std_logic;	///<
