--ParameterisedHelloWorld.vhd
--
--This is a generated file - DO NOT ALTER.
--Please use an LLFSM editor to change this file.
--Date Generated: 2020-09-10 03:04 AEST
--

library IEEE;
use IEEE.std_logic_1164.All;
use IEEE.numeric_std.all;

entity ParameterisedHelloWorld is
    generic (
        NGreen: Integer;
        NRed: Integer
    );
    port (
        clk: in std_logic;
        restart: in std_logic;
        resume: in std_logic;
        suspend: in std_logic;
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
    constant CheckForSuspension: std_logic_vector(2 downto 0) := "111";
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
    --Snapshot of External Variables
    signal LEDG: std_logic_vector(NGREEN - 1 downto 0);
    signal LEDR: std_logic_vector(NRED - 1 downto 0);
    --Machine Variables
    constant RINGLETS_PER_S: unsigned(23 downto 0) := x"7F2816";
    signal i: unsigned(23 downto 0);
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
                    if (previousRinglet = currentState) then
                        internalState <= NoOnEntry;
                    else
                        internalState <= OnEntry;
                    end if;
                when OnEntry =>
                    case currentState is
                        when STATE_GreenOn =>
                            LEDG <= (others => '1');
                            LEDR <= (others => '0');
                            i <= (others => '0');
                        when STATE_RedOn =>
                            LEDG <= (others => '0');
                            LEDR <= (others => '1');
                            i <= (others => '0');
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
                            if (i >= RINGLETS_PER_S) then
                                targetState <= STATE_RedOn;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_RedOn =>
                            if (i >= RINGLETS_PER_S) then
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
                            i <= i + 1;
                        when STATE_RedOn =>
                            i <= i + 1;
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
                    internalState <= CheckForSuspension;
                    previousRinglet <= currentState;
                    currentState <= targetState;
                when others =>
                    null;
            end case;
        end if;
    end process;
end LLFSM;