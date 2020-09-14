//
// SonarPlatform_VarRefs.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wunused-variable"
#pragma clang diagnostic ignored "-Wshadow"

SonarPlatform *_m = static_cast<SonarPlatform *>(_machine);

#extern	&distance: out std_logic_vector(15 downto 0) = _m->distance: out std_logic_vector(15 downto 0);	///<
#param	&numberOfSensors: positive = _m->numberOfSensors: positive;	///<
#extern	&triggers: out std_logic_vector(numberOfSensors - 1 downto 0) = _m->triggers: out std_logic_vector(numberOfSensors - 1 downto 0);	///<
#extern	&echos: inout std_logic_vector(numberOfSensors - 1 downto 0) = _m->echos: inout std_logic_vector(numberOfSensors - 1 downto 0);	///<
#machine	&signal smallestDistance: std_logic_vector(15 downto 0) = _m->signal smallestDistance: std_logic_vector(15 downto 0);	///<
#machine	&constant allSuspended: std_logic_vector(numberOfSensors - 1 downto 0) := (others => '1') = _m->constant allSuspended: std_logic_vector(numberOfSensors - 1 downto 0) := (others => '1');	///<
#machine	&signal sensorSuspend: std_logic = _m->signal sensorSuspend: std_logic;	///<
#machine	&signal sensorFusionSuspended: std_logic = _m->signal sensorFusionSuspended: std_logic;	///<
#machine	&signal allOutputs: std_logic_vector(numberOfSensors * sensorOutputSize - 1 downto 0) = _m->signal allOutputs: std_logic_vector(numberOfSensors * sensorOutputSize - 1 downto 0);	///<
#machine	&signal sensorCommand: std_logic_vector(1 downto 0) := COMMAND_NULL = _m->signal sensorCommand: std_logic_vector(1 downto 0) := COMMAND_NULL;	///<
#machine	&signal sensorFusionCommand: std_logic_vector(1 downto 0) := COMMAND_NULL = _m->signal sensorFusionCommand: std_logic_vector(1 downto 0) := COMMAND_NULL;	///<

#pragma clang diagnostic pop
