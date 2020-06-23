----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    07:34:40 06/23/2020 
-- Design Name: 
-- Module Name:    Main - Behavioral 
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

entity Main is
	port (
		clk: in std_logic;
      PORTA: out std_logic_vector(11 downto 0);
		PORTB: out std_logic_vector(11 downto 0);
		PORTC: out std_logic_vector(7 downto 0);
		PORTE: in std_logic_vector(3 downto 0)
	);
end Main;

architecture Behavioral of Main is
	
	component SonarReader is
		port(
			clk: in std_logic;
         EXTERNAL_address: out std_logic_vector(3 downto 0);
         EXTERNAL_data: out std_logic_vector(7 downto 0);
         EXTERNAL_trigger1: out std_logic;
         EXTERNAL_trigger2: out std_logic;
         EXTERNAL_echo1: in std_logic;
         EXTERNAL_echo2: in std_logic;
         EXTERNAL_echoReset1: out std_logic;
         EXTERNAL_echoReset2: out std_logic
		);
	end component;
	
begin

	sonar1_2: SonarReader port map (
		clk,
		PORTA(11 downto 8),
		PORTA(7 downto 0),
		PORTC(7),
		PORTC(6),
		PORTE(1),
		PORTE(0),
		PORTC(5),
		PORTC(4)
	);
	
	sonar3_4: SonarReader port map (
		clk,
		PORTB(11 downto 8),
		PORTB(7 downto 0),
		PORTC(3),
		PORTC(2),
		PORTE(3),
		PORTE(2),
		PORTC(1),
		PORTC(0)
	);

end Behavioral;

