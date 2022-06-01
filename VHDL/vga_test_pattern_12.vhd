----------------------------------------------------------------------------------
-- Engineer:		E.W. Hansen, after an original design by J. Graham Keggi
-- 
-- Create Date:	15:10:36 07/12/2010 
-- Module Name:	vga_test_pattern - Behavioral
-- Target Device:	Basys 3 (Artix 7)
--
-- Description:	 Lookup table, receives 10 bit pixel address for 640x480 VGA display
--		and outputs 12-bit SMPTE test pattern
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity vga_test_pattern is
	port(	row, column			: in  std_logic_vector( 4 downto 0);
			color				: out std_logic_vector(11 downto 0) );
end vga_test_pattern;

architecture Behavioral of vga_test_pattern is
	
	-- Predefined 12-bit colors that nearly match real test pattern colors
	-- SMPTE 75% color bars
    constant WHITE      : std_logic_vector(11 downto 0) := "110011001100";
    constant YELLOW     : std_logic_vector(11 downto 0) := "110011000000";
    constant CYAN       : std_logic_vector(11 downto 0) := "000011001100";
    constant GREEN      : std_logic_vector(11 downto 0) := "000011000000";
    constant MAGENTA    : std_logic_vector(11 downto 0) := "110000001100";
    constant RED        : std_logic_vector(11 downto 0) := "110000000000";
    constant BLUE       : std_logic_vector(11 downto 0) := "000000001100";

    constant WHITE100   : std_logic_vector(11 downto 0) := "111111111111";  -- 100% white
    constant BLACK      : std_logic_vector(11 downto 0) := "000000000000";
    constant BLACK75    : std_logic_vector(11 downto 0) := "000100010001";  -- 7.5% black
    constant GRAY0      : std_logic_vector(11 downto 0) := "010001000100";
    constant GRAY1      : std_logic_vector(11 downto 0) := "100010001000";
    constant DARK_BLU   : std_logic_vector(11 downto 0) := "000001001000";
    constant DARK_PUR   : std_logic_vector(11 downto 0) := "010000001000";

	signal urow, ucolumn: unsigned(4 downto 0);
	
begin

urow <= unsigned(row); 
ucolumn <= unsigned(column);

pixel_color: process(urow, ucolumn)
begin	
		-- large vertical color bands, evenly spaced horizontally, 320px vertically
		-- Gray, yellow, cyan, green, purple, red, blue
		if (ucolumn < 11) or (ucolumn >= 21) or (urow < 2) or (urow >= 23) then
			color <= BLACK;
		elsif ((ucolumn >= 15) and (ucolumn < 16)) and ((urow >= 5) and (urow < 9)) then
		      color <= CYAN;
		else
			color <= WHITE;
		end if;
end process pixel_color;

end Behavioral;
