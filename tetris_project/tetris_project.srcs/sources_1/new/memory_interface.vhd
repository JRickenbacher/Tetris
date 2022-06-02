----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/26/2022 02:21:21 PM
-- Design Name: 
-- Module Name: memory_interface - Behavioral
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

----------------------------------------------------------------------------------
--  MEMORY INTERFACE WAS CREATED IN ORDER TO HANDLE THE LARGE NUMBER OF POSSIBLE 
--  BEING SENT INTO MEMORY THROUGHOUT THE GAME. IT IS ESSENTIALLY A LARGE MULTIPLEXER
--  SPITS OUT ONLY ONE ADDRESS AND ONE INPUT INTO THE MEMORY WHICH IS CONTROLLED BY
--  THE CONTROLLER
----------------------------------------------------------------------------------

entity memory_interface is
  Port (
        -- POSSIBLE ADDRESSES INTO MEMORY
        collision_addr, move_addr, VGA_addr, gen_piece_addr, lines_addr, Drawing_Addr_Port, GAMEOVER_ADDR : in std_logic_vector(9 downto 0);
        -- POSSIBLE DATA INPUTS INTO MEMORY
        move_data, gen_piece_data, lines_data, Drawing_Color_Port : in std_logic_vector(3 downto 0);
        --SELECT SIGNALS
        check_lines, clear_lines_en, write_piece_en, make_move_en, read_collision, video_on, DRAW_EN, CHECK_GAMEOVER_EN : in std_logic;
        -- CURRENT ADDRESS AND DATA GOING TO MEMORY
        addr_out : out std_logic_vector(9 downto 0);
        data_out : out std_logic_vector(3 downto 0)
   );
end memory_interface;

architecture Behavioral of memory_interface is

begin

-- MULTIPLEXER FOR MEMORY ADDRESS
addr_out <= VGA_addr when (video_on = '1') else
            move_addr when (make_move_en = '1') else
            collision_addr when (read_collision = '1') else
            gen_piece_addr when (write_piece_en = '1') else
            lines_addr when (check_lines = '1' or clear_lines_en = '1') else
            Drawing_Addr_Port when (DRAW_EN = '1') else
            GAMEOVER_ADDR WHEN (CHECK_GAMEOVER_EN = '1') ELSE
            (others => '0');
-- MULTIPLEXER FOR MEMORY DATA   
data_out <= move_data when (make_move_en = '1') else
            gen_piece_data when (write_piece_en = '1') else
            lines_data when (check_lines = '1' or clear_lines_en = '1') else
            Drawing_Color_Port when (DRAW_EN = '1') else
            (others => '0');

end Behavioral;
