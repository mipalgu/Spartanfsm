--DisplayTransmitter.vhd
--
--This is a generated file - DO NOT ALTER.
--Please use an LLFSM editor to change this file.
--Date Generated: 2020-06-24 20:26 EDT
--

library IEEE;
use IEEE.std_logic_1164.All;
use IEEE.numeric_std.all;

entity DisplayTransmitter is
    port (
        clk: in std_logic;
        EXTERNAL_data: in std_logic_vector(15 downto 0);
        EXTERNAL_busy: out std_logic;
        EXTERNAL_dataLine: out std_logic;
        EXTERNAL_cs: out std_logic;
        EXTERNAL_slaveClk: in std_logic
    );
end DisplayTransmitter;

architecture LLFSM of DisplayTransmitter is
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
    constant STATE_SendBit: std_logic_vector(2 downto 0) := "011";
    constant STATE_CheckForNewData: std_logic_vector(2 downto 0) := "100";
    constant STATE_WaitForPulse: std_logic_vector(2 downto 0) := "101";
    signal currentState: std_logic_vector(2 downto 0) := STATE_Initial;
    signal targetState: std_logic_vector(2 downto 0) := currentState;
    signal previousRinglet: std_logic_vector(2 downto 0) := STATE_Initial xor "111";
    --Snapshot of External Variables
    signal data: std_logic_vector(15 downto 0);
    signal busy: std_logic;
    signal dataLine: std_logic;
    signal cs: std_logic;
    signal slaveClk: std_logic;
    --Machine Variables
    signal latchedData: std_logic_vector(15 downto 0);
    signal dataToSend: std_logic_vector(15 downto 0);
    signal bitsShifted: unsigned(4 downto 0);
begin
process (clk)
    begin
        if (rising_edge(clk)) then
            case internalState is
                when ReadSnapshot =>
                    data <= EXTERNAL_data;
                    slaveClk <= EXTERNAL_slaveClk;
                    if (previousRinglet = currentState) then
                        internalState <= NoOnEntry;
                    else
                        internalState <= OnEntry;
                    end if;
                when OnEntry =>
                    case currentState is
                        when STATE_Initial =>
                            busy <= '0';
                            latchedData <= x"0000";
                        when STATE_SendBit =>
                            dataLine <= dataToSend(15);
                            dataToSend <= dataToSend(14 downto 0) & "0";
                            bitsShifted <= bitsShifted + 1;
                            cs <= '0';
                        when STATE_CheckForNewData =>
                            busy <= '0';
                            bitsShifted <= "00000";
                            cs <= '1';
                        when others =>
                            null;
                    end case;
                    internalState <= CheckTransition;
                when CheckTransition =>
                    case currentState is
                        when STATE_Initial =>
                            if (true) then
                                targetState <= STATE_CheckForNewData;
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
                        when STATE_SendBit =>
                            if (slaveClk = '0') then
                                targetState <= STATE_WaitForPulse;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_CheckForNewData =>
                            if (latchedData /= data) then
                                targetState <= STATE_SendBit;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_WaitForPulse =>
                            if (slaveClk = '1' and bitsShifted < 16) then
                                targetState <= STATE_SendBit;
                                internalState <= OnExit;
                            elsif (slaveClk = '1') and (not (slaveClk = '1' and bitsShifted < 16)) then
                                targetState <= STATE_CheckForNewData;
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
                        when STATE_CheckForNewData =>
                            latchedData <= data;
                            dataToSend <= data;
                            busy <= '1';
                        when others =>
                            null;
                    end case;
                    internalState <= WriteSnapshot;
                when NoOnEntry =>
                    internalState <= CheckTransition;
                when WriteSnapshot =>
                    EXTERNAL_busy <= busy;
                    EXTERNAL_dataLine <= dataLine;
                    EXTERNAL_cs <= cs;
                    internalState <= ReadSnapshot;
                    previousRinglet <= currentState;
                    currentState <= targetState;
                when others =>
                    null;
            end case;
        end if;
    end process;
end LLFSM;