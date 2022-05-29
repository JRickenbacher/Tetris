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
        down_triggered : out std_logic
  );
end down_counter;

architecture Behavioral of down_counter is

signal down_count, compare_count : unsigned(5 downto 0) := (others => '0');
signal down_tc : std_logic := '0';

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
        
    end if;

end process;

compare_count <= "111100" when down_pressed = '0' else
                 "001000";

--compare_count <= "000001" when down_pressed = '0' else
--                 "000001";
                 
down_tc <= '1' when down_count >= compare_count else
           '0';
           
down_triggered <= down_tc;

end Behavioral;
