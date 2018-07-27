library IEEE;
use IEEE.std_logic_1164.All;
use IEEE.numeric_std.all;

entity CellularAutomaton is
    port (
        clk: in std_logic;
        EXTERNAL_north: in std_logic;
        EXTERNAL_east: in std_logic;
        EXTERNAL_south: in std_logic;
        EXTERNAL_west: in std_logic;
        EXTERNAL_statusOut: out std_logic;
        EXTERNAL_statusIn: in std_logic;
        EXTERNAL_northEast: in std_logic;
        EXTERNAL_southEast: in std_logic;
        EXTERNAL_southWest: in std_logic;
        EXTERNAL_northWest: in std_logic;
        EXTERNAL_defaultStatus: in std_logic
    );
end CellularAutomaton;

architecture LLFSM of CellularAutomaton is
    --Internal State Representation Bits
    constant OnEntry: std_logic_vector(2 downto 0) := "000";
    constant CheckTransition: std_logic_vector(2 downto 0) := "001";
    constant OnExit: std_logic_vector(2 downto 0) := "010";
    constant Internal: std_logic_vector(2 downto 0) := "011";
    constant ReadToSnapshot: std_logic_vector(2 downto 0) := "100";
    constant WriteFromSnapshot: std_logic_vector(2 downto 0) := "101";
    signal internalState: std_logic_vector(2 downto 0) := ReadToSnapshot;
    --State Representation Bits
    constant STATE_Initial: std_logic_vector(2 downto 0) := "000";
    constant STATE_TurnOn: std_logic_vector(2 downto 0) := "001";
    constant STATE_Wait: std_logic_vector(2 downto 0) := "010";
    constant STATE_TurnOff: std_logic_vector(2 downto 0) := "011";
    constant STATE_CountNeighbours: std_logic_vector(2 downto 0) := "100";
    signal currentState: std_logic_vector(2 downto 0) := STATE_Initial;
    signal targetState: std_logic_vector(2 downto 0) := currentState;
    signal previousRinglet: std_logic_vector(2 downto 0) := STATE_Initial xor "111";
    --Snapshot of External Variables
    signal north: std_logic;
    signal east: std_logic;
    signal south: std_logic;
    signal west: std_logic;
    signal statusOut: std_logic;
    signal statusIn: std_logic;
    signal northEast: std_logic;
    signal southEast: std_logic;
    signal southWest: std_logic;
    signal northWest: std_logic;
    signal defaultStatus: std_logic;
    --Machine Variables
    signal count: unsigned(3 downto 0) := "0000";
    signal i: unsigned(22 downto 0);
    signal j: unsigned(3 downto 0) := "0000";
begin
process (clk)
    begin
        if (rising_edge(clk)) then
            case currentState is
                when STATE_Initial =>
                    case internalState is
                        when OnEntry =>
                            statusOut <= defaultStatus;
                            j <= "0000";
                            internalState <= CheckTransition;
                        when Internal =>
                            j <= j + "0001";
                            internalState <= WriteFromSnapshot;
                        when OnExit =>
                            internalState <= WriteFromSnapshot;
                        when WriteFromSnapshot =>
                            EXTERNAL_statusOut <= statusOut;
                            internalState <= ReadToSnapshot;
                            previousRinglet <= currentState;
                            currentState <= targetState;
                        when others =>
                            null;
                    end case;
                when STATE_TurnOn =>
                    case internalState is
                        when OnEntry =>
                            statusOut <= '1';
                            internalState <= CheckTransition;
                        when Internal =>
                            internalState <= WriteFromSnapshot;
                        when OnExit =>
                            internalState <= WriteFromSnapshot;
                        when WriteFromSnapshot =>
                            EXTERNAL_statusOut <= statusOut;
                            internalState <= ReadToSnapshot;
                            previousRinglet <= currentState;
                            currentState <= targetState;
                        when others =>
                            null;
                    end case;
                when STATE_Wait =>
                    case internalState is
                        when OnEntry =>
                            i <= (others => '0');
                            internalState <= CheckTransition;
                        when Internal =>
                            i <= i + "00000000000000000000001";
                            internalState <= WriteFromSnapshot;
                        when OnExit =>
                            internalState <= WriteFromSnapshot;
                        when WriteFromSnapshot =>
                            EXTERNAL_statusOut <= statusOut;
                            internalState <= ReadToSnapshot;
                            previousRinglet <= currentState;
                            currentState <= targetState;
                        when others =>
                            null;
                    end case;
                when STATE_TurnOff =>
                    case internalState is
                        when OnEntry =>
                            statusOut <= '0';
                            internalState <= CheckTransition;
                        when Internal =>
                            internalState <= WriteFromSnapshot;
                        when OnExit =>
                            internalState <= WriteFromSnapshot;
                        when WriteFromSnapshot =>
                            EXTERNAL_statusOut <= statusOut;
                            internalState <= ReadToSnapshot;
                            previousRinglet <= currentState;
                            currentState <= targetState;
                        when others =>
                            null;
                    end case;
                when STATE_CountNeighbours =>
                    case internalState is
                        when OnEntry =>
                            count <= "0000" + ("000" & north) + ("000" & northEast) + ("000" & east)
                            	+ ("000" & southEast) + ("000" & south) + ("000" & southWest)
                            	+ ("000" & west) + ("000" & northWest);
                            internalState <= CheckTransition;
                        when Internal =>
                            internalState <= WriteFromSnapshot;
                        when OnExit =>
                            internalState <= WriteFromSnapshot;
                        when WriteFromSnapshot =>
                            EXTERNAL_statusOut <= statusOut;
                            internalState <= ReadToSnapshot;
                            previousRinglet <= currentState;
                            currentState <= targetState;
                        when others =>
                            null;
                    end case;
                when others =>
                    null;
            end case;
        end if;
        if (falling_edge(clk)) then
            case internalState is
                when CheckTransition =>
                    case currentState is
                        when STATE_Initial =>
                            if (j >= "1010") then
                                targetState <= STATE_CountNeighbours;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_TurnOn =>
                            if (true) then
                                targetState <= STATE_Wait;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_Wait =>
                            if (i >= "10000000000000000000000") then
                                targetState <= STATE_CountNeighbours;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_TurnOff =>
                            if (true) then
                                targetState <= STATE_Wait;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_CountNeighbours =>
                            if (count = "0011") then
                                targetState <= STATE_TurnOn;
                                internalState <= OnExit;
                            elsif (statusIn = '1' and count = "0010") and (not (count = "0011")) then
                                targetState <= STATE_TurnOn;
                                internalState <= OnExit;
                            elsif (true) and (not (statusIn = '1' and count = "0010")) and (not (count = "0011")) then
                                targetState <= STATE_TurnOff;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when others =>
                            null;
                    end case;
                when ReadToSnapshot =>
                    north <= EXTERNAL_north;
                    east <= EXTERNAL_east;
                    south <= EXTERNAL_south;
                    west <= EXTERNAL_west;
                    statusIn <= EXTERNAL_statusIn;
                    northEast <= EXTERNAL_northEast;
                    southEast <= EXTERNAL_southEast;
                    southWest <= EXTERNAL_southWest;
                    northWest <= EXTERNAL_northWest;
                    defaultStatus <= EXTERNAL_defaultStatus;
                    if (previousRinglet = currentState) then
                        internalState <= CheckTransition;
                    else
                        internalState <= OnEntry;
                    end if;
                when others =>
                    null;
            end case;
        end if;
    end process;
end LLFSM;