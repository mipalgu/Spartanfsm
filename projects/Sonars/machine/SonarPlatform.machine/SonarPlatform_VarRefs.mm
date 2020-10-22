//
// SonarPlatform_VarRefs.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wunused-variable"
#pragma clang diagnostic ignored "-Wshadow"

SonarPlatform *_m = static_cast<SonarPlatform *>(_machine);

#extern	&distance: out std_logic_vector(15 downto 0) = _m->distance: out std_logic_vector(15 downto 0);	///< 
#param	&numberOfSensors: positive = _m->numberOfSensors: positive;	///< 
#extern	&triggers: out std_logic_vector(numberOfSensors - 1 downto 0) = _m->triggers: out std_logic_vector(numberOfSensors - 1 downto 0);	///< 
#extern	&echos: in std_logic_vector(numberOfSensors - 1 downto 0) = _m->echos: in std_logic_vector(numberOfSensors - 1 downto 0);	///< 
#machine	&signal smallestDistance: std_logic_vector(15 downto 0) = _m->signal smallestDistance: std_logic_vector(15 downto 0);	///< 
#machine	&constant allHigh: std_logic_vector(numberOfSensors - 1 downto 0) := (others => '1') = _m->constant allHigh: std_logic_vector(numberOfSensors - 1 downto 0) := (others => '1');	///< 
#machine	&signal sensorsSuspended: std_logic_vector(numberOfSensors - 1 downto 0) = _m->signal sensorsSuspended: std_logic_vector(numberOfSensors - 1 downto 0);	///< 
#machine	&signal sensorFusionSuspended: std_logic = _m->signal sensorFusionSuspended: std_logic;	///< 
#machine	&signal allOutputs: std_logic_vector(numberOfSensors * 16 - 1 downto 0) = _m->signal allOutputs: std_logic_vector(numberOfSensors * 16 - 1 downto 0);	///< 
#machine	&signal sensorCommand: std_logic_vector(1 downto 0) := COMMAND_NULL = _m->signal sensorCommand: std_logic_vector(1 downto 0) := COMMAND_NULL;	///< 
#machine	&signal sensorFusionCommand: std_logic_vector(1 downto 0) := COMMAND_NULL = _m->signal sensorFusionCommand: std_logic_vector(1 downto 0) := COMMAND_NULL;	///< 
#machine	&constant allLow: std_logic_vector(numberOfSensors - 1 downto 0) := (others => '0') = _m->constant allLow: std_logic_vector(numberOfSensors - 1 downto 0) := (others => '0');	///< 

#pragma clang diagnostic pop
