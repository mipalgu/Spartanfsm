--ParentMachine.vhd
--
--This is a generated file - DO NOT ALTER.
--Please use an LLFSM editor to change this file.
--Date Generated: 2020-09-13 05:08 AEST
--

library IEEE;
use IEEE.std_logic_1164.All;
use IEEE.numeric_std.all;

entity ParentMachine is
    port (
        clk: in std_logic;
        command: in std_logic_vector(1 downto 0);
        suspended: out std_logic;
        EXTERNAL_LED: out std_logic
    );
end ParentMachine;

architecture LLFSM of ParentMachine is
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
    constant STATE_Initial: std_logic_vector(2 downto 0) := "000";
    constant STATE_SUSPENDED: std_logic_vector(2 downto 0) := "001";
    constant STATE_InitialPseudoState: std_logic_vector(2 downto 0) := "010";
    constant STATE_LightOn: std_logic_vector(2 downto 0) := "011";
    constant STATE_LightOff: std_logic_vector(2 downto 0) := "100";
    signal currentState: std_logic_vector(2 downto 0) := STATE_Initial;
    signal targetState: std_logic_vector(2 downto 0) := currentState;
    signal previousRinglet: std_logic_vector(2 downto 0) := STATE_Initial xor "111";
    signal suspendedFrom: std_logic_vector(2 downto 0) := STATE_Initial;
    constant COMMAND_RESTART: std_logic_vector(1 downto 0) := "00";
    constant COMMAND_SUSPEND: std_logic_vector(1 downto 0) := "01";
    constant COMMAND_RESUME: std_logic_vector(1 downto 0) := "10";
    --Snapshot of External Variables
    signal LED: std_logic;
    --Machine Variables
    constant RINGLETS_PER_S: unsigned(23 downto 0) := x"7F2816";
    signal i: unsigned(23 downto 0);
    signal childCommand: std_logic_vector(1 downto 0);
    signal childsLED: std_logic;
begin
process (clk)
    begin
        if (rising_edge(clk)) then
            case internalState is
                when ReadSnapshot =>
                    if (command = COMMAND_RESTART) then
                        currentState <= STATE_Initial;
                        if (previousRinglet /= STATE_Initial) then
                            internalState <= OnEntry;
                        else
                            internalState <= NoOnEntry;
                        end if;
                        suspended <= '0';
                        suspendedFrom <= STATE_Initial;
                    elsif (command = COMMAND_RESUME and currentState = STATE_SUSPENDED and suspendedFrom /= STATE_SUSPENDED) then
                        suspended <= '0';
                        currentState <= suspendedFrom;
                        if (previousringlet /= suspendedFrom) then
                            internalState <= OnEntry;
                        else
                            internalState <= NoOnEntry;
                        end if;
                    elsif (command = COMMAND_SUSPEND and currentState /= STATE_SUSPENDED) then
                        suspendedFrom <= currentState;
                        suspended <= '1';
                        currentState <= STATE_SUSPENDED;
                        if (previousRinglet /= STATE_SUSPENDED) then
                            internalState <= OnEntry;
                        else
                            internalState <= NoOnEntry;
                        end if;
                    else
                        if (currentState = STATE_SUSPENDED) then
                            suspended <= '1';
                        else
                            suspended <= '0';
                            suspendedFrom <= currentState;
                        end if;
                        if (previousRinglet /= currentState) then
                            internalState <= OnEntry;
                        else
                            internalState <= NoOnEntry;
                        end if;
                    end if;
                when OnEntry =>
                    case currentState is
                        when STATE_SUSPENDED =>
                            LED <= '0';
                            i <= (others => '0');
                        when STATE_LightOn =>
                            childCommand <= COMMAND_RESTART;
                            i <= (others => '0');
                        when STATE_LightOff =>
                            childCommand <= COMMAND_SUSPEND;
                            i <= (others => '0');
                        when others =>
                            null;
                    end case;
                    internalState <= CheckTransition;
                when CheckTransition =>
                    case currentState is
                        when STATE_Initial =>
                            if (true) then
                                targetState <= STATE_LightOn;
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
                        when STATE_LightOn =>
                            if (i >= RINGLETS_PER_S) then
                                targetState <= STATE_LightOff;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_LightOff =>
                            if (i >= RINGLETS_PER_S) then
                                targetState <= STATE_LightOn;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when others =>
                            null;
                    end case;
                when Internal =>
                    case currentState is
                        when STATE_LightOn =>
                            i <= i + 1;
                            led <= childsLed;
                        when STATE_LightOff =>
                            i <= i + 1;
                            led <= childsLed;
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
                    EXTERNAL_LED <= LED;
                    internalState <= CheckForSuspension;
                    previousRinglet <= currentState;
                    currentState <= targetState;
                when others =>
                    null;
            end case;
        end if;
    end process;
end LLFSM;