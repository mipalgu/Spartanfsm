--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   23:37:00 06/22/2020
-- Design Name:   
-- Module Name:   /home/osboxes/src/Spartan_LLFSM/projects/Sonars/src/Sonars/TestSingleDigitBCDWithShifting.vhd
-- Project Name:  Sonars
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: SingleDigitBCDEncoderWithShifting
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
 
ENTITY TestSingleDigitBCDWithShifting IS
END TestSingleDigitBCDWithShifting;
 
ARCHITECTURE behavior OF TestSingleDigitBCDWithShifting IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT SingleDigitBCDEncoderWithShifting
    PORT(
         clk : IN  std_logic;
         EXTERNAL_binary : IN  std_logic;
         EXTERNAL_enable : IN  std_logic;
         EXTERNAL_busy : OUT  std_logic;
         EXTERNAL_bcd : OUT  std_logic_vector(3 downto 0);
         EXTERNAL_reset : IN  std_logic;
         EXTERNAL_carry : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal EXTERNAL_binary : std_logic := '0';
   signal EXTERNAL_enable : std_logic := '0';
   signal EXTERNAL_reset : std_logic := '1';

 	--Outputs
   signal EXTERNAL_busy : std_logic;
   signal EXTERNAL_bcd : std_logic_vector(3 downto 0);
   signal EXTERNAL_carry : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: SingleDigitBCDEncoderWithShifting PORT MAP (
          clk => clk,
          EXTERNAL_binary => EXTERNAL_binary,
          EXTERNAL_enable => EXTERNAL_enable,
          EXTERNAL_busy => EXTERNAL_busy,
          EXTERNAL_bcd => EXTERNAL_bcd,
          EXTERNAL_reset => EXTERNAL_reset,
          EXTERNAL_carry => EXTERNAL_carry
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
		EXTERNAL_binary <= '1';
		EXTERNAL_enable <= '1';
		
		wait until EXTERNAL_busy = '1';
		EXTERNAL_enable <= '0';
		
		wait until EXTERNAL_busy = '0';
		EXTERNAL_binary <= '0';
		EXTERNAL_enable <= '1';
		
		wait until EXTERNAL_busy = '1';
		EXTERNAL_enable <= '0';
		
		wait until EXTERNAL_busy = '0';
		EXTERNAL_binary <= '1';
		EXTERNAL_enable <= '1';
		
		wait until EXTERNAL_busy = '1';
		EXTERNAL_enable <= '0';
		
		wait until EXTERNAL_busy = '0';
		EXTERNAL_binary <= '0';
		EXTERNAL_enable <= '1';
		
		wait until EXTERNAL_busy = '1';
		EXTERNAL_enable <= '0';
		
      -- insert stimulus here 

      wait;
   end process;

END;
