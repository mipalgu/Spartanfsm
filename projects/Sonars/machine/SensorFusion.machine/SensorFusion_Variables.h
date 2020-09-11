//
// SensorFusion_Variables.h
//
// Automatically created through MiPalCASE -- do not change manually!
//
#extern	smallestOutput: out std_logic_vector(sensorOutputSize - 1 downto 0);	///<
#param	numberOfSensors: positive;	///<
#param	sensorOutputSize: positive;	///<
#extern	sensorOutputs: in std_logic_vector(numberOfSensors * sensorOutputSize - 1 downto 0);	///<
#machine	shared variable currentSensor: integer range 0 to numberOfSensors := 0;	///<
#machine	signal singleOutput: std_logic_vector(sensorOutputSize - 1 downto 0);	///<
#param	signedOutput: boolean;	///<
