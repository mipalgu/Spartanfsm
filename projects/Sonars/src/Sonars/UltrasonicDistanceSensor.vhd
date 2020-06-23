--UltrasonicDistanceSensor.vhd
--
--This is a generated file - DO NOT ALTER.
--Please use an LLFSM editor to change this file.
--Date Generated: 2020-06-23 07:19 EDT
--

library IEEE;
use IEEE.std_logic_1164.All;
use IEEE.numeric_std.all;

entity UltrasonicDistanceSensor is
    port (
        clk: in std_logic;
        EXTERNAL_echo: in std_logic;
        EXTERNAL_trigger: out std_logic;
        EXTERNAL_distance: out unsigned(7 downto 0);
        EXTERNAL_resetEcho: out std_logic
    );
end UltrasonicDistanceSensor;

architecture LLFSM of UltrasonicDistanceSensor is
    --Internal State Representation Bits
    constant OnEntry: std_logic_vector(2 downto 0) := "000";
    constant CheckTransition: std_logic_vector(2 downto 0) := "001";
    constant OnExit: std_logic_vector(2 downto 0) := "010";
    constant Internal: std_logic_vector(2 downto 0) := "011";
    constant ReadSnapshot: std_logic_vector(2 downto 0) := "100";
    constant WriteSnapshot: std_logic_vector(2 downto 0) := "101";
    signal internalState: std_logic_vector(2 downto 0) := ReadSnapshot;
    --State Representation Bits
    constant STATE_Initial: std_logic_vector(2 downto 0) := "000";
    constant STATE_SUSPENDED: std_logic_vector(2 downto 0) := "001";
    constant STATE_CountTime: std_logic_vector(2 downto 0) := "010";
    constant STATE_CalculateDistance: std_logic_vector(2 downto 0) := "011";
    constant STATE_TriggerSignal: std_logic_vector(2 downto 0) := "100";
    constant STATE_InitialPseudoState: std_logic_vector(2 downto 0) := "101";
    constant STATE_LostSignal: std_logic_vector(2 downto 0) := "110";
    constant STATE_ResetEcho: std_logic_vector(2 downto 0) := "111";
    signal currentState: std_logic_vector(2 downto 0) := STATE_Initial;
    signal targetState: std_logic_vector(2 downto 0) := currentState;
    signal previousRinglet: std_logic_vector(2 downto 0) := STATE_Initial xor "111";
    --Snapshot of External Variables
    signal echo: std_logic;
    signal trigger: std_logic;
    signal distance: unsigned(7 downto 0);
    signal resetEcho: std_logic;
    --Machine Variables
    signal i: unsigned(23 downto 0);
    constant SPEED_OF_SOUND: unsigned(15 downto 0) := x"84D0";
    constant DOUBLE_FREQ: unsigned(27 downto 0) := x"5F5E100";
    constant TIMEOUT: unsigned(23 downto 0) := x"59C284";
    constant RINGLET_LENGTH: unsigned(2 downto 0) := "110";
begin
process (clk)
    begin
        if (rising_edge(clk)) then
            case internalState is
                when ReadSnapshot =>
                    echo <= EXTERNAL_echo;
                    if (previousRinglet = currentState) then
                        internalState <= CheckTransition;
                    else
                        internalState <= OnEntry;
                    end if;
                when OnEntry =>
                    case currentState is
                        when STATE_CountTime=>
                            i <= (others => '0');
                        when STATE_CalculateDistance=>
                            distance <= resize(RINGLET_LENGTH * i * SPEED_OF_SOUND / DOUBLE_FREQ, distance'length); --[periods (6/count) * count * period (20ns) * speedOfSound (34000cm/s)]/2
                        when STATE_TriggerSignal=>
                            i <= (others => '0');
                            trigger <= '1';
                        when STATE_LostSignal=>
                            distance <= (others => '1');
                        when STATE_ResetEcho=>
                            resetEcho <= '1';
                            trigger <= '0';
                        when others =>
                            null;
                    end case;
                    internalState <= CheckTransition;
                when CheckTransition =>
                    case currentState is
                        when STATE_Initial=>
                            if (true) then
                                targetState <= STATE_ResetEcho;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_SUSPENDED=>
                            internalState <= Internal;
                        when STATE_CountTime=>
                            if (echo = '1') then
                                targetState <= STATE_CalculateDistance;
                                internalState <= OnExit;
                            elsif (i >= TIMEOUT) and (not (echo = '1')) then
                                targetState <= STATE_LostSignal;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_CalculateDistance=>
                            if (true) then
                                targetState <= STATE_ResetEcho;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_TriggerSignal=>
                            if (i >= x"0000FA" and echo = '0') then
                                targetState <= STATE_CountTime;
                                internalState <= OnExit;
                            elsif (i >= TIMEOUT) and (not (i >= x"0000FA" and echo = '0')) then
                                targetState <= STATE_ResetEcho;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_InitialPseudoState=>
                            if (true) then
                                targetState <= STATE_Initial;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_LostSignal=>
                            if (true) then
                                targetState <= STATE_ResetEcho;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_ResetEcho=>
                            if (echo = '0') then
                                targetState <= STATE_TriggerSignal;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when others =>
                            null;
                    end case;
                when Internal =>
                    case currentState is
                        when STATE_CountTime=>
                            i <= i + 1;
                        when STATE_TriggerSignal=>
                            i <= i + 1;
                        when others =>
                            null;
                    end case;
                    internalState <= WriteSnapshot;
                when OnExit =>
                    case currentState is
                        when STATE_Initial=>
                            distance <= (others => '0');
                        when STATE_CountTime=>
                            i <= i + 1;
                        when STATE_TriggerSignal=>
                            trigger <= '0';
                        when others =>
                            null;
                    end case;
                    internalState <= WriteSnapshot;
                when WriteSnapshot =>
                    EXTERNAL_trigger <= trigger;
                    EXTERNAL_distance <= distance;
                    EXTERNAL_resetEcho <= resetEcho;
                    internalState <= ReadSnapshot;
                    previousRinglet <= currentState;
                    currentState <= targetState;
                when others =>
                    null;
            end case;
        end if;
    end process;
end LLFSM;