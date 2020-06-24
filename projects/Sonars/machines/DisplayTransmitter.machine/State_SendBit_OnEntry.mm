dataLine <= dataToSend(15);
dataToSend <= dataToSend(14 downto 0) & "0";
bitsShifted <= bitsShifted + 1;
cs <= '0';
