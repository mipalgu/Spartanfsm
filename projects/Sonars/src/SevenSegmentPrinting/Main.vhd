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
library UNISIM;
use UNISIM.VComponents.all;

entity Main is
	port (
		clk: in std_logic;
      dataLine: out std_logic;
		cs: out std_logic;
		slaveClk: out std_logic
	);
end Main;

architecture Behavioral of Main is

	signal slaveClkGen: std_logic;
	signal feedback: std_logic;
	signal locked: std_logic;
	
	component SevenSegmentTester is
		port (
			clk: in std_logic;
         EXTERNAL_dataLine: out std_logic;
         EXTERNAL_slaveClk: in std_logic;
         EXTERNAL_cs: out std_logic
		);
	end component;
	
	component ODDR2 is
		port(
			Q: out std_logic; -- 1-bit DDR output data
			C0: in std_logic; -- 1-bit clock input
			C1: in std_logic; -- 1-bit clock input
			CE: in std_logic; -- 1-bit clock enable input
			D0: in std_logic; -- 1-bit data input (associated with C1)
			D1: in std_logic; -- 1-bit data input (associated with C1)
			R: in std_logic; -- 1-bit reset input
			S: in std_logic -- 1-bit set input
		);
	end component;
	
begin

	sevSeg: SevenSegmentTester port map (
		clk,
		dataLine,
		slaveClkGen,
		cs
	);
	
	pll: PLL_BASE generic map (
		CLKFBOUT_MULT => 12,
		CLKIN_PERIOD => 20.0,
		CLKOUT0_DIVIDE => 60,
		CLKOUT0_PHASE => 0.0,
		CLK_FEEDBACK => "CLKFBOUT",
		DIVCLK_DIVIDE => 1
	) port map (
		CLKIN => clk,
		CLKFBIN => feedback,
		CLKFBOUT => feedback,
		LOCKED => locked,
		CLKOUT0 => slaveClkGen,
		CLKOUT1 => open,
		CLKOUT2 => open,
		CLKOUT3 => open,
		CLKOUT4 => open,
		CLKOUT5 => open,
		RST => '0'
	);
	
	clkBuff: ODDR2 port map (
		C0 => slaveClkGen,
		C1 => not slaveClkGen,
		Q => slaveClk,
		D1 => '0',
		D0 => '1',
		CE => '1',
		R => '0',
		S => '0'
	);

end Behavioral;

