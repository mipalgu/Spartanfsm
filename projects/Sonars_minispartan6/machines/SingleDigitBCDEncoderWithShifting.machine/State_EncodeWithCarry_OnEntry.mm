bcd(0) <= latchedBinary;
bcd(1) <= not bcd(0);
bcd(2) <= not (bcd(1) xor bcd(0));
bcd(3) <= bcd(3) and bcd(0);
