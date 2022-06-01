----------------------------------------------------------------------------------
-- Company: Dartmouth College
-- Engineers: Jason Rickenbacher and Nestor Orozco-Llamas
-- 
-- Create Date: 05/29/2022 03:52:24 PM
-- Design Name: 
-- Module Name: Get_Drawing_Color - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Get_Drawing_Color is
  Port (
        drawing_addr_port : in std_logic_vector(9 downto 0);
        drawing_number_port : in std_logic_vector(1 downto 0);
        color_port : out std_logic_vector(3 downto 0)
  );
end Get_Drawing_Color;

architecture Behavioral of Get_Drawing_Color is

signal row, col : unsigned(4 downto 0);
constant top_row_tetris : unsigned(4 downto 0) := "00110";

constant top_row_game : unsigned(4 downto 0) := "00110";
constant top_row_over : unsigned(4 downto 0) := "01101";


begin

get_color_proc: process(row, col, drawing_number_port)
begin

    --Draw TETRIS!
    if drawing_number_port = "00" then
        color_port <= "1000"; --background
        
        --T (RED, "0110")
        if (row = top_row_tetris) AND (col >= 2 AND col <= 4) then
            color_port <= "0110";
        elsif (row >= top_row_tetris AND row <= top_row_tetris + 4) AND (col = 3) then
            color_port <= "0110";
        
        --E (ORANGE, "0100")
        elsif (row >= top_row_tetris AND row <= top_row_tetris + 4) AND (col = 6) then
            color_port <= "0100";
        elsif (col = 7 OR col = 8) AND (row = top_row_tetris OR row = top_row_tetris + 4) then
            color_port <= "0100";
        elsif (col = 7) AND (row = top_row_tetris + 2) then
            color_port <= "0100";
        
        --T (YELLOW, "0010")
        elsif (row = top_row_tetris) AND (col >= 10 AND col <= 12) then
            color_port <= "0010";
        elsif (row >= top_row_tetris AND row <= top_row_tetris + 4) AND (col = 11) then
            color_port <= "0010";
        
        --R (GREEN, "0101")
        elsif (row >= top_row_tetris AND row <= top_row_tetris + 4) AND (col = 14) then
            color_port <= "0101";
        elsif (col = 15 OR col = 16) AND (row = top_row_tetris OR row = top_row_tetris + 2) then
            color_port <= "0101";
        elsif (col = 17) AND (row = top_row_tetris + 1 OR row = top_row_tetris + 3 OR row = top_row_tetris + 4) then
            color_port <= "0101";
        
        --I (Blue, "0001")
        elsif (row >= top_row_tetris AND row <= top_row_tetris + 4) AND (col = 20) then
            color_port <= "0001";
        elsif (col = 19 OR col = 21) AND (row = top_row_tetris OR row = top_row_tetris + 4) then
            color_port <= "0001";
            
        --S (Indigo, "0011")
        elsif (col = 24 OR col = 25 OR col = 26) AND (row = top_row_tetris) then
            color_port <= "0011";
        elsif (col = 23) AND (row = top_row_tetris + 1) then
            color_port <= "0011";
        elsif (col = 24 OR col = 25) AND (row = top_row_tetris + 2) then
            color_port <= "0011";
        elsif (col = 26) AND (row = top_row_tetris + 3) then
            color_port <= "0011";
        elsif (col = 23 OR col = 24 OR col = 25) AND (row = top_row_tetris + 4) then
            color_port <= "0011";
            
        --! (Violet, "0111")
        elsif (row >= top_row_tetris AND row <= top_row_tetris + 2) AND (col = 29) then
            color_port <= "0111";
            
        elsif (row = top_row_tetris + 4) AND (col = 29) then
            color_port <= "0111";
            
        end if;
    
    --Draw GAMEBOARD
    elsif drawing_number_port = "01" then
        color_port <= "1000"; --background
        
        if (col >= 11) AND (col <= 20) AND (row >= 2) AND (row <= 22) then
            color_port <= "0000";
        end if;
    
    --Draw GAMEOVER
    else
        color_port <= "1000"; --background
        
        --G
        if (row = top_row_game) AND (col = 5 OR col = 6 OR col = 7) then
            color_port <= "0110";
            
        elsif (row = top_row_game + 1 OR row = top_row_game + 2 OR row = top_row_game + 3) AND (col = 4) then
            color_port <= "0110";
            
        elsif (row = top_row_game + 4) AND (col = 5 OR col = 6 OR col = 7) then
            color_port <= "0110";
            
        elsif (row = top_row_game + 2) AND (col = 6 OR col = 7) then
            color_port <= "0110";
            
        elsif (row = top_row_game + 3) AND (col = 7) then
            color_port <= "0110";
            
        --A
        elsif (row = top_row_game) AND (col = 11 OR col = 12 OR col = 13) then
            color_port <= "0110";
            
        elsif (row = top_row_game + 1 OR row = top_row_game + 2 OR row = top_row_game + 3 OR row = top_row_game + 4) AND (col = 10) then
            color_port <= "0110";
            
        elsif (row = top_row_game + 1 OR row = top_row_game + 2 OR row = top_row_game + 3 OR row = top_row_game + 4) AND (col = 14) then
            color_port <= "0110";
            
        elsif (row = top_row_game + 2) AND (col = 11 OR col = 12 OR col = 13) then
            color_port <= "0110";
            
        --M
        elsif (row = top_row_game OR row = top_row_game + 1 OR row = top_row_game + 2 OR row = top_row_game + 3 OR row = top_row_game + 4) AND (col = 17) then
            color_port <= "0110";
            
        elsif (row = top_row_game OR row = top_row_game + 1 OR row = top_row_game + 2 OR row = top_row_game + 3 OR row = top_row_game + 4) AND (col = 21) then
            color_port <= "0110";
            
        elsif (row = top_row_game + 1) AND (col = 18 OR col = 20) then
            color_port <= "0110";
            
        elsif (row = top_row_game + 2) AND (col = 19) then
            color_port <= "0110";
            
        --E
        elsif (row = top_row_game OR row = top_row_game + 1 OR row = top_row_game + 2 OR row = top_row_game + 3 OR row = top_row_game + 4) AND (col = 24) then
            color_port <= "0110";
            
        elsif (row = top_row_game OR row = top_row_game + 4) AND (col = 25 OR col = 26 OR col = 27) then
            color_port <= "0110";
            
        elsif (row = top_row_game + 2) AND (col = 25 OR col = 26) then
            color_port <= "0110";
            
        --O
        elsif (row = top_row_over + 1 OR row = top_row_over + 2 OR row = top_row_over + 3) AND (col = 5 OR col = 8) then
            color_port <= "0110";
            
        elsif (row = top_row_over OR row = top_row_over + 4) AND (col = 6 OR col = 7) then
            color_port <= "0110";
            
        --V
        elsif (row = top_row_over OR row = top_row_over + 1 OR row = top_row_over + 2 OR row = top_row_over + 3) AND (col = 11 OR col = 14) then
            color_port <= "0110";
            
        elsif (row = top_row_over + 4) AND (col = 12 OR col = 13) then
            color_port <= "0110";
            
        --E
        elsif (row = top_row_over OR row = top_row_over + 1 OR row = top_row_over + 2 OR row = top_row_over + 3 OR row = top_row_over + 4) AND (col = 17) then
            color_port <= "0110";
            
        elsif (row = top_row_over OR row = top_row_over + 4) AND (col = 18 OR col = 19 OR col = 20) then
            color_port <= "0110";
            
        elsif (row = top_row_over + 2) AND (col = 18 OR col = 19) then
            color_port <= "0110";
            
        --R
        elsif (row = top_row_over OR row = top_row_over + 1 OR row = top_row_over + 2 OR row = top_row_over + 3 OR row = top_row_over + 4) AND (col = 23) then
            color_port <= "0110";
            
        elsif (row = top_row_over OR row = top_row_over + 2) AND (col = 24 OR col = 25) then
            color_port <= "0110";
            
        elsif (row = top_row_over + 1 OR row = top_row_over + 3 OR row = top_row_over + 4) AND (col = 26) then
            color_port <= "0110";
            
        end if;
    
    end if;
    
end process;

row <= unsigned(drawing_addr_port(9 downto 5));
col <= unsigned(drawing_addr_port(4 downto 0));

end Behavioral;
