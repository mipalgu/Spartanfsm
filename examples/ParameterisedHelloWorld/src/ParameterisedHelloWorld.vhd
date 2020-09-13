--ParameterisedHelloWorld.vhd
--
--This is a generated file - DO NOT ALTER.
--Please use an LLFSM editor to change this file.
--Date Generated: 2020-09-14 01:51 AEST
--

library IEEE;
use IEEE.std_logic_1164.All;
use IEEE.math_real.all;
use IEEE.numeric_std.all;

entity ParameterisedHelloWorld is
    generic (
        NGreen: Integer;
        NRed: Integer
    );
    port (
        clk: in std_logic;
        command: in std_logic_vector(1 downto 0);
        suspended: out std_logic;
        EXTERNAL_LEDG: out std_logic_vector(NGREEN - 1 downto 0);
        EXTERNAL_LEDR: out std_logic_vector(NRED - 1 downto 0)
    );
end ParameterisedHelloWorld;

architecture LLFSM of ParameterisedHelloWorld is
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
    constant STATE_Initial: std_logic_vector(2 downto 0) := "000";
    constant STATE_SUSPENDED: std_logic_vector(2 downto 0) := "001";
    constant STATE_InitialPseudoState: std_logic_vector(2 downto 0) := "010";
    constant STATE_GreenOn: std_logic_vector(2 downto 0) := "011";
    constant STATE_RedOn: std_logic_vector(2 downto 0) := "100";
    signal currentState: std_logic_vector(2 downto 0) := STATE_Initial;
    signal targetState: std_logic_vector(2 downto 0) := currentState;
    signal previousRinglet: std_logic_vector(2 downto 0) := STATE_Initial xor "111";
    signal suspendedFrom: std_logic_vector(2 downto 0) := STATE_Initial;
    constant COMMAND_RESTART: std_logic_vector(1 downto 0) := "00";
    constant COMMAND_SUSPEND: std_logic_vector(1 downto 0) := "01";
    constant COMMAND_RESUME: std_logic_vector(1 downto 0) := "10";
    constant COMMAND_NULL: std_logic_vector(1 downto 0) := "11";
    shared variable ringlet_counter: natural := 0;
    constant clockPeriod: real := 20.0;
    constant ringletLength: real := 5.0 * clockPeriod;
    constant RINGLETS_PER_NS: real := 1.0 / ringletLength;
    constant RINGLETS_PER_US: real := 1000.0 * RINGLETS_PER_NS;
    constant RINGLETS_PER_MS: real := 1000000.0 * RINGLETS_PER_NS;
    constant RINGLETS_PER_S: real := 1000000000.0 * RINGLETS_PER_NS;
    --Snapshot of External Variables
    signal LEDG: std_logic_vector(NGREEN - 1 downto 0);
    signal LEDR: std_logic_vector(NRED - 1 downto 0);
    --Machine Variables
    constant RINGLETS_PER_S: unsigned(23 downto 0) := x"7F2816";
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
                        targetState <= STATE_Initial;
                    elsif (command = COMMAND_RESUME and currentState = STATE_SUSPENDED and suspendedFrom /= STATE_SUSPENDED) then
                        suspended <= '0';
                        currentState <= suspendedFrom;
                        if (previousringlet /= suspendedFrom) then
                            internalState <= OnEntry;
                        else
                            internalState <= NoOnEntry;
                        end if;
                        targetState <= suspendedFrom;
                    elsif (command = COMMAND_SUSPEND and currentState /= STATE_SUSPENDED) then
                        suspendedFrom <= currentState;
                        suspended <= '1';
                        currentState <= STATE_SUSPENDED;
                        if (previousRinglet /= STATE_SUSPENDED) then
                            internalState <= OnEntry;
                        else
                            internalState <= NoOnEntry;
                        end if;
                        targetState <= STATE_SUSPENDED;
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
                        when STATE_GreenOn =>
                            LEDG <= (others => '1');
                            LEDR <= (others => '0');
                            ringlet_counter := 0;
                        when STATE_RedOn =>
                            LEDG <= (others => '0');
                            LEDR <= (others => '1');
                            ringlet_counter := 0;
                        when others =>
                            null;
                    end case;
                    internalState <= CheckTransition;
                when CheckTransition =>
                    case currentState is
                        when STATE_Initial =>
                            if (true) then
                                targetState <= STATE_GreenOn;
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
                        when STATE_GreenOn =>
                            if (ringlet_counter >= integer(ceil(1.0 * RINGLETS_PER_S))) then
                                targetState <= STATE_RedOn;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_RedOn =>
                            if (ringlet_counter >= integer(ceil(1.0 * RINGLETS_PER_S))) then
                                targetState <= STATE_GreenOn;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when others =>
                            null;
                    end case;
                when Internal =>
                    case currentState is
                        when STATE_GreenOn =>
                            ringlet_counter := ringlet_counter + 1;
                        when STATE_RedOn =>
                            ringlet_counter := ringlet_counter + 1;
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
                    EXTERNAL_LEDG <= LEDG;
                    EXTERNAL_LEDR <= LEDR;
                    internalState <= ReadSnapshot;
                    previousRinglet <= currentState;
                    currentState <= targetState;
                when others =>
                    null;
            end case;
        end if;
    end process;
end LLFSM;