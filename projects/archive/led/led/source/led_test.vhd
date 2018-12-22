library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity led_Test is
    Port ( clk32 : in  STD_LOGIC;
           leds : out  STD_LOGIC_VECTOR (7 downto 0));
end led_Test;

architecture Behavioral of led_Test is
   signal count : unsigned(29 downto 0) := (others => '0');
begin

process(clk32)
   begin
      if rising_edge(clk32) then
         count <= count+1;
         leds  <= STD_LOGIC_VECTOR(count(count'high downto count'high-7));      
      end if;
   end process;

end Behavioral;