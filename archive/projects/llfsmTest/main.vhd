----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:41:21 03/17/2018 
-- Design Name: 
-- Module Name:    main - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity main is
	port(
		clk50: in std_logic;
		leds: inout std_logic_vector(7 downto 0);
		sw: in std_logic_vector(0 downto 0)
	);
end main;

architecture Behavioral of main is
--Set constant values for state bits
	constant highFourState: std_logic_vector(1 downto 0) := "01";
	constant lowFourState: std_logic_vector(1 downto 0) := "10";
	constant errorState: std_logic_vector(1 downto 0) := "11";
	
	constant onEntry: std_logic_vector(1 downto 0) := "00";
	
	--initial state bits: leds 7 -> 4 are logic high
	signal currentState: std_logic_vector(1 downto 0) := highFourState;
	
	signal status: std_logic_vector(1 downto 0) := "00";
	
	signal nextState: std_logic_vector(1 downto 0);
	
--COMPONENTS
	component highFour port(
		clk50: in std_logic;
		status: inout std_logic_vector(1 downto 0);
		currentState: inout std_logic_vector(1 downto 0);
		nextState: inout std_logic_vector(1 downto 0);
		leds: out std_logic_vector(7 downto 0);
		sw: in std_logic_vector(0 downto 0)
	);
	end component;
	
	component lowFour port(
		clk50: in std_logic;
		status: inout std_logic_vector(1 downto 0);
		currentState: inout std_logic_vector(1 downto 0);
		nextState: inout std_logic_vector(1 downto 0);
		leds: out std_logic_vector(7 downto 0);
		sw: in std_logic_vector(0 downto 0)
	);
	end component;
	
	component exitState port(
		clk50: in std_logic;
		status: inout std_logic_vector(1 downto 0);
		currentState: inout std_logic_vector(1 downto 0);
		nextState: inout std_logic_vector(1 downto 0);
		leds: out std_logic_vector(7 downto 0)
	);
	end component;

begin

hf: highFour port map(
	clk50 => clk50,
	status => status,
	nextState => nextState,
	currentState => currentState,
	leds => leds,
	sw => sw
);

lw: lowFour port map(
	clk50 => clk50,
	status => status,
	nextState => nextState,
	currentState => currentState,
	leds => leds,
	sw => sw
);

err: exitState port map(
	clk50 => clk50,
	status => status,
	nextState => nextState,
	currentState => currentState,
	leds => leds
);

process (clk50)
begin
if (falling_edge(clk50)) then
	case currentState is
		when highFourState =>
			null;
		when lowFourState =>
			null;
		when errorState =>
			null;
		when others =>
			--Invalid States default to the errorState
			currentState <= errorState;
			status <= onEntry;
	end case;
end if;
end process;

end Behavioral;

