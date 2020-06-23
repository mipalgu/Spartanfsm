//
// SonarReader_Variables.h
//
// Automatically created through MiPalCASE -- do not change manually!
//
#machine	signal distance1: std_logic_vector(7 downto 0);	///<
#machine	signal distance2: std_logic_vector(7 downto 0);	///<
#machine	signal displayBusy: std_logic;	///<
#machine	signal digit: unsigned(3 downto 0);	///<
#machine	signal output: std_logic_vector(7 downto 0);	///<
#machine	signal bcdData: std_logic_vector(11 downto 0);	///<
#machine	signal distance1BCD: std_logic_vector(11 downto 0);	///<
#machine	signal distance2BCD: std_logic_vector(11 downto 0);	///<
#machine	signal sevSegInput: std_logic_vector(3 downto 0);	///<
#machine	signal digitSelect: unsigned(3 downto 0);	///<
#machine	signal sevSegBusy: std_logic;	///<
#machine	signal displayData: std_logic_vector(7 downto 0);	///<
#machine	signal displayDigit: std_logic_vector(3 downto 0);	///<
#machine	signal sevSegOutput: std_logic_vector(6 downto 0);	///<
#machine	signal dataToSend: std_logic_vector(7 downto 0);	///<
#extern	address: out std_logic_vector(3 downto 0);	///<
#extern	data: out std_logic_vector(7 downto 0);	///<
#extern	trigger1: out std_logic;	///<
#extern	trigger2: out std_logic;	///<
#extern	echo1: in std_logic;	///<
#extern	echo2: in std_logic;	///<
