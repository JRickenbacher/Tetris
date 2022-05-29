----------------------------------------------------------------------------------
-- Company: Dartmouth College
-- Engineer: Nestor Orozco-Llamas
--
-- Create Date: 05/28/2022 04:17:29 PM
-- Design Name:
-- Module Name: check_lines - Behavioral
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

entity check_lines is
  Port ( clk         : in STD_LOGIC;
         MEM_DATA    : in STD_LOGIC_VECTOR(3 downto 0);
         CHECK_LINES : in STD_LOGIC;
         clear_lines_en : in STD_LOGIC;      
         MEM_ADDRESS : out STD_LOGIC_VECTOR(9 downto 0);
         GRID_ADDRESS : out STD_LOGIC_VECTOR(7 downto 0);
         CLEAR_LINES : out STD_LOGIC;
         GAME_GRID_IN : out STD_LOGIC_VECTOR(3 downto 0)
         );
end check_lines;

architecture Behavioral of check_lines is


signal col_count : unsigned(4 downto 0) := "01011";
signal row_count : unsigned(4 downto 0) := "10110";
signal game_grid_count, grid_instant_address : unsigned(7 downto 0) := (others => '0');
signal col_count_tc, next_col_count_tc, curr_col_count_tc,delayed_col_count_tc, is_empty, full_row : STD_LOGIC := '0';
signal current_row : STD_LOGIC_VECTOR(9 downto 0) := (others=> '0' );
signal shift_reg : STD_LOGIC_VECTOR(8 downto 0) := (others=> '0' );

signal clear_line, game_grid_count_tc, check_line_reg, clear_lines_en_reg, CLR_CHECK_CNTS : STD_LOGIC := '0';
signal next_grid_address, CURR_GRID_ADDRESS: STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
signal CURR_MEM_ADDRESS,next_MEM_address, DELAYED_MEM_ADDRESS,DELAYED_MEM_ADDRESS_w: STD_LOGIC_VECTOR(9 downto 0) := (others => '0');
signal clear_lines_signal : STD_LOGIC := '0';
signal next_shift_en, delayed_shift_en,clr_grid_count : STD_LOGIC := '0';

begin

counter : process(clk)
begin

if rising_edge(clk) then

    --Column Count Address for game grid
    if col_count_tc = '1' or CLR_CHECK_CNTS = '1' then
        col_count <= "01011";
    elsif CHECK_LINES = '1' or clear_lines_en = '1' then
        col_count <= col_count + 1;
    end if;
   
    --ROW Count Address for game grid
    if CLR_CHECK_CNTS = '1' then
        row_count <= "10110";
    elsif col_count_tc = '1' and row_count > 2 then
        row_count <= row_count - 1;
    end if;
   
    if CLR_CHECK_CNTS = '1' or game_grid_count_tc = '1' then
        game_grid_count <= "00000000";
    elsif clear_line = '1' and check_lines  = '1' then
        game_grid_count <= game_grid_count - 11;
    elsif CHECK_LINES = '1' or clear_lines_en = '1' then
        game_grid_count <= game_grid_count + 1;
    end if;


end if;
end process counter;


datapath : process(clk)
begin

if rising_edge(clk) then


    shift_reg <= not(is_empty) & current_row(8 downto 1);
   
    next_col_count_tc <= col_count_tc;
    curr_col_count_tc <= next_col_count_tc;
    delayed_col_count_tc <= curr_col_count_tc;
   
    NEXT_GRID_ADDRESS <= STD_LOGIC_VECTOR(game_grid_count);
    CURR_GRID_ADDRESS <= NEXT_GRID_ADDRESS;

    CURR_MEM_ADDRESS <= STD_LOGIC_VECTOR(row_count) & STD_LOGIC_VECTOR(col_count);
    NEXT_MEM_ADDRESS <= CURR_MEM_ADDRESS;

    --for monopulse signals
    check_line_reg <= check_lines;
    clear_lines_en_reg <= clear_lines_en;
    delayed_col_count_tc <= clear_line;

   
    if check_lines = '0' then
        clear_lines_signal <= '0';
    else
        clear_lines_signal <= (clear_lines_signal or clear_line);
    end if;
   

end if;

end process datapath;

current_row <= not(is_empty) & shift_reg;
is_empty <= '1' when (MEM_DATA = "0000") else '0';
full_row <= '1' when (current_row = "1111111111") else '0';
clear_line <= full_row when (curr_col_count_tc = '1') else '0';

CLEAR_LINES <= clear_lines_signal;
GAME_GRID_IN <= MEM_DATA when (CHECK_LINES = '1') else "0000";

MEM_ADDRESS <= (STD_LOGIC_VECTOR(row_count) & STD_LOGIC_VECTOR(col_count)) when (check_lines = '1') else NEXT_MEM_ADDRESS;
GRID_ADDRESS <= STD_LOGIC_VECTOR(game_grid_count) when (delayed_col_count_tc = '1') else
                STD_LOGIC_VECTOR(game_grid_count) when (check_lines = '0' or clear_lines_signal = '1')
                else CURR_GRID_ADDRESS;

grid_instant_address <= game_grid_count - 11;

CLR_CHECK_CNTS <= (not(check_line_reg) and check_lines) or (not(clear_lines_en_reg) and clear_lines_en);

col_count_tc <= '1' when (col_count = 20) else '0';
game_grid_count_tc <= '1' when (game_grid_count = 209) else '0';

end Behavioral;