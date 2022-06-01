----------------------------------------------------------------------------------
-- Company: Dartmouth College
-- Engineer: Nestor Orozco-Llamas and Jason Rickenbacher
-- 
-- Create Date: 05/25/2022 11:32:16 PM
-- Design Name: 
-- Module Name: down_counter - Behavioral
-- Project Name: Tetris
-- Target Devices: Basys 3 (Artix 7)
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

entity down_counter is
  Port (
        clk : in std_logic;
        down_count_clr, down_count_en, down_pressed : in std_logic;
        clear_line_port : in std_logic;
        score : in STD_LOGIC_VECTOR(15 downto 0);
        currently_playing_port : in std_logic;
        down_triggered : out std_logic
  );
end down_counter;

architecture Behavioral of down_counter is

signal count_cleared_lines : unsigned(3 downto 0) := (others => '0');
signal down_count, compare_count, tc_from_cleared_lines : unsigned(5 downto 0) := (others => '0');
signal down_tc, count_cleared_lines_tc : std_logic := '0';
signal score_signal : unsigned(15 downto 0) := (others => '0');
begin

counter: process(clk)
begin

    if rising_edge(clk) then
        if (down_count_en = '1') and (down_tc = '0') then
            down_count <= down_count + 1;
        end if;
        
        if down_count_clr = '1' then
            down_count <= (others => '0');
        end if;
        
        if (currently_playing_port = '0') then
            tc_from_cleared_lines <= "110000";
            count_cleared_lines <= (others => '0');
        elsif clear_line_port = '1' then
            if (count_cleared_lines_tc = '1') and (tc_from_cleared_lines > 0) then
                    if score_signal >= 90 then
                        tc_from_cleared_lines <= tc_from_cleared_lines - 2;
                    else 
                        tc_from_cleared_lines <= tc_from_cleared_lines - 5;
                    end if;
                count_cleared_lines <= (others => '0');
            else
                count_cleared_lines <= count_cleared_lines + 1;
            end if;
        
        end if;
        
    end if;
    

end process;

compare_count <= tc_from_cleared_lines when (down_pressed = '0' or tc_from_cleared_lines <= "000001") else
                 "000001";

count_cleared_lines_tc <= '1' when (count_cleared_lines = 10) else '0';
                 
down_tc <= '1' when down_count >= compare_count else
           '0';
score_signal <= unsigned(score);           
down_triggered <= down_tc;

end Behavioral;
