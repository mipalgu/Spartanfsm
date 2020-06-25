--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:10:39 06/24/2020
-- Design Name:   
-- Module Name:   /home/osboxes/src/Spartan_LLFSM/projects/Sonars/src/Sonars/TestUltrasonicSensor.vhd
-- Project Name:  Sonars
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: UltrasonicDistanceSensor
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
use IEEE.numeric_std.all;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY TestUltrasonicSensor IS
END TestUltrasonicSensor;
 
ARCHITECTURE behavior OF TestUltrasonicSensor IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT UltrasonicDistanceSensor
    PORT(
         clk : IN  std_logic;
         EXTERNAL_echo : IN  std_logic;
         EXTERNAL_trigger : OUT  std_logic;
         EXTERNAL_distance : OUT  unsigned(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal EXTERNAL_echo : std_logic := '0';

 	--Outputs
   signal EXTERNAL_trigger : std_logic;
   signal EXTERNAL_distance : unsigned(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: UltrasonicDistanceSensor PORT MAP (
          clk => clk,
          EXTERNAL_echo => EXTERNAL_echo,
          EXTERNAL_trigger => EXTERNAL_trigger,
          EXTERNAL_distance => EXTERNAL_distance
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
      wait for 100 ns;	

      wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
