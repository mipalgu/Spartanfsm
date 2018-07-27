library IEEE;
use IEEE.std_logic_1164.All;

entity CellularAutomaton is
    port (
        clk: in std_logic;
        EXTERNAL_north: in std_logic;
        EXTERNAL_east: in std_logic;
        EXTERNAL_south: in std_logic;
        EXTERNAL_west: in std_logic;
        EXTERNAL_status: out std_logic;
        EXTERNAL_defaultStatus: in std_logic;
        EXTERNAL_northEast: in std_logic;
        EXTERNAL_southEast: in std_logic;
        EXTERNAL_southWest: in std_logic;
        EXTERNAL_northWest: in std_logic
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
    signal previousRinglet: std_logic_vector(2 downto 0);
    --Snapshot of External Variables
    signal north: std_logic;
    signal east: std_logic;
    signal south: std_logic;
    signal west: std_logic;
    signal status: std_logic;
    signal defaultStatus: std_logic;
    signal northEast: std_logic;
    signal southEast: std_logic;
    signal southWest: std_logic;
    signal northWest: std_logic;
    --Machine Variables
    signal count: integer := 0;
    signal i: integer := 0;
begin
process (clk)
    begin
        if (rising_edge(clk)) then
            case currentState is
                when STATE_Initial =>
                    case internalState is
                        when OnEntry =>
                            status <= defaultStatus;
                            internalState <= CheckTransition;
                        when Internal =>
                            internalState <= WriteFromSnapshot;
                        when OnExit =>
                            internalState <= WriteFromSnapshot;
                        when WriteFromSnapshot =>
                            EXTERNAL_status <= status;
                            internalState <= ReadToSnapshot;
                            previousRinglet <= currentState;
                            currentState <= targetState;
                        when others =>
                            null;
                    end case;
                when STATE_TurnOn =>
                    case internalState is
                        when OnEntry =>
                            status <= '1';
                            internalState <= CheckTransition;
                        when Internal =>
                            internalState <= WriteFromSnapshot;
                        when OnExit =>
                            internalState <= WriteFromSnapshot;
                        when WriteFromSnapshot =>
                            EXTERNAL_status <= status;
                            internalState <= ReadToSnapshot;
                            previousRinglet <= currentState;
                            currentState <= targetState;
                        when others =>
                            null;
                    end case;
                when STATE_Wait =>
                    case internalState is
                        when OnEntry =>
                            i <= 0;
                            internalState <= CheckTransition;
                        when Internal =>
                            i <= i + 1;
                            internalState <= WriteFromSnapshot;
                        when OnExit =>
                            internalState <= WriteFromSnapshot;
                        when WriteFromSnapshot =>
                            EXTERNAL_status <= status;
                            internalState <= ReadToSnapshot;
                            previousRinglet <= currentState;
                            currentState <= targetState;
                        when others =>
                            null;
                    end case;
                when STATE_TurnOff =>
                    case internalState is
                        when OnEntry =>
                            status <= '0';
                            internalState <= CheckTransition;
                        when Internal =>
                            internalState <= WriteFromSnapshot;
                        when OnExit =>
                            internalState <= WriteFromSnapshot;
                        when WriteFromSnapshot =>
                            EXTERNAL_status <= status;
                            internalState <= ReadToSnapshot;
                            previousRinglet <= currentState;
                            currentState <= targetState;
                        when others =>
                            null;
                    end case;
                when STATE_CountNeighbours =>
                    case internalState is
                        when OnEntry =>
                            count <= 0;
                            if (north = '1') then
                            	count <= count + 1;
                            end if;
                            if (east = '1') then
                            	count <= count + 1;
                            end if;
                            if (south = '1') then
                            	count <= count + 1;
                            end if;
                            if (west = '1') then
                            	count <= count + 1;
                            end if;
                            if (northEast = '1') then
                            	count <= count + 1;
                            end if;
                            if (southEast = '1') then
                            	count <= count + 1;
                            end if;
                            if (southWest = '1') then
                            	count <= count + 1;
                            end if;
                            if (northWest = '1') then
                            	count <= count + 1;
                            end if;
                            internalState <= CheckTransition;
                        when Internal =>
                            internalState <= WriteFromSnapshot;
                        when OnExit =>
                            internalState <= WriteFromSnapshot;
                        when WriteFromSnapshot =>
                            EXTERNAL_status <= status;
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
                            internalState <= Internal;
                        when STATE_TurnOn =>
                            if (true) then
                                targetState <= STATE_Wait;
                                internalState <= OnExit;
                            else
                                internalState <= Internal;
                            end if;
                        when STATE_Wait =>
                            if (i >= 100) then
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
                            if (count = 3) then
                                targetState <= STATE_TurnOn;
                                internalState <= OnExit;
                            elsif (status = '1' and count = 2) and (not (count = 3)) then
                                targetState <= STATE_TurnOn;
                                internalState <= OnExit;
                            elsif (true) and (not (status = '1' and count = 2)) and (not (count = 3)) then
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
                    defaultStatus <= EXTERNAL_defaultStatus;
                    northEast <= EXTERNAL_northEast;
                    southEast <= EXTERNAL_southEast;
                    southWest <= EXTERNAL_southWest;
                    northWest <= EXTERNAL_northWest;
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