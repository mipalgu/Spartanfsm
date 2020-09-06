distance <= (others => '1');
LEDR <= std_logic_vector(maxloops(33 downto 16));
LEDG <= std_logic_vector(maxloops(15 downto 7));--'0' & x"0" & lostState;
