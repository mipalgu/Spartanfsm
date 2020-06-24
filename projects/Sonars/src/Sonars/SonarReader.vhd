--SonarReader.vhd
--
--This is a generated file - DO NOT ALTER.
--Please use an LLFSM editor to change this file.
--Date Generated: 2020-06-24 10:39 EDT
--

library IEEE;
use IEEE.std_logic_1164.All;
use IEEE.numeric_std.all;

entity SonarReader is
    port (
        clk: in std_logic;
        EXTERNAL_dataLine: out std_logic;
        EXTERNAL_trigger1: out std_logic;
        EXTERNAL_trigger2: out std_logic;
        EXTERNAL_echo1: in std_logic;
        EXTERNAL_echo2: in std_logic;
        EXTERNAL_slaveClk: in std_logic;
        EXTERNAL_cs: out std_logic
    );
end SonarReader;

architecture LLFSM of SonarReader is
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
    constant STATE_ResetDigit: std_logic_vector(4 downto 0) := "00010";
    constant STATE_InitialPseudoState: std_logic_vector(4 downto 0) := "00011";
    constant STATE_ConvertDistance1: std_logic_vector(4 downto 0) := "00100";
    constant STATE_SelectDistance: std_logic_vector(4 downto 0) := "00101";
    constant STATE_CreateSeparator: std_logic_vector(4 downto 0) := "00110";
    constant STATE_ConvertDistance2: std_logic_vector(4 downto 0) := "00111";
    constant STATE_LeastSignificantNibble: std_logic_vector(4 downto 0) := "01000";
    constant STATE_MiddleNibble: std_logic_vector(4 downto 0) := "01001";
    constant STATE_MostSignificantNibble: std_logic_vector(4 downto 0) := "01010";
    constant STATE_CompareDigitSelect: std_logic_vector(4 downto 0) := "01011";
    constant STATE_WaitForEncoder: std_logic_vector(4 downto 0) := "01100";
    constant STATE_WaitToFinish: std_logic_vector(4 downto 0) := "01101";
    constant STATE_EncoderFinished: std_logic_vector(4 downto 0) := "01110";
    constant STATE_SendToDisplay: std_logic_vector(4 downto 0) := "01111";
    constant STATE_WaitForDataToSend: std_logic_vector(4 downto 0) := "10000";
    constant STATE_UpdateDigit: std_logic_vector(4 downto 0) := "10001";
    constant STATE_BCDEncode: std_logic_vector(4 downto 0) := "10010";
    constant STATE_Encoding: std_logic_vector(4 downto 0) := "10011";
    signal currentState: std_logic_vector(4 downto 0) := STATE_Initial;
    signal targetState: std_logic_vector(4 downto 0) := currentState;
    signal previousRinglet: std_logic_vector(4 downto 0) := STATE_Initial xor "11111";
    --Snapshot of External Variables
    signal dataLine: std_logic;
    signal trigger1: std_logic;
    signal trigger2: std_logic;
    signal echo1: std_logic;
    signal echo2: std_logic;
    signal slaveClk: std_logic;
    signal cs: std_logic;
    --Machine Variables
    signal distance1: unsigned(7 downto 0);
    signal distance2: unsigned(7 downto 0);
    signal displayBusy: std_logic;
    signal digit: unsigned(3 downto 0);
    signal output: std_logic_vector(7 downto 0);
    signal bcdData: std_logic_vector(11 downto 0);
    signal bcdOutput:  std_logic_vector(11 downto 0);
    signal sevSegInput: std_logic_vector(3 downto 0);
    signal digitSelect: unsigned(3 downto 0);
    signal sevSegBusy: std_logic;
    signal displayData: std_logic_vector(7 downto 0);
    signal displayDigit: std_logic_vector(3 downto 0);
    signal sevSegOutput: std_logic_vector(6 downto 0);
    signal dataToSend: std_logic_vector(7 downto 0);
    signal bcdInput: std_logic_vector(7 downto 0);
    signal bcdBusy: std_logic;


	 component EightBitBinaryToBCDEncoder is
		port (
			clk: in std_logic;
         EXTERNAL_data: in std_logic_vector(7 downto 0);
         EXTERNAL_busy: out std_logic;
         EXTERNAL_bcd: out std_logic_vector(11 downto 0)
		);
	 end component;
	 
	 component SevenSegmentEncoder is
		port (
			clk: in std_logic;
         EXTERNAL_data: in std_logic_vector(3 downto 0);
         EXTERNAL_sevenSegmentData: out std_logic_vector(6 downto 0);
         EXTERNAL_busy: out std_logic
		);
	 end component;
	 
	 component DisplayGateway is
		port (
			clk: in std_logic;
         EXTERNAL_dataLine: out std_logic;
         EXTERNAL_data: in std_logic_vector(7 downto 0);
         EXTERNAL_digit: in std_logic_vector(3 downto 0);
         EXTERNAL_busy: out std_logic;
         EXTERNAL_cs: out std_logic;
         EXTERNAL_slaveClk: in std_logic
		);
	 end component;
	 
	 component UltrasonicDistanceSensor is
		port (
			clk: in std_logic;
         EXTERNAL_echo: in std_logic;
         EXTERNAL_trigger: out std_logic;
         EXTERNAL_distance: out unsigned(7 downto 0)
		);
	 end component;

begin

	display: DisplayGateway port map (
		clk,
		dataLine,
		displayData,
		displayDigit,
		displayBusy,
		cs,
		slaveClk
	);
	
	sonar1: UltrasonicDistanceSensor port map (
		clk,
		echo1,
		trigger1,
		distance1
	);
	
	sonar2: UltrasonicDistanceSensor port map (
		clk,
		echo2,
		trigger2,
		distance2
	);
	
	bcdEncoder: EightBitBinaryToBCDEncoder port map (
		clk,
		bcdInput,
		bcdBusy,
		bcdOutput
	);
	
	sevSegEncoder: SevenSegmentEncoder port map (
		clk,
		sevSegInput,
		sevSegOutput,
		sevSegBusy
	);

process (clk)
    begin
        if (rising_edge(clk)) then
            case internalState is
                when ReadSnapshot =>
                    echo1 <= EXTERNAL_echo1;
                    echo2 <= EXTERNAL_echo2;
                    slaveClk <= EXTERNAL_slaveClk;
                    if (previousRinglet = currentState) then
                        internalState <= CheckTransition;
                    else
                        internalState <= OnEntry;
                    end if;
                when OnEntry =>
                    case currentState is
                        when STATE_ResetDigit =>
                            digit <= x"0";
                        when STATE_ConvertDistance1 =>
                            bcdInput <= std_logic_vector(distance1);
                            digitSelect <= digit;
                        when STATE_CreateSeparator =>
                            bcdData <= x"0AA";
                            digitSelect <= digit - 3;
                        when STATE_ConvertDistance2 =>
                            bcdInput <= std_logic_vector(distance2);
                            digitSelect <= digit - 5;
                        when STATE_SendToDisplay =>
                            displayData <= dataToSend;
                            displayDigit <= std_logic_vector(digit);
                        when STATE_UpdateDigit =>
                            digit <= digit + 1;
                        when others =>
                            null;
                    end case;
                    internalState <= CheckTransition;
                when CheckTransition =>
                    case currentState is
                        when STATE_Initial =>
                            if (true) then
                                targetState <= STATE_ResetDigit;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_SUSPENDED =>
                            internalState <= Internal;
                        when STATE_ResetDigit =>
                            if (true) then
                                targetState <= STATE_SelectDistance;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_InitialPseudoState =>
                            if (true) then
                                targetState <= STATE_Initial;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_ConvertDistance1 =>
                            if (bcdBusy = '0') then
                                targetState <= STATE_BCDEncode;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_SelectDistance =>
                            if (digit <=2) then
                                targetState <= STATE_ConvertDistance1;
                                internalState <= OnExit;
                            elsif (digit <= 4) and (not (digit <=2)) then
                                targetState <= STATE_CreateSeparator;
                                internalState <= OnExit;
                            elsif (true) and (not (digit <= 4)) and (not (digit <=2)) then
                                targetState <= STATE_ConvertDistance2;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_CreateSeparator =>
                            if (true) then
                                targetState <= STATE_CompareDigitSelect;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_ConvertDistance2 =>
                            if (bcdBusy = '0') then
                                targetState <= STATE_BCDEncode;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_LeastSignificantNibble =>
                            if (sevSegBusy = '0') then
                                targetState <= STATE_WaitForEncoder;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_MiddleNibble =>
                            if (sevSegBusy = '0') then
                                targetState <= STATE_WaitForEncoder;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_MostSignificantNibble =>
                            if (sevSegBusy = '0') then
                                targetState <= STATE_WaitForEncoder;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_CompareDigitSelect =>
                            if (digitSelect = x"0") then
                                targetState <= STATE_LeastSignificantNibble;
                                internalState <= OnExit;
                            elsif (digitSelect = x"1") and (not (digitSelect = x"0")) then
                                targetState <= STATE_MiddleNibble;
                                internalState <= OnExit;
                            elsif (true) and (not (digitSelect = x"1")) and (not (digitSelect = x"0")) then
                                targetState <= STATE_MostSignificantNibble;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_WaitForEncoder =>
                            if (sevSegBusy = '1') then
                                targetState <= STATE_WaitToFinish;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_WaitToFinish =>
                            if (sevSegBusy = '0') then
                                targetState <= STATE_EncoderFinished;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_EncoderFinished =>
                            if (displayBusy = '0') then
                                targetState <= STATE_SendToDisplay;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_SendToDisplay =>
                            if (displayBusy = '1') then
                                targetState <= STATE_WaitForDataToSend;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_WaitForDataToSend =>
                            if (displayBusy = '0') then
                                targetState <= STATE_UpdateDigit;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_UpdateDigit =>
                            if (digit < 7) then
                                targetState <= STATE_SelectDistance;
                                internalState <= OnExit;
                            elsif (true) and (not (digit < 7)) then
                                targetState <= STATE_ResetDigit;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_BCDEncode =>
                            if (bcdBusy = '1') then
                                targetState <= STATE_Encoding;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_Encoding =>
                            if (bcdBusy = '0') then
                                targetState <= STATE_CompareDigitSelect;
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
                        when STATE_LeastSignificantNibble =>
                            sevSegInput <= bcdData(3 downto 0);
                        when STATE_MiddleNibble =>
                            sevSegInput <= bcdData(7 downto 4);
                        when STATE_MostSignificantNibble =>
                            sevSegInput <= bcdData(11 downto 8);
                        when STATE_WaitToFinish =>
                            dataToSend <= "0" & sevSegOutput;
                        when STATE_Encoding =>
                            bcdData<= bcdOutput;
                        when others =>
                            null;
                    end case;
                    internalState <= WriteSnapshot;
                when WriteSnapshot =>
                    EXTERNAL_dataLine <= dataLine;
                    EXTERNAL_trigger1 <= trigger1;
                    EXTERNAL_trigger2 <= trigger2;
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