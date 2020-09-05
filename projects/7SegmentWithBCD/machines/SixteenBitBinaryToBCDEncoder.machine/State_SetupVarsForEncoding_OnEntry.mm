bitsShifted <= bitsShifted + 1;
binary <= latchedData(15);
latchedData <= latchedData(14 downto 0) & '0';
enable <= '1';
