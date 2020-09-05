--DigitFlipper.vhd
--
--This is a generated file - DO NOT ALTER.
--Please use an LLFSM editor to change this file.
--Date Generated: 2020-09-05 23:19 AEST
--

library IEEE;
use IEEE.std_logic_1164.All;
use ieee.numeric_std.all;

entity DigitFlipper is
    port (
        clk: in std_logic;
        EXTERNAL_count: out std_logic_vector(3 downto 0);
        EXTERNAL_increaseButton: in std_logic;
        EXTERNAL_decreaseButton: in std_logic
    );
end DigitFlipper;

architecture LLFSM of DigitFlipper is
    --Internal State Representation Bits
    constant OnEntry: std_logic_vector(2 downto 0) := "000";
    constant CheckTransition: std_logic_vector(2 downto 0) := "001";
    constant OnExit: std_logic_vector(2 downto 0) := "010";
    constant Internal: std_logic_vector(2 downto 0) := "011";
    constant ReadSnapshot: std_logic_vector(2 downto 0) := "100";
    constant WriteSnapshot: std_logic_vector(2 downto 0) := "101";
    constant NoOnEntry: std_logic_vector(2 downto 0) := "110";
    signal internalState: std_logic_vector(2 downto 0) := ReadSnapshot;
    --State Representation Bits
    constant STATE_Initial: std_logic_vector(3 downto 0) := "0000";
    constant STATE_SUSPENDED: std_logic_vector(3 downto 0) := "0001";
    constant STATE_InitialPseudoState: std_logic_vector(3 downto 0) := "0010";
    constant STATE_Check: std_logic_vector(3 downto 0) := "0011";
    constant STATE_ResetCount: std_logic_vector(3 downto 0) := "0100";
    constant STATE_CheckIncrease: std_logic_vector(3 downto 0) := "0101";
    constant STATE_IncrementCount: std_logic_vector(3 downto 0) := "0110";
    constant STATE_CheckDecrease: std_logic_vector(3 downto 0) := "0111";
    constant STATE_MaxCount: std_logic_vector(3 downto 0) := "1000";
    constant STATE_DecrementCount: std_logic_vector(3 downto 0) := "1001";
    signal currentState: std_logic_vector(3 downto 0) := STATE_Initial;
    signal targetState: std_logic_vector(3 downto 0) := currentState;
    signal previousRinglet: std_logic_vector(3 downto 0) := STATE_Initial xor "1111";
    --Snapshot of External Variables
    signal count: std_logic_vector(3 downto 0);
    signal increaseButton: std_logic;
    signal decreaseButton: std_logic;
    --Machine Variables
begin
process (clk)
    begin
        if (rising_edge(clk)) then
            case internalState is
                when ReadSnapshot =>
                    increaseButton <= EXTERNAL_increaseButton;
                    decreaseButton <= EXTERNAL_decreaseButton;
                    if (previousRinglet = currentState) then
                        internalState <= NoOnEntry;
                    else
                        internalState <= OnEntry;
                    end if;
                when OnEntry =>
                    case currentState is
                        when STATE_Initial =>
                            count <= x"0";
                        when STATE_ResetCount =>
                            count <= (others => '0');
                        when STATE_IncrementCount =>
                            count <= std_logic_vector(unsigned(count) + 1);
                        when STATE_MaxCount =>
                            count <= x"F";
                        when STATE_DecrementCount =>
                            count <= std_logic_vector(unsigned(count) - 1);
                        when others =>
                            null;
                    end case;
                    internalState <= CheckTransition;
                when CheckTransition =>
                    case currentState is
                        when STATE_Initial =>
                            if (true) then
                                targetState <= STATE_Check;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_SUSPENDED =>
                            internalState <= Internal;
                        when STATE_InitialPseudoState =>
                            if (true) then
                                targetState <= STATE_Initial;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_Check =>
                            if (increaseButton = '1') then
                                targetState <= STATE_CheckIncrease;
                                internalState <= OnExit;
                            elsif (decreaseButton = '1') and (not (increaseButton = '1')) then
                                targetState <= STATE_CheckDecrease;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_ResetCount =>
                            if (increaseButton = '0') then
                                targetState <= STATE_Check;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_CheckIncrease =>
                            if (count = x"F") then
                                targetState <= STATE_ResetCount;
                                internalState <= OnExit;
                            elsif (true) and (not (count = x"F")) then
                                targetState <= STATE_IncrementCount;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_IncrementCount =>
                            if (increaseButton = '0') then
                                targetState <= STATE_Check;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_CheckDecrease =>
                            if (count = x"0") then
                                targetState <= STATE_MaxCount;
                                internalState <= OnExit;
                            elsif (true) and (not (count = x"0")) then
                                targetState <= STATE_DecrementCount;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_MaxCount =>
                            if (decreaseButton = '0') then
                                targetState <= STATE_Check;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_DecrementCount =>
                            if (decreaseButton = '0') then
                                targetState <= STATE_Check;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when others =>
                            null;
                    end case;
                when Internal =>
                    case currentState is
                        when others =>
                            null;
                    end case;
                    internalState <= WriteSnapshot;
                when OnExit =>
                    case currentState is
                        when others =>
                            null;
                    end case;
                    internalState <= WriteSnapshot;
                when NoOnEntry =>
                    internalState <= CheckTransition;
                when WriteSnapshot =>
                    EXTERNAL_count <= count;
                    internalState <= ReadSnapshot;
                    previousRinglet <= currentState;
                    currentState <= targetState;
                when others =>
                    null;
            end case;
        end if;
    end process;
end LLFSM;