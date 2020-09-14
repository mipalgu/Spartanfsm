--SuspensibleHelloWorld.vhd
--
--This is a generated file - DO NOT ALTER.
--Please use an LLFSM editor to change this file.
--Date Generated: 2020-09-15 00:32 AEST
--

library IEEE;
use IEEE.std_logic_1164.All;
use IEEE.math_real.all;


entity SuspensibleHelloWorld is
    port (
        clk: in std_logic;
        command: in std_logic_vector(1 downto 0);
        suspended: out std_logic;
        EXTERNAL_LED: out std_logic
    );
end SuspensibleHelloWorld;

architecture LLFSM of SuspensibleHelloWorld is
    --Internal State Representation Bits
    constant OnEntry: std_logic_vector(3 downto 0) := "0000";
    constant CheckTransition: std_logic_vector(3 downto 0) := "0001";
    constant OnExit: std_logic_vector(3 downto 0) := "0010";
    constant Internal: std_logic_vector(3 downto 0) := "0011";
    constant ReadSnapshot: std_logic_vector(3 downto 0) := "0100";
    constant WriteSnapshot: std_logic_vector(3 downto 0) := "0101";
    constant NoOnEntry: std_logic_vector(3 downto 0) := "0110";
    constant OnSuspend: std_logic_vector(3 downto 0) := "0111";
    constant OnResume: std_logic_vector(3 downto 0) := "1000";
    constant NoSuspendOrResume: std_logic_vector(3 downto 0) := "1001";
    signal internalState: std_logic_vector(3 downto 0) := ReadSnapshot;
    --State Representation Bits
    constant STATE_Initial: std_logic_vector(1 downto 0) := "00";
    constant STATE_SUSPENDED: std_logic_vector(1 downto 0) := "01";
    constant STATE_InitialPseudoState: std_logic_vector(1 downto 0) := "10";
    constant STATE_LightOn: std_logic_vector(1 downto 0) := "11";
    signal currentState: std_logic_vector(1 downto 0) := STATE_Initial;
    signal targetState: std_logic_vector(1 downto 0) := currentState;
    signal previousRinglet: std_logic_vector(1 downto 0) := STATE_Initial xor "11";
    signal suspendedFrom: std_logic_vector(1 downto 0) := STATE_Initial;
    constant COMMAND_RESTART: std_logic_vector(1 downto 0) := "00";
    constant COMMAND_SUSPEND: std_logic_vector(1 downto 0) := "01";
    constant COMMAND_RESUME: std_logic_vector(1 downto 0) := "10";
    constant COMMAND_NULL: std_logic_vector(1 downto 0) := "11";
    shared variable ringlet_counter: natural := 0;
    constant clockPeriod: real := 20.0;
    constant ringletLength: real := 6.0 * clockPeriod;
    constant RINGLETS_PER_NS: real := 1.0 / ringletLength;
    constant RINGLETS_PER_US: real := 1000.0 * RINGLETS_PER_NS;
    constant RINGLETS_PER_MS: real := 1000000.0 * RINGLETS_PER_NS;
    constant RINGLETS_PER_S: real := 1000000000.0 * RINGLETS_PER_NS;
    --Snapshot of External Variables
    signal LED: std_logic;
    --Machine Variables
begin
process (clk)
    begin
        if (rising_edge(clk)) then
            case internalState is
                when ReadSnapshot =>
                    if (command = COMMAND_RESTART) then
                        currentState <= STATE_Initial;
                        internalState <= NoSuspendOrResume;
                        suspended <= '0';
                        suspendedFrom <= STATE_Initial;
                        targetState <= STATE_Initial;
                    elsif (command = COMMAND_RESUME and currentState = STATE_SUSPENDED and suspendedFrom /= STATE_SUSPENDED) then
                        suspended <= '0';
                        currentState <= suspendedFrom;
                        internalState <= OnResume;
                        targetState <= suspendedFrom;
                    elsif (command = COMMAND_SUSPEND and currentState /= STATE_SUSPENDED) then
                        suspendedFrom <= currentState;
                        suspended <= '1';
                        currentState <= STATE_SUSPENDED;
                        internalState <= OnSuspend;
                        targetState <= STATE_SUSPENDED;
                    else
                        if (currentState = STATE_SUSPENDED) then
                            suspended <= '1';
                        else
                            suspended <= '0';
                            suspendedFrom <= currentState;
                        end if;
                        internalState <= NoSuspendOrResume;
                    end if;
                when OnSuspend =>
                    case suspendedFrom is
                        when others =>
                            null;
                    end case;
                    internalState <= OnEntry;
                when OnResume =>
                    case currentState is
                        when others =>
                            null;
                    end case;
                    internalState <= OnEntry;
                when NoSuspendOrResume =>
                    if (previousRinglet /= currentState) then
                        internalState <= OnEntry;
                    else
                        internalState <= NoOnEntry;
                    end if;
                when OnEntry =>
                    case currentState is
                        when STATE_SUSPENDED =>
                            LED <= '0';
                        when STATE_LightOn =>
                            LED <= '1';
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
                            internalState <= Internal;
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
                    EXTERNAL_LED <= LED;
                    internalState <= ReadSnapshot;
                    previousRinglet <= currentState;
                    currentState <= targetState;
                when others =>
                    null;
            end case;
        end if;
    end process;
end LLFSM;