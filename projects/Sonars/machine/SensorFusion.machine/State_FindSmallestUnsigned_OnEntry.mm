singleOutput <= minimum(
	to_integer(unsigned(sensorOutputs(currentSensor * (sensorOutputSize + 1) - 1 downto currentSensor * sensorOutputSize))),
	to_integer(unsigned(singleOutput))
);
