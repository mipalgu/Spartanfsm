--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:56:25 06/24/2020
-- Design Name:   
-- Module Name:   /home/osboxes/src/Spartan_LLFSM/projects/Sonars/src/Sonars/TestMainClocking.vhd
-- Project Name:  Sonars
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Main
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
 
ENTITY TestMainClocking IS
END TestMainClocking;
 
ARCHITECTURE behavior OF TestMainClocking IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Main
    PORT(
         clk : IN  std_logic;
         dataLine0 : OUT  std_logic;
         cs0 : OUT  std_logic;
         trigger00 : OUT  std_logic;
         echo00 : IN  std_logic;
         trigger01 : OUT  std_logic;
         echo01 : IN  std_logic;
         dataLine1 : OUT  std_logic;
         cs1 : OUT  std_logic;
         trigger10 : OUT  std_logic;
         echo10 : IN  std_logic;
         trigger11 : OUT  std_logic;
         echo11 : IN  std_logic;
         slaveClk : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal echo00 : std_logic := '0';
   signal echo01 : std_logic := '0';
   signal echo10 : std_logic := '0';
   signal echo11 : std_logic := '0';

 	--Outputs
   signal dataLine0 : std_logic;
   signal cs0 : std_logic;
   signal trigger00 : std_logic;
   signal trigger01 : std_logic;
   signal dataLine1 : std_logic;
   signal cs1 : std_logic;
   signal trigger10 : std_logic;
   signal trigger11 : std_logic;
   signal slaveClk : std_logic;

   -- Clock period definitions
   constant clk_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Main PORT MAP (
          clk => clk,
          dataLine0 => dataLine0,
          cs0 => cs0,
          trigger00 => trigger00,
          echo00 => echo00,
          trigger01 => trigger01,
          echo01 => echo01,
          dataLine1 => dataLine1,
          cs1 => cs1,
          trigger10 => trigger10,
          echo10 => echo10,
          trigger11 => trigger11,
          echo11 => echo11,
          slaveClk => slaveClk
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;

END;
