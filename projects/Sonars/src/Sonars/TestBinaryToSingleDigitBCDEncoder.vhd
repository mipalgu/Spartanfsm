--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   10:04:25 06/22/2020
-- Design Name:   
-- Module Name:   /home/osboxes/src/Spartan_LLFSM/projects/Sonars/src/Sonars/TestBinaryToSingleDigitBCDEncoder.vhd
-- Project Name:  Sonars
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: BinaryToSingleDigitBCDEncoder
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
 
ENTITY TestBinaryToSingleDigitBCDEncoder IS
END TestBinaryToSingleDigitBCDEncoder;
 
ARCHITECTURE behavior OF TestBinaryToSingleDigitBCDEncoder IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT BinaryToSingleDigitBCDEncoder
    PORT(
         clk : IN  std_logic;
         EXTERNAL_binary : IN  std_logic_vector(3 downto 0);
         EXTERNAL_bcd : OUT  std_logic_vector(3 downto 0);
         EXTERNAL_busy : OUT  std_logic;
         EXTERNAL_carry : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal EXTERNAL_binary : std_logic_vector(3 downto 0) := "1011";

 	--Outputs
   signal EXTERNAL_bcd : std_logic_vector(3 downto 0);
   signal EXTERNAL_busy : std_logic;
   signal EXTERNAL_carry : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: BinaryToSingleDigitBCDEncoder PORT MAP (
          clk => clk,
          EXTERNAL_binary => EXTERNAL_binary,
          EXTERNAL_bcd => EXTERNAL_bcd,
          EXTERNAL_busy => EXTERNAL_busy,
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


END;
