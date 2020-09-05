--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   01:11:15 06/23/2020
-- Design Name:   
-- Module Name:   /home/osboxes/src/Spartan_LLFSM/projects/Sonars/src/Sonars/TestEightBitBCDEncoder.vhd
-- Project Name:  Sonars
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: EightBitBinaryToBCDEncoder
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
 
ENTITY TestEightBitBCDEncoder IS
END TestEightBitBCDEncoder;
 
ARCHITECTURE behavior OF TestEightBitBCDEncoder IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT EightBitBinaryToBCDEncoder
    PORT(
         clk : IN  std_logic;
         EXTERNAL_data : IN  std_logic_vector(7 downto 0);
         EXTERNAL_busy : OUT  std_logic;
         EXTERNAL_bcd : OUT  std_logic_vector(11 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal EXTERNAL_data : std_logic_vector(7 downto 0) := x"C5";

 	--Outputs
   signal EXTERNAL_busy : std_logic;
   signal EXTERNAL_bcd : std_logic_vector(11 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: EightBitBinaryToBCDEncoder PORT MAP (
          clk => clk,
          EXTERNAL_data => EXTERNAL_data,
          EXTERNAL_busy => EXTERNAL_busy,
          EXTERNAL_bcd => EXTERNAL_bcd
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
		
		wait until EXTERNAL_busy = '1';
		
		wait until EXTERNAL_busy = '0';

      -- insert stimulus here 

      wait;
   end process;

END;
