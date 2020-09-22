--SevenSegmentTester.vhd
--
--This is a generated file - DO NOT ALTER.
--Please use an LLFSM editor to change this file.
--Date Generated: 2020-06-29 01:36 EDT
--

library IEEE;
use IEEE.std_logic_1164.All;
use IEEE.numeric_std.all;

entity SevenSegmentTester is
    port (
        clk: in std_logic;
        EXTERNAL_dataLine: out std_logic;
        EXTERNAL_slaveClk: in std_logic;
        EXTERNAL_cs: out std_logic
    );
end SevenSegmentTester;

architecture LLFSM of SevenSegmentTester is
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
    constant STATE_ResetDigit: std_logic_vector(2 downto 0) := "010";
    constant STATE_InitialPseudoState: std_logic_vector(2 downto 0) := "011";
    constant STATE_SendData: std_logic_vector(2 downto 0) := "100";
    constant STATE_CheckDigit: std_logic_vector(2 downto 0) := "101";
    signal currentState: std_logic_vector(2 downto 0) := STATE_Initial;
    signal targetState: std_logic_vector(2 downto 0) := currentState;
    signal previousRinglet: std_logic_vector(2 downto 0) := STATE_Initial xor "111";
    --Snapshot of External Variables
    signal dataLine: std_logic;
    signal slaveClk: std_logic;
    signal cs: std_logic;
    --Machine Variables
    signal data: std_logic_vector(7 downto 0);
    signal digit: std_logic_vector(3 downto 0);
    signal busy: std_logic;

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
	 
begin

	display: DisplayGateway port map (
		clk,
		dataLine,
		data,
		digit,
		busy,
		cs,
		slaveClk
	);


process (clk)
    begin
        if (rising_edge(clk)) then
            case internalState is
                when ReadSnapshot =>
                    slaveClk <= EXTERNAL_slaveClk;
                    if (previousRinglet = currentState) then
                        internalState <= NoOnEntry;
                    else
                        internalState <= OnEntry;
                    end if;
                when OnEntry =>
                    case currentState is
                        when STATE_ResetDigit =>
                            digit <= (others => '0');
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
                            if (busy = '0') then
                                targetState <= STATE_SendData;
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
                        when STATE_SendData =>
                            if (busy = '1') then
                                targetState <= STATE_CheckDigit;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_CheckDigit =>
                            if (digit = x"7") then
                                targetState <= STATE_ResetDigit;
                                internalState <= OnExit;
                            elsif (busy = '0') and (not (digit = x"7")) then
                                targetState <= STATE_SendData;
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
                        when STATE_Initial =>
                            data <= x"09";
                        when STATE_SendData =>
                            digit <= std_logic_vector(unsigned(digit) + 1);
                        when others =>
                            null;
                    end case;
                    internalState <= WriteSnapshot;
                when NoOnEntry =>
                    internalState <= CheckTransition;
                when WriteSnapshot =>
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