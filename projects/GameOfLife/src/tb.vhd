--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   02:59:42 08/02/2018
-- Design Name:   
-- Module Name:   /home/morgan/src/fpga/projects/CellularAutomata/tb.vhd
-- Project Name:  CellularAutomata
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: CellularAutomaton
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb IS
END tb;
 
ARCHITECTURE behavior OF tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT CellularAutomaton
    PORT(
         clk : IN  std_logic;
         EXTERNAL_north : IN  std_logic;
         EXTERNAL_east : IN  std_logic;
         EXTERNAL_south : IN  std_logic;
         EXTERNAL_west : IN  std_logic;
         EXTERNAL_statusOut : OUT  std_logic;
         EXTERNAL_statusIn : IN  std_logic;
         EXTERNAL_northEast : IN  std_logic;
         EXTERNAL_southEast : IN  std_logic;
         EXTERNAL_southWest : IN  std_logic;
         EXTERNAL_northWest : IN  std_logic;
         EXTERNAL_defaultStatus : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal EXTERNAL_north : std_logic := '0';
   signal EXTERNAL_east : std_logic := '0';
   signal EXTERNAL_south : std_logic := '0';
   signal EXTERNAL_west : std_logic := '0';
   signal EXTERNAL_northEast : std_logic := '1';
   signal EXTERNAL_southEast : std_logic := '0';
   signal EXTERNAL_southWest : std_logic := '0';
   signal EXTERNAL_northWest : std_logic := '0';
   signal EXTERNAL_defaultStatus : std_logic := '1';

 	--Outputs
   signal EXTERNAL_statusOut : std_logic;

   -- Clock period definitions
   constant clk_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: CellularAutomaton PORT MAP (
          clk => clk,
          EXTERNAL_north => EXTERNAL_north,
          EXTERNAL_east => EXTERNAL_east,
          EXTERNAL_south => EXTERNAL_south,
          EXTERNAL_west => EXTERNAL_west,
          EXTERNAL_statusOut => EXTERNAL_statusOut,
          EXTERNAL_statusIn => EXTERNAL_statusOut,
          EXTERNAL_northEast => EXTERNAL_northEast,
          EXTERNAL_southEast => EXTERNAL_southEast,
          EXTERNAL_southWest => EXTERNAL_southWest,
          EXTERNAL_northWest => EXTERNAL_northWest,
          EXTERNAL_defaultStatus => EXTERNAL_defaultStatus
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin
      -- hold reset state for 100 ns.

      -- insert stimulus here 

      wait;
   end process;

END;
