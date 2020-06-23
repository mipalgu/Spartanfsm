bitsShifted <= bitsShifted + 1;
binary <= latchedData(7);
latchedData <= latchedData(6 downto 0) & '0';
enable <= '1';
