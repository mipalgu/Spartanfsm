distance <= x"FFFF";
CLOCK_PERIOD <= x"14"; -- 20 ns (50MHz clock)
SCHEDULE_LENGTH <= x"5" * CLOCK_PERIOD; -- 100 ns per ringlet
SPEED_OF_SOUND <= x"157"; -- 343 um/us (34300 cm/s)
SONAR_OFFSET <= x"28"; -- 40
MAX_DISTANCE <= x"3D0900"; -- 4 000 000 um (400 cm)
MAX_TIME <= MAX_DISTANCE * x"2" / SPEED_OF_SOUND * x"3E8"; -- ns
maxloops <= resize((MAX_TIME / SCHEDULE_LENGTH), 24);
RINGLETS_PER_MS <= resize(x"F4240" / (x"0" & SCHEDULE_LENGTH), 16);

