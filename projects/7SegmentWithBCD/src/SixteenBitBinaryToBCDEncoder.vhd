--SixteenBitBinaryToBCDEncoder.vhd
--
--This is a generated file - DO NOT ALTER.
--Please use an LLFSM editor to change this file.
--Date Generated: 2020-09-05 23:45 AEST
--

library IEEE;
use IEEE.std_logic_1164.All;
use IEEE.numeric_std.all;

entity SixteenBitBinaryToBCDEncoder is
    port (
        clk: in std_logic;
        EXTERNAL_data: in std_logic_vector(15 downto 0);
        EXTERNAL_busy: out std_logic;
        EXTERNAL_bcd: out std_logic_vector(19 downto 0)
    );
end SixteenBitBinaryToBCDEncoder;

architecture LLFSM of SixteenBitBinaryToBCDEncoder is
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
    constant STATE_SetBusy: std_logic_vector(2 downto 0) := "010";
    constant STATE_InitialPseudoState: std_logic_vector(2 downto 0) := "011";
    constant STATE_SetupVarsForEncoding: std_logic_vector(2 downto 0) := "100";
    constant STATE_EncodeBits: std_logic_vector(2 downto 0) := "101";
    constant STATE_Reset: std_logic_vector(2 downto 0) := "110";
    constant STATE_SetResult: std_logic_vector(2 downto 0) := "111";
    signal currentState: std_logic_vector(2 downto 0) := STATE_Initial;
    signal targetState: std_logic_vector(2 downto 0) := currentState;
    signal previousRinglet: std_logic_vector(2 downto 0) := STATE_Initial xor "111";
    --Snapshot of External Variables
    signal data: std_logic_vector(15 downto 0);
    signal busy: std_logic;
    signal bcd: std_logic_vector(19 downto 0);
    --Machine Variables
    signal bitsShifted: unsigned(3 downto 0);
    signal latchedData: std_logic_vector(15 downto 0);
    signal carryBits: std_logic_vector(4 downto 0);
    signal binary: std_logic;
    signal busyEncoders: std_logic_vector(4 downto 0);
    signal enable: std_logic;
    signal encoderOutputs: std_logic_vector(19 downto 0);
    signal originalData: std_logic_vector(15 downto 0);
    signal reset: std_logic;
begin
process (clk)
    begin
        if (rising_edge(clk)) then
            case internalState is
                when ReadSnapshot =>
                    data <= EXTERNAL_data;
                    if (previousRinglet = currentState) then
                        internalState <= NoOnEntry;
                    else
                        internalState <= OnEntry;
                    end if;
                when OnEntry =>
                    case currentState is
                        when STATE_Initial =>
                            bcd <= (others => '0');
                            latchedData <= (others => '0');
                            originalData <= (others => '0');
                        when STATE_SetBusy =>
                            busy <= '1';
                            reset <= '1';
                        when STATE_SetupVarsForEncoding =>
                            bitsShifted <= bitsShifted + 1;
                            binary <= latchedData(15);
                            latchedData <= latchedData(14 downto 0) & '0';
                            enable <= '1';
                        when STATE_EncodeBits =>
                            enable <= '0';
                        when STATE_Reset =>
                            bitsShifted <= x"0";
                            binary <= '0';
                            enable <= '0';
                            busy <= '0';
                            reset <= '0';
                        when STATE_SetResult =>
                            bcd <= encoderOutputs;
                        when others =>
                            null;
                    end case;
                    internalState <= CheckTransition;
                when CheckTransition =>
                    case currentState is
                        when STATE_Initial =>
                            if (true) then
                                targetState <= STATE_Reset;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_SUSPENDED =>
                            internalState <= Internal;
                        when STATE_SetBusy =>
                            if (true) then
                                targetState <= STATE_SetupVarsForEncoding;
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
                        when STATE_SetupVarsForEncoding =>
                            if (busyEncoders = "11111") then
                                targetState <= STATE_EncodeBits;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_EncodeBits =>
                            if (busyEncoders = "00000" and bitsShifted < 16) then
                                targetState <= STATE_SetupVarsForEncoding;
                                internalState <= OnExit;
                            elsif (busyEncoders = "00000") and (not (busyEncoders = "00000" and bitsShifted < 16)) then
                                targetState <= STATE_SetResult;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_Reset =>
                            if (originalData /= data and busyEncoders = "00000") then
                                targetState <= STATE_SetBusy;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_SetResult =>
                            if (true) then
                                targetState <= STATE_Reset;
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
                        when STATE_Reset =>
                            latchedData <= data;
                            originalData <= data;
                        when others =>
                            null;
                    end case;
                    internalState <= WriteSnapshot;
                when NoOnEntry =>
                    internalState <= CheckTransition;
                when WriteSnapshot =>
                    EXTERNAL_busy <= busy;
                    EXTERNAL_bcd <= bcd;
                    internalState <= ReadSnapshot;
                    previousRinglet <= currentState;
                    currentState <= targetState;
                when others =>
                    null;
            end case;
        end if;
    end process;
end LLFSM;