//
// SensorFusion_VarRefs.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wunused-variable"
#pragma clang diagnostic ignored "-Wshadow"

SensorFusion *_m = static_cast<SensorFusion *>(_machine);

#extern	&smallestOutput: out std_logic_vector(sensorOutputSize - 1 downto 0) = _m->smallestOutput: out std_logic_vector(sensorOutputSize - 1 downto 0);	///< 
#param	&numberOfSensors: positive = _m->numberOfSensors: positive;	///< 
#param	&sensorOutputSize: positive = _m->sensorOutputSize: positive;	///< 
#extern	&sensorOutputs: in std_logic_vector(numberOfSensors * sensorOutputSize - 1 downto 0) = _m->sensorOutputs: in std_logic_vector(numberOfSensors * sensorOutputSize - 1 downto 0);	///< 
#machine	&shared variable currentSensor: integer range 0 to numberOfSensors := 0 = _m->shared variable currentSensor: integer range 0 to numberOfSensors := 0;	///< 
#machine	&shared variable singleOutput: Integer range minValue to maxValue := maxValue = _m->shared variable singleOutput: Integer range minValue to maxValue := maxValue;	///< 
#param	&signedOutput: boolean = _m->signedOutput: boolean;	///< 
#machine	&shared variable currentOutput: Integer range minValue to maxValue = _m->shared variable currentOutput: Integer range minValue to maxValue;	///< 
#param	&maxValue: Integer = _m->maxValue: Integer;	///< 
#param	&minValue: Integer = _m->minValue: Integer;	///< 

#pragma clang diagnostic pop
