tempBcd(exponent * 4 + 3 downto exponent * 4) <= to_unsigned(data, 4);
exponent <= exponent - 1;
