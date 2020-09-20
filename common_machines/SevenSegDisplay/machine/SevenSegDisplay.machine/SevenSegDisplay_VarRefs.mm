//
// SevenSegDisplay_VarRefs.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wunused-variable"
#pragma clang diagnostic ignored "-Wshadow"

SevenSegDisplay *_m = static_cast<SevenSegDisplay *>(_machine);

#param	&N: positive = _m->N: positive;	///<The length of input variable number
#param	&digits: positive = _m->digits: positive;	///<The number of digits in the display
#extern	&number: in std_logic_vector(N - 1 downto 0) = _m->number: in std_logic_vector(N - 1 downto 0);	///<
#extern	&sevSegDigits: out std_logic_vector(7 * digits - 1 downto 0) = _m->sevSegDigits: out std_logic_vector(7 * digits - 1 downto 0);	///<
#machine	&signal bcdSuspended: std_logic = _m->signal bcdSuspended: std_logic;	///<
#machine	&signal bcdOut: std_logic_vector(digits * 4 - 1 downto 0) = _m->signal bcdOut: std_logic_vector(digits * 4 - 1 downto 0);	///<
#machine	&signal digitsSuspended: std_logic_vector(digits - 1 downto 0) = _m->signal digitsSuspended: std_logic_vector(digits - 1 downto 0);	///<
#machine	&constant allSuspended: std_logic_vector(digits - 1 downto 0) := (others => '1') = _m->constant allSuspended: std_logic_vector(digits - 1 downto 0) := (others => '1');	///<
#machine	&signal digitsCommand: std_logic_vector(1 downto 0) := command_SUSPEND = _m->signal digitsCommand: std_logic_vector(1 downto 0) := command_SUSPEND;	///<
#machine	&signal bcdCommand: std_logic_vector(1 downto 0) := command_SUSPEND = _m->signal bcdCommand: std_logic_vector(1 downto 0) := command_SUSPEND;	///<

#pragma clang diagnostic pop
