--SevenSegDisplay.vhd
--
--This is a generated file - DO NOT ALTER.
--Please use an LLFSM editor to change this file.
--Date Generated: 2020-09-11 21:02 AEST
--

library IEEE;
use IEEE.std_logic_1164.All;
use ieee.numeric_std.all;

-- REQUIRES VHDL2008

entity SevenSegDisplay is
    generic (
        N: positive;
        digits: positive
    );
    port (
        clk: in std_logic;
        restart: in std_logic;
        resume: in std_logic;
        suspend: in std_logic;
        suspended: out std_logic;
        EXTERNAL_number: in std_logic_vector(N - 1 downto 0);
        EXTERNAL_sevSegDigits: out std_logic_vector(7 * digits - 1 downto 0)
    );
end SevenSegDisplay;

architecture LLFSM of SevenSegDisplay is
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
    constant STATE_BcdEncode: std_logic_vector(2 downto 0) := "011";
    constant STATE_StartSevSeg: std_logic_vector(2 downto 0) := "100";
    constant STATE_WaitForFinish: std_logic_vector(2 downto 0) := "101";
    signal currentState: std_logic_vector(2 downto 0) := STATE_Initial;
    signal targetState: std_logic_vector(2 downto 0) := currentState;
    signal previousRinglet: std_logic_vector(2 downto 0) := STATE_Initial xor "111";
    signal suspendedFrom: std_logic_vector(2 downto 0) := STATE_Initial;
    --Snapshot of External Variables
    signal number: std_logic_vector(N - 1 downto 0);
    signal sevSegDigits: std_logic_vector(7 * digits - 1 downto 0);
    --Machine Variables
    signal bcdRestart: std_logic := '1';
    signal bcdSuspended: std_logic;
    signal bcdOut: std_logic_vector(digits * 4 - 1 downto 0);
    signal digitsRestart: std_logic := '1';
    signal digitsSuspended: std_logic_vector(digits - 1 downto 0);
    constant allSuspended: std_logic_vector(digits - 1 downto 0) := (others => '1');
    signal digitsSuspend : std_logic;
    signal bcdSuspend: std_logic;
	 
	 component bcd is
		generic (
			N: Integer;
			digits: Integer
		);
		port (
			clk: in std_logic;
			restart: in std_logic;
			resume: in std_logic;
			suspend: in std_logic;
			suspended: out std_logic;
			EXTERNAL_binary: in std_logic_vector(N - 1 downto 0);
			EXTERNAL_bcd: out std_logic_vector(digits * 4 - 1 downto 0)
		);
	end component;
	
	component SevenSegDigit is
		port (
			clk: in std_logic;
			restart: in std_logic;
			resume: in std_logic;
			suspend: in std_logic;
			suspended: out std_logic;
			EXTERNAL_bcd: in std_logic_vector(3 downto 0);
			EXTERNAL_output: out std_logic_vector(6 downto 0)
		);
	end component;
	 
begin

	bcd_gen: bcd generic map (
		N => N,
		digits => digits
	)
	port map (
		clk => clk,
		restart => bcdRestart,
		resume => '0',
		suspend => bcdSuspend,
		suspended => bcdSuspended,
		EXTERNAL_binary => number,
		EXTERNAL_bcd => bcdOut
	);
	
	digit_generation:
	for I in 0 to (digits - 1) generate
		digit: SevenSegDigit port map (
			clk => clk,
			restart => digitsRestart,
			resume => '0',
			suspend => digitsSuspend,
			suspended => digitsSuspended(I),
			EXTERNAL_bcd => bcdOut(I * 4 + 3 downto I * 4),
			EXTERNAL_output => sevSegDigits(I * 7 + 6 downto I * 7)
		);
	end generate digit_generation;

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
                    number <= EXTERNAL_number;
                    if (previousRinglet = currentState) then
                        internalState <= NoOnEntry;
                    else
                        internalState <= OnEntry;
                    end if;
                when OnEntry =>
                    case currentState is
                        when STATE_Initial =>
                            digitsRestart <= '1';
                            digitsSuspend <= '1';
                            bcdRestart <= '1';
                            bcdSuspend <= '1';
                        when STATE_BcdEncode =>
                            bcdRestart <= '1';
                        when STATE_StartSevSeg =>
                            digitsRestart <= '0';
                            digitsSuspend <= '0';
                        when STATE_WaitForFinish =>
                            digitsRestart <= '1';
                        when others =>
                            null;
                    end case;
                    internalState <= CheckTransition;
                when CheckTransition =>
                    case currentState is
                        when STATE_Initial =>
                            if (digitsSuspended = allSuspended and bcdSuspended = '1') then
                                targetState <= STATE_BcdEncode;
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
                        when STATE_BcdEncode =>
                            if (bcdSuspended = '1') then
                                targetState <= STATE_StartSevSeg;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_StartSevSeg =>
                            if (true) then
                                targetState <= STATE_WaitForFinish;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_WaitForFinish =>
                            if (digitsSuspended = allSuspended) then
                                targetState <= STATE_SUSPENDED;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when others =>
                            null;
                    end case;
                when Internal =>
                    case currentState is
                        when STATE_Initial =>
                            digitsRestart <= '1';
                            digitsSuspend <= '1';
                            bcdRestart <= '1';
                            bcdSuspend <= '1';
                        when others =>
                            null;
                    end case;
                    internalState <= WriteSnapshot;
                when OnExit =>
                    case currentState is
                        when STATE_Initial =>
                            bcdRestart <= '0';
                            bcdSuspend <= '0';
                        when others =>
                            null;
                    end case;
                    internalState <= WriteSnapshot;
                when NoOnEntry =>
                    internalState <= CheckTransition;
                when WriteSnapshot =>
                    EXTERNAL_sevSegDigits <= sevSegDigits;
                    internalState <= CheckForSuspension;
                    previousRinglet <= currentState;
                    currentState <= targetState;
                when others =>
                    null;
            end case;
        end if;
    end process;
end LLFSM;