ones <= "0000" + data(0) + data(1) + data(2) + data(3) + data(4) + data(5) + data(6) + data(7);
xored(0) <= data(0);
   xored(1) <= data(1) xor xored(0);
   xored(2) <= data(2) xor xored(1);
   xored(3) <= data(3) xor xored(2);
   xored(4) <= data(4) xor xored(3);
   xored(5) <= data(5) xor xored(4);
   xored(6) <= data(6) xor xored(5);
   xored(7) <= data(7) xor xored(6);
   xored(8) <= '1';

   xnored(0) <= data(0);
   xnored(1) <= data(1) xnor xnored(0);
   xnored(2) <= data(2) xnor xnored(1);
   xnored(3) <= data(3) xnor xnored(2);
   xnored(4) <= data(4) xnor xnored(3);
   xnored(5) <= data(5) xnor xnored(4);
   xnored(6) <= data(6) xnor xnored(5);
   xnored(7) <= data(7) xnor xnored(6);
   xnored(8) <= '0';
data_word_disparity  <= "1100" + data_word(0) + data_word(1) + data_word(2) + data_word(3) 
                                    + data_word(4) + data_word(5) + data_word(6) + data_word(7);
