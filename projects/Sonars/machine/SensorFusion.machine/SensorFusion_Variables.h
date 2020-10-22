//
// SensorFusion_Variables.h
//
// Automatically created through MiCASE -- do not change manually!
//
#extern	smallestOutput: out std_logic_vector(sensorOutputSize - 1 downto 0);	///< 
#param	numberOfSensors: positive;	///< 
#param	sensorOutputSize: positive;	///< 
#extern	sensorOutputs: in std_logic_vector(numberOfSensors * sensorOutputSize - 1 downto 0);	///< 
#machine	shared variable currentSensor: integer range 0 to numberOfSensors := 0;	///< 
#machine	shared variable singleOutput: Integer range minValue to maxValue := maxValue;	///< 
#param	signedOutput: boolean;	///< 
#machine	shared variable currentOutput: Integer range minValue to maxValue;	///< 
#param	maxValue: Integer;	///< 
#param	minValue: Integer;	///<
