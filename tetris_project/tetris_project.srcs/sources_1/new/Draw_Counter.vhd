----------------------------------------------------------------------------------
-- Company: Dartmouth College
-- Engineers: Jason Rickenbacher and Nestor Orozco-Llamas
-- 
-- Create Date: 05/29/2022 03:39:01 PM
-- Design Name: 
-- Module Name: Draw_Counter - Behavioral
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

entity Draw_Counter is
  Port (
        clk_port : in std_logic;
        clear_draw_count_port : in std_logic;
        drawing_addr_port : out std_logic_vector(9 downto 0);
        done_drawing_port : out std_logic
  );
end Draw_Counter;

architecture Behavioral of Draw_Counter is

signal col_count, row_count : unsigned(4 downto 0) := (others => '0');

signal col_tc, row_tc : std_logic := '0';

begin

count_proc: process(clk_port)
begin

if rising_edge(clk_port) then
    if clear_draw_count_port = '1' then
        col_count <= (others => '0');
        row_count <= (others => '0');
    else
        if col_tc = '1' then
            col_count <= (others => '0');
            row_count <= row_count + 1;
        else
            col_count <= col_count + 1;
        end if;
    end if;
end if;

end process;

col_tc <= '1' when (col_count = 31) else '0';
row_tc <= '1' when (row_count = 23) else '0';

done_drawing_port <= '1' when ((col_tc = '1') and (row_tc = '1')) else '0';
drawing_addr_port <= std_logic_vector(row_count) & std_logic_vector(col_count);

end Behavioral;
