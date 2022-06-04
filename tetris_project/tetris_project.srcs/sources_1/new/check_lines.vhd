----------------------------------------------------------------------------------
-- Company: Dartmouth College
-- Engineer: Nestor Orozco-Llamas and Jason Rickenbacher
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
use IEEE.NUMERIC_STD.ALL;

----------------------------------------------------------------------------------
--  THE CHECK LINES BLOCK CONTAINS THE LOGIC FOR ITERATING THROUGH THE CURRENT 
--  GAME BOARD AND DETERMINING WHETHER ANY LINES SHOULD BE CLEARED. IF THERE ARE
--  LINES TO BE CLEARED THE CHECK LINES BLOCK UPDATES THE BOARD ACCORDINGLY.
----------------------------------------------------------------------------------

entity check_lines is
  Port ( clk         : in STD_LOGIC;
         MEM_DATA    : in STD_LOGIC_VECTOR(3 downto 0);     -- output of vga memory
         CHECK_LINES : in STD_LOGIC;                        -- check lines stays high when checking lines
         NEW_SCORE : in STD_LOGIC_VECTOR(1 downto 0);       -- Signal that equals "00" when new game begins 
         clear_lines_en : in STD_LOGIC;                     -- clear lines stays high when we need to redraw game board
         MEM_ADDRESS : out STD_LOGIC_VECTOR(9 downto 0);    -- vga memory address input  
         GRID_ADDRESS : out STD_LOGIC_VECTOR(7 downto 0);   -- game grid memory address
         CLEAR_LINES : out STD_LOGIC;                       -- clear lines goes high if there are any lines to clear
         GAME_GRID_IN : out STD_LOGIC_VECTOR(3 downto 0);   -- input data to game grid memory
         check_lines_tc, clear_lines_tc : out STD_LOGIC;    -- terminal counts to determine when to end
         SCORE : out STD_LOGIC_VECTOR(15 downto 0);         -- score count
         clear_line_port : out std_logic             -- clear port
         );
end check_lines;

architecture Behavioral of check_lines is

-- number of times a line was cleared
signal score_count : unsigned(15 downto 0) := (others => '0');

-- memory rows and columns
signal col_count : unsigned(4 downto 0) := "01011"; --11
signal row_count : unsigned(4 downto 0) := "10110"; --22

-- game grid memory counts
signal game_grid_count, fill_in_count: unsigned(7 downto 0) := (others => '0');

--terminal counts
signal col_count_tc, next_col_count_tc, curr_col_count_tc, prev_col_count_tc, row_count_tc, mem_count_tc : STD_LOGIC := '0';

--current row is empty or not represents each bit
signal current_row : STD_LOGIC_VECTOR(9 downto 0) := (others=> '0' );

signal game_grid_count_tc, check_line_reg, clear_lines_en_reg, CLR_CHECK_CNTS : STD_LOGIC := '0';

--addresses
signal next_grid_address, CURR_GRID_ADDRESS: STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
signal CURR_MEM_ADDRESS, next_MEM_address: STD_LOGIC_VECTOR(9 downto 0) := (others => '0');

--control signal
signal clear_line, clear_lines_signal, delayed_clear_line, delayed_clear_line_2, delayed_clear_line_3, is_empty, full_row : STD_LOGIC := '0';

--shift register for data
signal shift_reg : STD_LOGIC_VECTOR(8 downto 0) := (others=> '0' );

begin

vga_memory_counter : process(clk)
begin

if rising_edge(clk) then

    --Column Count Address for game grid
    if col_count_tc = '1' or CLR_CHECK_CNTS = '1' then
        col_count <= "01011";
    elsif delayed_clear_line = '1' and CHECK_LINES = '1' then
        col_count <= col_count - 1;
    elsif (CHECK_LINES = '1' or clear_lines_en = '1') and (delayed_clear_line = '0' and clear_line = '0') then
        col_count <= col_count + 1;
    end if;

   
    --ROW Count Address for game grid
    if CLR_CHECK_CNTS = '1' then
        row_count <= "10110";
    elsif col_count_tc = '1' and row_count > 2 then
        row_count <= row_count - 1;
    end if;
   
    
end if;
end process vga_memory_counter;


game_grid_counter : process(clk)
begin
if rising_edge(clk) then
    -- used to fill grid memory with zeroes when clear_lines_en and check_lines is 0
    fill_in_count <= fill_in_count + 1;
    
    --used to update grid memory
    if CLR_CHECK_CNTS = '1' or game_grid_count_tc = '1' then
        game_grid_count <= "00000000";
    elsif clear_line = '1' and check_lines = '1' then
        game_grid_count <= game_grid_count - 11;
    elsif (CHECK_LINES = '1' or clear_lines_en = '1')  and (clear_line = '0' and delayed_clear_line = '0') then
        game_grid_count <= game_grid_count + 1;
    end if;
end if;
end process game_grid_counter;



datapath : process(clk)
begin

if rising_edge(clk) then

    --shift the not(is_empty) of mem data 
    if (curr_col_count_tc = '1' or clear_line = '1' or delayed_clear_line = '1' or delayed_clear_line_2 = '1') then
        shift_reg <= (others => '0');
    else
        shift_reg <= current_row(9 downto 1);
    end if;
    
   
   --delaying column count tc by two clock cycles
    next_col_count_tc <= col_count_tc;
    curr_col_count_tc <= next_col_count_tc;
    prev_col_count_tc <= curr_col_count_tc;
   
   -- delaying grid address by 2 clock cycles
    NEXT_GRID_ADDRESS <= STD_LOGIC_VECTOR(game_grid_count);
    CURR_GRID_ADDRESS <= NEXT_GRID_ADDRESS;

    --delaying mem address by two clock cycles
    NEXT_MEM_ADDRESS <= STD_LOGIC_VECTOR(row_count) & STD_LOGIC_VECTOR(col_count);
    CURR_MEM_ADDRESS <= NEXT_MEM_ADDRESS;

    --Creating delayed signals for check line, clear lines en, and clear line
    check_line_reg <= check_lines;
    clear_lines_en_reg <= clear_lines_en;
    delayed_clear_line <= clear_line;
    delayed_clear_line_2 <= delayed_clear_line;
    delayed_clear_line_3 <= delayed_clear_line_2;

   --setting clear lines to stay high if clear line goes high once
    if check_lines = '0' then
        clear_lines_signal <= '0';
    else
        clear_lines_signal <= (clear_lines_signal or clear_line);
    end if;
   
   -- incrementing score everytime clear line goes high
   if NEW_SCORE = "00" then
         score_count <= "0000000000000000";
   elsif  clear_line = '1' then
        score_count <= score_count + 1;
    end if;

end if;

end process datapath;

SCORE <= STD_LOGIC_VECTOR(score_count);
--Current Row - 1 is full and 0 is empty
current_row <= not(is_empty) & shift_reg;

-- Is empty true if out of memory is white square
is_empty <= '1' when (MEM_DATA = "0000") else '0';

--full row is true if the current row is all 1's
full_row <= '1' when (current_row = "1111111111") else '0';

--clear line is true when full row is true and we are at the end of a column
clear_line <= '1' when (curr_col_count_tc = '1' and full_row = '1') else '0';

-- clear lines signal goes high during whole check line state if we have to clear one line
CLEAR_LINES <= clear_lines_signal;

-- Our game grid memory only take mem data if we are checking lines
GAME_GRID_IN <= MEM_DATA when (CHECK_LINES = '1') and NOT(row_count_tc = '1' and prev_col_count_tc = '1') else "0000";

-- mem address is instant if we are checking lines else delayed by 2 clock cycles
MEM_ADDRESS <= (STD_LOGIC_VECTOR(row_count) & STD_LOGIC_VECTOR(col_count)) when (check_lines = '1') 
                else CURR_MEM_ADDRESS;

GRID_ADDRESS <= CURR_GRID_ADDRESS when (check_lines = '1') else 
                STD_LOGIC_VECTOR(game_grid_count) when (clear_lines_en = '1')
                else STD_LOGIC_VECTOR(fill_in_count);


-- Clear Counts on the falling edge of check line and clear lines
CLR_CHECK_CNTS <= ((check_line_reg) and not(check_lines)) or ((clear_lines_en_reg) and not(clear_lines_en));

--column count terminal count of 20
col_count_tc <= '1' when (col_count = 20) else '0';
--game grid terminal count
game_grid_count_tc <= '1' when (game_grid_count = 209) else '0';
-- clear lines terminal count
clear_lines_tc <= game_grid_count_tc;
--check lines terminal counte
check_lines_tc <= '1' when (CURR_GRID_ADDRESS = "11010001") else '0'; --209
--row count tc
row_count_tc <= '1' when (row_count = 2) else '0';
-- memory count terminal counter
mem_count_tc <= '1' when (row_count_tc = '1') and (col_count_tc = '1') else '0';
-- clear line signal output
clear_line_port <= clear_line;

end Behavioral;