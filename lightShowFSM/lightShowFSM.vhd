----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:20:14 03/14/2018 
-- Design Name: 
-- Module Name:    lightShowFSM - Behavioral 
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

entity lightShowFSM is
	port(
		clk50: in std_logic; --clock
		sw: in std_logic_vector(0 downto 0); --dip switch 1
		leds: inout std_logic_vector(7 downto 0) --LEDS
	);
end lightShowFSM;

architecture Behavioral of lightShowFSM is
	--Set constant values for status bits
	constant onEntry: std_logic_vector(1 downto 0) := "00";
	constant checkTransition: std_logic_vector(1 downto 0) := "01";
	constant onExit: std_logic_vector(1 downto 0) := "10";
	constant internal: std_logic_vector(1 downto 0) := "11";
	
	--initial status
	signal status: std_logic_vector(1 downto 0) := onEntry;
	
	--Set constant values for state bits
	constant highFour: std_logic_vector(1 downto 0) := "01";
	constant lowFour: std_logic_vector(1 downto 0) := "10";
	constant exitState: std_logic_vector(1 downto 0) := "11";
	
	--initial state bits: leds 7 -> 4 are logic high
	signal currentState: std_logic_vector(1 downto 0) := highFour;
	
	--Set constant values for switch bit
	constant swON: std_logic_vector(0 downto 0) := "1";
	constant swOFF: std_logic_vector(0 downto 0) := "0";
	
	--Constant LED Values for states
	constant ledsError: std_logic_vector(7 downto 0) := "10101010";
	constant ledsHighFour: std_logic_vector(7 downto 0) := "11110000";
	constant ledsLowFour: std_logic_vector(7 downto 0) := "00001111";
	
	--initial next state
	signal nextState: std_logic_vector(1 downto 0);
begin

process (clk50)

	begin
		
		if (rising_edge(clk50)) then
			case currentState is
				when highFour =>
					--Define highFour State with rising edge
					case status is
						when onEntry =>
							--do nothing in onEntry then transition to checkTransition substate
							status <= checkTransition;
						when internal =>
							--set LEDS then transition to checkTransition substate
							if (leds /= ledsHighFour) then
								leds <= ledsHighFour;
							end if;
							status <= checkTransition;
						when onExit =>
							--set to new state then transition to new LLFSM
							currentState <= nextState;
							status <= onEntry;
						when others =>
							--Redundent Case throws errors if removed
							null;
					end case;
				when lowFour =>
					--Define lowFour state with rising edge
					case status is
						when onEntry =>
							--do nothing then transition to checkTransition ssubstate
							status <= checkTransition;
						when internal =>
							--Set LEDS then transition to checkTransition substate
							if (leds /= ledsLowFour) then
								leds <= ledsLowFour;
							end if;
							status <= checkTransition;
						when onExit =>
							--Transition to new LLFSM
							currentState <= nextState;
							status <= onEntry;
						when others =>
							--Redundent Case
							null;
					end case;
				when exitState =>
					--Define exitState with rising edge
					case status is
						when onEntry =>
							--Do nothing then transition to checkTransition substate.
							status <= checkTransition;
						when internal =>
							--set LEDS then transition to checkTransition substate.
							if (leds /= ledsError) then
								leds <= ledsError;
							end if;
							status <= checkTransition;
						when onExit =>
							--Transition to new LLFSM
							currentState <= nextState;
							status <= onEntry;
						when others =>
							--Redundent Case
							null;
					end case;
				when others =>
					--Invalid States default to the exitState
					currentState <= exitState;
					status <= onEntry;
			end case;
		end if;
		if (falling_edge(clk50)) then
			case currentState is
				when highFour =>
					--Define highFour state with falling edge
					case status is
						when checkTransition =>
							--Check transition conditions
							case sw is
								when swON =>
								--If dip switch is on then set target to lowFour LLFSM and transition to onExit substate
									nextState <= lowFour;
									status <= onExit;
								when swOFF =>
								--if dip switch is off then transition to internal substate
									status <= internal;
								when others =>
								--Redundent Case
									null;
							end case;
						when others =>
							--Redundent Case
							null;
					end case;
				when lowFour =>
					--Define lowFour state with falling edge
					case status is
						when checkTransition =>
							--Check transition conditions
							case sw is
								when swOFF =>
								--if dip switch is off then set target to highFour LLFSM and transition to onExit substate.
									nextState <= highFour;
									status <= onExit;
								when swON =>
								--if dip switch is on then transition to internal substate
									status <= internal;
								when others =>
								--Redundent Case
									null;
							end case;
						when others =>
						--Redundent Case
							null;
					end case;
				when exitState =>
					--Define exitState with falling edge
					case status is
						when checkTransition =>
							--exitState resets the program by setting the target to the highFour LLFSM then transitioning to onExit substate.
							nextState <= highFour;
							status <= onExit;
						when others =>
							--Redundent Case
							null;
					end case;
				when others =>
					--Invalid States default to the exitState
					currentState <= exitState;
					status <= onEntry;
			end case;
		end if;
							
	end process;

end Behavioral;

