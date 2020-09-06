--UltrasonicDiscreteSingle.vhd
--
--This is a generated file - DO NOT ALTER.
--Please use an LLFSM editor to change this file.
--Date Generated: 2020-09-06 17:23 AEST
--

library IEEE;
use IEEE.std_logic_1164.All;
use IEEE.numeric_std.all;

entity UltrasonicDiscreteSingle is
    port (
        clk: in std_logic;
        EXTERNAL_triggerPin: out std_logic;
        EXTERNAL_echoIn: in std_logic;
        EXTERNAL_distance: out std_logic_vector(15 downto 0);
        EXTERNAL_LEDG: out std_logic_vector(8 downto 0);
        EXTERNAL_LEDR: out std_logic_vector(17 downto 0);
        EXTERNAL_echoOut: out std_logic;
        EXTERNAL_sendEcho: out std_logic
    );
end UltrasonicDiscreteSingle;

architecture LLFSM of UltrasonicDiscreteSingle is
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
    constant STATE_Setup_Pin: std_logic_vector(3 downto 0) := "0011";
    constant STATE_Skip_Garbage: std_logic_vector(3 downto 0) := "0100";
    constant STATE_WaitForPulseStart: std_logic_vector(3 downto 0) := "0101";
    constant STATE_ClearTrigger: std_logic_vector(3 downto 0) := "0110";
    constant STATE_LostPulse: std_logic_vector(3 downto 0) := "0111";
    constant STATE_WaitForPulseEnd: std_logic_vector(3 downto 0) := "1000";
    constant STATE_Calculate_Distance: std_logic_vector(3 downto 0) := "1001";
    constant STATE_WaitForOneSecond: std_logic_vector(3 downto 0) := "1010";
    constant STATE_SetupMeasure: std_logic_vector(3 downto 0) := "1011";
    signal currentState: std_logic_vector(3 downto 0) := STATE_Initial;
    signal targetState: std_logic_vector(3 downto 0) := currentState;
    signal previousRinglet: std_logic_vector(3 downto 0) := STATE_Initial xor "1111";
    --Snapshot of External Variables
    signal triggerPin: std_logic;
    signal echoIn: std_logic;
    signal distance: std_logic_vector(15 downto 0);
    signal LEDG: std_logic_vector(8 downto 0);
    signal LEDR: std_logic_vector(17 downto 0);
    signal echoOut: std_logic;
    signal sendEcho: std_logic;
    --Machine Variables
    signal maxloops: unsigned(33 downto 0);
    signal SCHEDULE_LENGTH: unsigned(7 downto 0);
    signal SPEED_OF_SOUND: unsigned(8 downto 0);
    signal SONAR_OFFSET: unsigned(5 downto 0);
    signal MAX_DISTANCE: unsigned(21 downto 0);
    signal MAX_TIME: unsigned(33 downto 0);
    signal numloops: unsigned(23 downto 0);
    signal CLOCK_PERIOD: unsigned(4 downto 0);
    signal RINGLETS_PER_MS: unsigned(19 downto 0);
    signal i: unsigned(31 downto 0);
    signal RINGLETS_PER_S: unsigned(31 downto 0);
    signal lostState: std_logic_vector(3 downto 0);
begin
process (clk)
    begin
        if (rising_edge(clk)) then
            case internalState is
                when ReadSnapshot =>
                    echoIn <= EXTERNAL_echoIn;
                    if (previousRinglet = currentState) then
                        internalState <= NoOnEntry;
                    else
                        internalState <= OnEntry;
                    end if;
                when OnEntry =>
                    case currentState is
                        when STATE_Initial =>
                            distance <= x"FFFF";
                            CLOCK_PERIOD <= '1' & x"4"; -- 20 ns (50MHz clock)
                            SCHEDULE_LENGTH <= "101" * CLOCK_PERIOD; -- 100 ns per ringlet
                            SPEED_OF_SOUND <= '1' & x"57"; -- 343 um/us (34300 cm/s)
                            SONAR_OFFSET <= "10" & x"8"; -- 40
                            MAX_DISTANCE <= "11" & x"D0900"; -- 4 000 000 um (400 cm)
                            MAX_TIME <= MAX_DISTANCE * "10" / SPEED_OF_SOUND * ("11" & x"E8"); -- ns
                            maxloops <= MAX_TIME / SCHEDULE_LENGTH;
                            RINGLETS_PER_MS <= x"F4240" / SCHEDULE_LENGTH;
                            RINGLETS_PER_S <= x"3E8" * RINGLETS_PER_MS;
                            LEDG <= (others => '1');
                            LEDG <= (others => '1');
                            lostState <= (others => '0');
                        when STATE_Setup_Pin =>
                            triggerPin <= '0';
                        when STATE_Skip_Garbage =>
                            lostState <= currentState;
                        when STATE_WaitForPulseStart =>
                            i <= (others => '0');
                            lostState <= currentState;
                        when STATE_ClearTrigger =>
                            triggerPin <= '0';
                            lostState <= currentState;
                        when STATE_LostPulse =>
                            distance <= (others => '1');
                            LEDR <= (others => '1');
                            LEDG <= '0' & x"0" & lostState;
                        when STATE_WaitForPulseEnd =>
                            lostState <= currentState;
                        when STATE_Calculate_Distance =>
                            distance <= std_logic_vector(resize((numloops* SCHEDULE_LENGTH / x"3E8" / SPEED_OF_SOUND / x"2710"), 16));
                            LEDG <= (others => '1');
                            LEDR <= (others => '0');
                        when STATE_WaitForOneSecond =>
                            i <= x"00000000";
                        when STATE_SetupMeasure =>
                            sendEcho <= '0';
                        when others =>
                            null;
                    end case;
                    internalState <= CheckTransition;
                when CheckTransition =>
                    case currentState is
                        when STATE_Initial =>
                            if (true) then
                                targetState <= STATE_Setup_Pin;
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
                        when STATE_Setup_Pin =>
                            if (true) then
                                targetState <= STATE_SetupMeasure;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_Skip_Garbage =>
                            if (numloops >= maxloops) then
                                targetState <= STATE_LostPulse;
                                internalState <= OnExit;
                            elsif (echoIn = '0') and (not (numloops >= maxloops)) then
                                targetState <= STATE_WaitForPulseStart;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_WaitForPulseStart =>
                            if (numloops >= maxloops) then
                                targetState <= STATE_LostPulse;
                                internalState <= OnExit;
                            elsif (i >= RINGLETS_PER_MS) and (not (numloops >= maxloops)) then
                                targetState <= STATE_ClearTrigger;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_ClearTrigger =>
                            if (numloops >= maxloops) then
                                targetState <= STATE_LostPulse;
                                internalState <= OnExit;
                            elsif (echoIn = '1') and (not (numloops >= maxloops)) then
                                targetState <= STATE_WaitForPulseEnd;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_LostPulse =>
                            if (true) then
                                targetState <= STATE_WaitForOneSecond;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_WaitForPulseEnd =>
                            if (numloops >= maxloops) then
                                targetState <= STATE_LostPulse;
                                internalState <= OnExit;
                            elsif (echoPin = '0') and (not (numloops >= maxloops)) then
                                targetState <= STATE_Calculate_Distance;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_Calculate_Distance =>
                            if (true) then
                                targetState <= STATE_WaitForOneSecond;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_WaitForOneSecond =>
                            if (i >= RINGLETS_PER_S) then
                                targetState <= STATE_Setup_Pin;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_SetupMeasure =>
                            if (true) then
                                targetState <= STATE_Skip_Garbage;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when others =>
                            null;
                    end case;
                when Internal =>
                    case currentState is
                        when STATE_Skip_Garbage =>
                            numloops <= numloops + 1;
                        when STATE_WaitForPulseStart =>
                            numloops <= numloops + 1;
                            i <= i + 1;
                        when STATE_ClearTrigger =>
                            numloops <= numloops + 1;
                        when STATE_WaitForPulseEnd =>
                            numloops <= numloops + 1;
                        when STATE_WaitForOneSecond =>
                            i <= i + 1;
                        when others =>
                            null;
                    end case;
                    internalState <= WriteSnapshot;
                when OnExit =>
                    case currentState is
                        when STATE_Initial =>
                            numloops <= (others => '0');
                        when STATE_Setup_Pin =>
                            echoOut <= '0';
                            sendEcho <= '1';
                        when STATE_Skip_Garbage =>
                            triggerPin <= '1';
                            numloops <= numloops + 1;
                        when STATE_WaitForPulseStart =>
                            numloops <= numloops + 1;
                        when STATE_ClearTrigger =>
                            numloops <= numloops + 1;
                        when STATE_LostPulse =>
                            numloops <= (others => '0');
                        when STATE_Calculate_Distance =>
                            numloops <= (others => '0');
                        when others =>
                            null;
                    end case;
                    internalState <= WriteSnapshot;
                when NoOnEntry =>
                    internalState <= CheckTransition;
                when WriteSnapshot =>
                    EXTERNAL_triggerPin <= triggerPin;
                    EXTERNAL_distance <= distance;
                    EXTERNAL_LEDG <= LEDG;
                    EXTERNAL_LEDR <= LEDR;
                    EXTERNAL_echoOut <= echoOut;
                    EXTERNAL_sendEcho <= sendEcho;
                    internalState <= ReadSnapshot;
                    previousRinglet <= currentState;
                    currentState <= targetState;
                when others =>
                    null;
            end case;
        end if;
    end process;
end LLFSM;