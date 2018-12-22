if dc_bias = "00000" or data_word_disparity = 0 then
               -- dataword has no disparity
               if data_word(8) = '1' then
                  encoded <= "01" & data_word(7 downto 0);
                  dc_bias <= dc_bias + data_word_disparity;
               else
                  encoded <= "10" & data_word_inv(7 downto 0);
                  dc_bias <= dc_bias - data_word_disparity;
               end if;
elsif (dc_bias(3) = '0' and data_word_disparity(3) = '0') or 
                  (dc_bias(3) = '1' and data_word_disparity(3) = '1') then
               encoded <= '1' & data_word(8) & data_word_inv(7 downto 0);
               dc_bias <= dc_bias + data_word(8) - data_word_disparity;
else
               encoded <= '0' & data_word;
               dc_bias <= dc_bias - data_word_inv(8) + data_word_disparity;
end if;
