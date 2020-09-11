singleOutput := minimum(
	to_integer(signed(sensorOutputs(currentSensor * (sensorOutputSize + 1) - 1 downto currentSensor * sensorOutputSize)))),
	to_integer(signed(singleOutput))
);
