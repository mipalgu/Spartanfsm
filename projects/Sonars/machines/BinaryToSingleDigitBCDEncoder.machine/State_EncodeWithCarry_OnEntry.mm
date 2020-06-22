bcd(0) <= oldBinary(3 - to_integer(bitsShifted));
bcd(1) <= not oldBcd(0);
bcd(2) <= not (oldBcd(1) xor oldBcd(0));
bcd(3) <= oldBcd(3) and oldBcd(0);
