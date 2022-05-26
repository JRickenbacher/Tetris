----------------------------------------------------------------------------------
-- Company: Dartmouth College
-- Engineer: Nestor Orozco-Llamas and Jason Rickenbacher
-- 
-- Create Date: 05/25/2022 10:48:38 PM
-- Design Name: 
-- Module Name: piece_memory - Behavioral
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity piece_memory is
  Port (
        clk: in std_logic;
        next_move_addr_1, next_move_addr_2, next_move_addr_3, next_move_addr_4: in std_logic_vector(9 downto 0);
        next_gen_addr_1, next_gen_addr_2, next_gen_addr_3, next_gen_addr_4: in std_logic_vector(9 downto 0);
        next_rotation : in std_logic_vector(1 downto 0);
        next_piece_number : in std_logic_vector(3 downto 0);
        next_action : in std_logic_vector(1 downto 0);
        
        load_next_move_en, load_next_gen_en, load_new_action_en : in std_logic; 
        
        curr_addr_1, curr_addr_2, curr_addr_3, curr_addr_4: out std_logic_vector(9 downto 0);
        curr_rotation : out std_logic_vector(1 downto 0);
        curr_piece_number: out std_logic_vector(3 downto 0);
        curr_action : out std_logic_vector(1 downto 0)
   );
end piece_memory;

architecture Behavioral of piece_memory is

begin

update_registers: process(clk)
begin

    if rising_edge(clk) then
        
        if load_next_move_en = '1' then
            curr_addr_1 <= next_move_addr_1;
            curr_addr_2 <= next_move_addr_2;
            curr_addr_3 <= next_move_addr_3;
            curr_addr_4 <= next_move_addr_4;
            
            curr_rotation <= next_rotation;
        end if;
        
        if load_next_gen_en = '1' then
            curr_addr_1 <= next_gen_addr_1;
            curr_addr_2 <= next_gen_addr_2;
            curr_addr_3 <= next_gen_addr_3;
            curr_addr_4 <= next_gen_addr_4;
            
            curr_piece_number <= next_piece_number;
        end if;
        
        if load_new_action_en = '1' then
            curr_action <= next_action;
        end if;
        
    end if;

end process;

end Behavioral;
