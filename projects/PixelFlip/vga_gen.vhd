----------------------------------------------------------------------------------
-- Engineer: Mike Field <hamster@snap.net.nz>
-- Description: Generates a test 1280x720 signal 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity vga_gen is
    Port ( clk75 : in  STD_LOGIC;
           pclk  : out STD_LOGIC;
           red   : out STD_LOGIC_VECTOR (7 downto 0) := (others => '0');
           green : out STD_LOGIC_VECTOR (7 downto 0) := (others => '0');
           blue  : out STD_LOGIC_VECTOR (7 downto 0) := (others => '0');
           blank : out STD_LOGIC := '0';
           hsync : out STD_LOGIC := '0';
           vsync : out STD_LOGIC := '0'
			  );
end vga_gen;

architecture Behavioral of vga_gen is
   constant h_rez        : natural := 1024;
   constant h_sync_start : natural := 1024+72;
   constant h_sync_end   : natural := 1024+72+112;
   constant h_max        : natural := 1024+72+112+184;
   signal   h_count      : unsigned(11 downto 0) := (others => '0');

   constant v_rez        : natural := 768;
   constant v_sync_start : natural := 768+1;
   constant v_sync_end   : natural := 768+1+3;
   constant v_max        : natural := 768+1+3+42;
   signal   v_count      : unsigned(11 downto 0) := (others => '0');
	
	constant width: integer := 12;
	constant height: integer := 12;
	
	type column is array ((height - 1) downto 0) of std_logic_vector(7 downto 0);
	type screen is array ((width - 1) downto 0) of column;
	
	signal greenOut: screen;
	signal redOut: screen;
	
	component PixelFlip
		Port(
			clk: in std_logic;
         EXTERNAL_redOut: out std_logic_vector(7 downto 0);
         EXTERNAL_greenOut: out std_logic_vector(7 downto 0)
		);
	end component;
begin

	PixelY: for I in 0 to (width - 1) generate
		PixelX: for J in 0 to (height - 1) generate
			PixelFlipGen: PixelFlip port map(
				clk => clk75,
				EXTERNAL_redOut => redOut(i)(j),
				EXTERNAL_greenOut => greenOut(i)(j)
			);			
		end generate PixelX;
	end generate PixelY;
   pclk <= clk75;
   
process(clk75)
   begin
      if rising_edge(clk75) then
			
         if h_count < h_rez and v_count < v_rez then
				if h_count < width and v_count < height then
					red <= redOut(to_integer(h_count))(to_integer(v_count));
					green <= greenOut(to_integer(h_count))(to_integer(v_count));
					blue <= (others => '0');
					blank <= '0';
				else
					red <= (others => '0');
					green <= (others => '0');
					blue <= (others => '1');
					blank <= '0';
				end if;
         else
            red   <= (others => '0');
            green <= (others => '0');
            blue  <= (others => '0');
            blank <= '1';
         end if;

         if h_count >= h_sync_start and h_count < h_sync_end then
            hsync <= '1';
         else
            hsync <= '0';
         end if;
         
         if v_count >= v_sync_start and v_count < v_sync_end then
            vsync <= '1';
         else
            vsync <= '0';
         end if;
         
         if h_count = h_max then
            h_count <= (others => '0');
            if v_count = v_max then
               v_count <= (others => '0');
            else
               v_count <= v_count+1;
            end if;
         else
            h_count <= h_count+1;
         end if;

      end if;
   end process;

end Behavioral;