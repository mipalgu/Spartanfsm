distance <= (others => '0');
MAX_TIME <= ((MAX_DISTANCE * x"2") / SPEED_OF_SOUND) *x"3E8"; -- ns
RINGLETS_PER_MS <= x"F4240" / SCHEDULE_LENGTH;
LEDG <= (others => '1');
lostState <= (others => '0');
