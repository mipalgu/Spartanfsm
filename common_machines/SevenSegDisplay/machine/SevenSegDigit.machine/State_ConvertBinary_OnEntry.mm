case bcd is
	when x"0" => output <="1000000";
	when x"1" => output <= "1111001";
	when x"2" => output <= "0100100";
	when x"3" => output <= "0110000";
	when x"4" => output <= "0011001";
	when x"5" => output <= "0010010";
	when x"6" => output <= "0000010";
	when x"7" => output <= "1111000";
	when x"8" => output <= "0000000";
	when x"9" => output <= "0011000";
	when x"A" => output <= "0001000";
	when x"B" => output <= "0000011";
	when x"C" => output <= "1000110";
	when x"D" => output <= "0100001";
	when x"E" => output <= "0000110";
	when others => output <= "0001110";
end case;
