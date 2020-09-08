distance <= (others => '0');
MAX_TIME <= ((MAX_DISTANCE * x"2") / SPEED_OF_SOUND) *x"3E8"; -- ns
maxloops <= MAX_TIME / SCHEDULE_LENGTH;
RINGLETS_PER_MS <= x"F4240" / SCHEDULE_LENGTH;
RINGLETS_PER_S <= x"3E8" * RINGLETS_PER_MS;
LEDG <= (others => '1');
lostState <= (others => '0');
