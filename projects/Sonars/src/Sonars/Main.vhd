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
      dataLine0: out std_logic;
		cs0: out std_logic;
		trigger00: out std_logic;
		echo00: in std_logic;
		trigger01: out std_logic;
		echo01: in std_logic;
		dataLine1: out std_logic;
		cs1: out std_logic;
		trigger10: out std_logic;
		echo10: in std_logic;
		trigger11: out std_logic;
		echo11: in std_logic;
		slaveClk: out std_logic
	);
end Main;

architecture Behavioral of Main is

	signal slaveClkGen: std_logic;
	
	component SonarReader is
		port(
			clk: in std_logic;
         EXTERNAL_dataLine: out std_logic;
         EXTERNAL_trigger1: out std_logic;
         EXTERNAL_trigger2: out std_logic;
         EXTERNAL_echo1: in std_logic;
         EXTERNAL_echo2: in std_logic;
         EXTERNAL_slaveClk: in std_logic;
         EXTERNAL_cs: out std_logic
		);
	end component;
	
begin

	sonar0_1: SonarReader port map (
		clk,
		dataLine0,
		trigger00,
		trigger01,
		echo00,
		echo01,
		slaveClkGen,
		cs0
	);
	
	sonar2_3: SonarReader port map (
		clk,
		dataLine1,
		trigger10,
		trigger11,
		echo10,
		echo11,
		slaveClkGen,
		cs1
	);
	
	process(slaveClkGen)
	begin
		slaveClk <= slaveClkGen;
	end process;

end Behavioral;

