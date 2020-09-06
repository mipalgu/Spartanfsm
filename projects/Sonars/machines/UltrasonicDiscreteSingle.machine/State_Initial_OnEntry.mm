distance <= (others => '0');
CLOCK_PERIOD <= '1' & x"4"; -- 20 ns (50MHz clock)
SCHEDULE_LENGTH <= "101" * CLOCK_PERIOD; -- 100 ns per ringlet
SPEED_OF_SOUND <= '1' & x"57"; -- 343 um/us (34300 cm/s)
SONAR_OFFSET <= "10" & x"8"; -- 40
MAX_DISTANCE <= "11" & x"D0900"; -- 4 000 000 um (400 cm)
MAX_TIME <= MAX_DISTANCE * "10" / SPEED_OF_SOUND * ("11" & x"E8"); -- ns
maxloops <= MAX_TIME / SCHEDULE_LENGTH;
RINGLETS_PER_MS <= x"F4240" / SCHEDULE_LENGTH;
RINGLETS_PER_S <= x"3E8" * RINGLETS_PER_MS;
LEDG <= (others => '1');
LEDG <= (others => '1');
lostState <= (others => '0');
