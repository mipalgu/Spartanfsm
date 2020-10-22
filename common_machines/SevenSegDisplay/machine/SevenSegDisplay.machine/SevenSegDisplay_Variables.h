//
// SevenSegDisplay_Variables.h
//
// Automatically created through MiCASE -- do not change manually!
//
#param	N: positive;	///< The length of input variable number
#param	digits: positive;	///< The number of digits in the display
#extern	number: in std_logic_vector(N - 1 downto 0);	///< 
#extern	sevSegDigits: out std_logic_vector(7 * digits - 1 downto 0);	///< 
#machine	signal bcdSuspended: std_logic;	///< 
#machine	signal bcdOut: std_logic_vector(digits * 4 - 1 downto 0);	///< 
#machine	signal digitsSuspended: std_logic_vector(digits - 1 downto 0);	///< 
#machine	constant allSuspended: std_logic_vector(digits - 1 downto 0) := (others => '1');	///< 
#machine	signal digitsCommand: std_logic_vector(1 downto 0) := command_SUSPEND;	///< 
#machine	signal bcdCommand: std_logic_vector(1 downto 0) := command_SUSPEND;	///<
