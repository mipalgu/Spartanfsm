--DisplayGateway.vhd
--
--This is a generated file - DO NOT ALTER.
--Please use an LLFSM editor to change this file.
--Date Generated: 2020-06-24 10:33 EDT
--

library IEEE;
use IEEE.std_logic_1164.All;
use IEEE.numeric_std.all;

entity DisplayGateway is
    port (
        clk: in std_logic;
        EXTERNAL_dataLine: out std_logic;
        EXTERNAL_data: in std_logic_vector(7 downto 0);
        EXTERNAL_digit: in std_logic_vector(3 downto 0);
        EXTERNAL_busy: out std_logic;
        EXTERNAL_cs: out std_logic;
        EXTERNAL_slaveClk: in std_logic
    );
end DisplayGateway;

architecture LLFSM of DisplayGateway is
    --Internal State Representation Bits
    constant OnEntry: std_logic_vector(2 downto 0) := "000";
    constant CheckTransition: std_logic_vector(2 downto 0) := "001";
    constant OnExit: std_logic_vector(2 downto 0) := "010";
    constant Internal: std_logic_vector(2 downto 0) := "011";
    constant ReadSnapshot: std_logic_vector(2 downto 0) := "100";
    constant WriteSnapshot: std_logic_vector(2 downto 0) := "101";
    signal internalState: std_logic_vector(2 downto 0) := ReadSnapshot;
    --State Representation Bits
    constant STATE_Initial: std_logic_vector(4 downto 0) := "00000";
    constant STATE_SUSPENDED: std_logic_vector(4 downto 0) := "00001";
    constant STATE_InitialPseudoState: std_logic_vector(4 downto 0) := "00010";
    constant STATE_NoShutdown: std_logic_vector(4 downto 0) := "00011";
    constant STATE_SetNoDecoding: std_logic_vector(4 downto 0) := "00100";
    constant STATE_SetIntensity: std_logic_vector(4 downto 0) := "00101";
    constant STATE_AllDigitsOn: std_logic_vector(4 downto 0) := "00110";
    constant STATE_DisableDisplayTest: std_logic_vector(4 downto 0) := "00111";
    constant STATE_LatchData: std_logic_vector(4 downto 0) := "01000";
    constant STATE_SendBit: std_logic_vector(4 downto 0) := "01001";
    constant STATE_Wait: std_logic_vector(4 downto 0) := "01010";
    constant STATE_CheckIfDifferent: std_logic_vector(4 downto 0) := "01011";
    constant STATE_ShutdownSent: std_logic_vector(4 downto 0) := "01100";
    constant STATE_NoDecodingSent: std_logic_vector(4 downto 0) := "01101";
    constant STATE_IntensitySent: std_logic_vector(4 downto 0) := "01110";
    constant STATE_EnableDigitsSent: std_logic_vector(4 downto 0) := "01111";
    constant STATE_DisplayTestSent: std_logic_vector(4 downto 0) := "10000";
    constant STATE_DataSend: std_logic_vector(4 downto 0) := "10001";
    signal currentState: std_logic_vector(4 downto 0) := STATE_Initial;
    signal targetState: std_logic_vector(4 downto 0) := currentState;
    signal previousRinglet: std_logic_vector(4 downto 0) := STATE_Initial xor "11111";
    --Snapshot of External Variables
    signal dataLine: std_logic;
    signal data: std_logic_vector(7 downto 0);
    signal digit: std_logic_vector(3 downto 0);
    signal busy: std_logic;
    signal cs: std_logic;
    signal slaveClk: std_logic;
    --Machine Variables
    signal i: unsigned(15 downto 0);
    constant PULSE_LENGTH: unsigned(15 downto 0) := x"FFFF";
    signal txBusy: std_logic;
    signal txData: std_logic_vector(15 downto 0);
    signal latchedData: std_logic_vector(7 downto 0);
    signal latchedDigit: std_logic_vector(3 downto 0);
	
	 component DisplayTransmitter is
		port (
			clk: in std_logic;
         EXTERNAL_data: in std_logic_vector(15 downto 0);
         EXTERNAL_busy: out std_logic;
         EXTERNAL_dataLine: out std_logic;
         EXTERNAL_cs: out std_logic;
         EXTERNAL_slaveClk: in std_logic
		);
	 end component;
	 
begin

	transmitter: DisplayTransmitter port map (
		clk,
		txData,
		txBusy,
		dataLine,
		cs,
		slaveClk
	);
process (clk)
    begin
        if (rising_edge(clk)) then
            case internalState is
                when ReadSnapshot =>
                    data <= EXTERNAL_data;
                    digit <= EXTERNAL_digit;
                    slaveClk <= EXTERNAL_slaveClk;
                    if (previousRinglet = currentState) then
                        internalState <= CheckTransition;
                    else
                        internalState <= OnEntry;
                    end if;
                when OnEntry =>
                    case currentState is
                        when STATE_Initial =>
                            busy <= '1';
                        when STATE_NoShutdown =>
                            txData <= x"0C01";
                        when STATE_SetNoDecoding =>
                            txData <= x"0900";
                        when STATE_SetIntensity =>
                            txData <= x"0A0B";
                        when STATE_AllDigitsOn =>
                            txData <= x"0B07";
                        when STATE_DisableDisplayTest =>
                            txData <= x"0F00";
                        when STATE_LatchData =>
                            latchedData <= data;
                            latchedDigit <= digit;
                        when STATE_SendBit =>
                            i <= x"0000";
                            txData <= x"0" & latchedDigit & latchedData;
                        when STATE_CheckIfDifferent =>
                            busy <= '0';
                        when others =>
                            null;
                    end case;
                    internalState <= CheckTransition;
                when CheckTransition =>
                    case currentState is
                        when STATE_Initial =>
                            if (true) then
                                targetState <= STATE_NoShutdown;
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
                        when STATE_NoShutdown =>
                            if (txBusy = '1') then
                                targetState <= STATE_ShutdownSent;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_SetNoDecoding =>
                            if (txBusy = '1') then
                                targetState <= STATE_NoDecodingSent;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_SetIntensity =>
                            if (txBusy = '1') then
                                targetState <= STATE_IntensitySent;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_AllDigitsOn =>
                            if (txBusy = '1') then
                                targetState <= STATE_EnableDigitsSent;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_DisableDisplayTest =>
                            if (txBusy = '1') then
                                targetState <= STATE_DisplayTestSent;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_LatchData =>
                            if (true) then
                                targetState <= STATE_SendBit;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_SendBit =>
                            if (txBusy = '1') then
                                targetState <= STATE_DataSend;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_Wait =>
                            if (i > x"30D4") then
                                targetState <= STATE_CheckIfDifferent;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_CheckIfDifferent =>
                            if (latchedDigit /= digit) then
                                targetState <= STATE_LatchData;
                                internalState <= OnExit;
                            elsif (latchedData /= data) and (not (latchedDigit /= digit)) then
                                targetState <= STATE_LatchData;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_ShutdownSent =>
                            if (txBusy = '0') then
                                targetState <= STATE_SetNoDecoding;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_NoDecodingSent =>
                            if (txBusy = '0') then
                                targetState <= STATE_SetIntensity;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_IntensitySent =>
                            if (txBusy = '0') then
                                targetState <= STATE_AllDigitsOn;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_EnableDigitsSent =>
                            if (txBusy = '0') then
                                targetState <= STATE_DisableDisplayTest;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_DisplayTestSent =>
                            if (txBusy = '0') then
                                targetState <= STATE_LatchData;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_DataSend =>
                            if (txBusy = '0') then
                                targetState <= STATE_Wait;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when others =>
                            null;
                    end case;
                when Internal =>
                    case currentState is
                        when STATE_Wait =>
                            i <= i + 1;
                        when STATE_DataSend =>
                            i <= i + 1;
                        when others =>
                            null;
                    end case;
                    internalState <= WriteSnapshot;
                when OnExit =>
                    case currentState is
                        when STATE_CheckIfDifferent =>
                            busy <= '1';
                        when STATE_DataSend =>
                            i <= i + 1;
                        when others =>
                            null;
                    end case;
                    internalState <= WriteSnapshot;
                when WriteSnapshot =>
                    EXTERNAL_dataLine <= dataLine;
                    EXTERNAL_busy <= busy;
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