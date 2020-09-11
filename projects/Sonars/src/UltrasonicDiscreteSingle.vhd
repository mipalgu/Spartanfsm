--UltrasonicDiscreteSingle.vhd
--
--This is a generated file - DO NOT ALTER.
--Please use an LLFSM editor to change this file.
--Date Generated: 2020-09-11 23:33 AEST
--

library IEEE;
use IEEE.std_logic_1164.All;
use IEEE.numeric_std.all;

entity UltrasonicDiscreteSingle is
    port (
        clk: in std_logic;
        restart: in std_logic;
        resume: in std_logic;
        suspend: in std_logic;
        suspended: out std_logic;
        EXTERNAL_triggerPin: out std_logic;
        EXTERNAL_echo: inout std_logic;
        EXTERNAL_distance: out std_logic_vector(15 downto 0)
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
    constant CheckForSuspension: std_logic_vector(2 downto 0) := "111";
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
    signal currentState: std_logic_vector(3 downto 0) := STATE_Initial;
    signal targetState: std_logic_vector(3 downto 0) := currentState;
    signal previousRinglet: std_logic_vector(3 downto 0) := STATE_Initial xor "1111";
    signal suspendedFrom: std_logic_vector(3 downto 0) := STATE_Initial;
    --Snapshot of External Variables
    signal triggerPin: std_logic;
    signal echo: std_logic;
    signal distance: std_logic_vector(15 downto 0);
    --Machine Variables
    constant SCHEDULE_LENGTH: unsigned(7 downto 0) := x"64";
    constant SPEED_OF_SOUND: unsigned(11 downto 0) := x"157";
    constant SONAR_OFFSET: unsigned(7 downto 0) := x"28";
    constant MAX_DISTANCE: unsigned(23 downto 0) := x"3D0900";
    constant MAX_TIME: unsigned(39 downto 0) := (MAX_DISTANCE * x"2") / SPEED_OF_SOUND *x"3E8";
    signal numloops: unsigned(39 downto 0);
    constant RINGLETS_PER_MS: unsigned(19 downto 0) := x"F4240" / SCHEDULE_LENGTH;
    signal i: unsigned(31 downto 0);
    constant RINGLETS_PER_S: unsigned(31 downto 0) :=  x"3E8" * RINGLETS_PER_MS;
    constant maxloops: unsigned(39 downto 0) := MAX_TIME / SCHEDULE_LENGTH;
begin
process (clk)
    begin
        if (rising_edge(clk)) then
            case internalState is
                when CheckForSuspension =>
                    if (restart = '0') then
                        currentState <= STATE_Initial;
                        suspended <= '0';
                        suspendedFrom <= STATE_Initial;
                    elsif (resume = '1' and currentState = STATE_SUSPENDED and suspendedFrom /= STATE_SUSPENDED) then
                        suspended <= '0';
                        currentState <= suspendedFrom;
                    elsif (suspend = '1' and currentState /= STATE_SUSPENDED) then
                        suspendedFrom <= currentState;
                        suspended <= '1';
                        currentState <= STATE_SUSPENDED;
                    elsif (currentState = STATE_SUSPENDED) then
                        suspended <= '1';
                    else
                        suspended <= '0';
                        suspendedFrom <= currentState;
                    end if;
                    internalState <= ReadSnapshot;
                when ReadSnapshot =>
                    echo <= EXTERNAL_echo;
                    if (previousRinglet = currentState) then
                        internalState <= NoOnEntry;
                    else
                        internalState <= OnEntry;
                    end if;
                when OnEntry =>
                    case currentState is
                        when STATE_Setup_Pin =>
                            triggerPin <= '0';
                        when STATE_Skip_Garbage =>
                            echo <= '0';
                            triggerPin <= '0';
                        when STATE_WaitForPulseStart =>
                            i <= (others => '0');
                        when STATE_ClearTrigger =>
                            triggerPin <= '0';
                        when STATE_LostPulse =>
                            distance <= (others => '1');
                        when STATE_Calculate_Distance =>
                            distance <= std_logic_vector(resize((numloops* SCHEDULE_LENGTH / x"3E8" / SPEED_OF_SOUND / x"2710"), 16));
                        when STATE_WaitForOneSecond =>
                            i <= (others => '0');
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
                                targetState <= STATE_Skip_Garbage;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_Skip_Garbage =>
                            if (echo = '0') then
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
                            elsif (echo = '1') and (not (numloops >= maxloops)) then
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
                            elsif (echo = '0') and (not (numloops >= maxloops)) then
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
                        when others =>
                            null;
                    end case;
                when Internal =>
                    case currentState is
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
                            echo <= '0';
                        when STATE_Skip_Garbage =>
                            triggerPin <= '1';
                            numloops <= numloops + 1;
                        when STATE_WaitForPulseStart =>
                            numloops <= numloops + 1;
                            triggerPin <= '0';
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
                    EXTERNAL_echo <= echo;
                    EXTERNAL_distance <= distance;
                    internalState <= CheckForSuspension;
                    previousRinglet <= currentState;
                    currentState <= targetState;
                when others =>
                    null;
            end case;
        end if;
    end process;
end LLFSM;