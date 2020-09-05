library ieee;
use ieee.std_logic_1164.all;

entity delayedLatch is
	port (
		data: in std_logic_vector(19 downto 0);
		output: out std_logic_vector(19 downto 0)
	);
end delayedLatch;

architecture Behavioural of delayedLatch is

begin

	output <= data after 100 ms;

end Behavioural;