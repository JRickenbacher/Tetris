----------------------------------------------------------------------------------
-- Company: Dartmouth College
-- Engineer: Nestor Orozco-Llamas and Jason Rickenbacher
-- 
-- Create Date: 05/25/2022 09:20:24 PM
-- Design Name: 
-- Module Name: make_move - Behavioral
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
use IEEE.NUMERIC_STD.ALL;



entity make_move is
  Port (
        clk : in std_logic;
        curr_addr_1, curr_addr_2, curr_addr_3, curr_addr_4 : in std_logic_vector(9 downto 0);
        next_addr_1, next_addr_2, next_addr_3, next_addr_4 : in std_logic_vector(9 downto 0);
        make_move_en : in std_logic;
        curr_piece : in std_logic_vector(3 downto 0);
        update_data : out std_logic_vector(3 downto 0);
        update_addr : out std_logic_vector(9 downto 0)
  );
end make_move;

architecture Behavioral of make_move is

signal addr_count : unsigned(2 downto 0) := "000";

begin

counter: process(clk)
begin
    if rising_edge(clk) then
        if make_move_en = '1' then
            addr_count <= addr_count + 1;
        end if;
    end if;
end process;

update_addr <= curr_addr_1 when (addr_count = "000") else
               curr_addr_2 when (addr_count = "001") else
               curr_addr_3 when (addr_count = "010") else
               curr_addr_4 when (addr_count = "011") else
               next_addr_1 when (addr_count = "100") else
               next_addr_2 when (addr_count = "101") else
               next_addr_3 when (addr_count = "110") else
               next_addr_4;
               
update_data <= curr_piece when (addr_count > 3) else
               "0000";

end Behavioral;