----------------------------------------------------------------------------------
-- Company: Dartmouth College
-- Engineers: Nestor Orozco-Llamas and Jason Rickenbacher
-- 
-- Create Date: 05/20/2022 02:33:36 PM
-- Design Name: 
-- Module Name: Grid_Memory - Behavioral
-- Project Name: Tetris
-- Target Devices: Basys 3 (Artix 7)
-- Tool Versions: 
-- Description: Memory to hold the grid for VGA
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

entity Grid_Memory is
  Port (   clk   : in STD_LOGIC;
           w_row : in STD_LOGIC_VECTOR(4 downto 0);
           w_col : in STD_LOGIC_VECTOR(4 downto 0);
           w_in : in STD_LOGIC_VECTOR(3 downto 0);
           w_en : in STD_LOGIC;
           r_row : in STD_LOGIC_VECTOR(4 downto 0);
           r_col : in STD_LOGIC_VECTOR(4 downto 0);
           r_data : out STD_LOGIC_VECTOR(3 downto 0)
           );
end Grid_Memory;

architecture Behavioral of Grid_Memory is

--subtype data is STD_LOGIC_Vector(3 downto 0);
--type data_vector is array(natural range <>) of data;
--subtype row is data_vector(0 to 23);
--type row_vector is array(natural range <>) of row;
--subtype col is row_vector(0 to 31);

--type mem is array(0 to 23, 0 to 31) of STD_LOGIC_Vector(3 downto 0);

type regfile is array (0 to 2**10-1) of std_logic_vector(3 downto 0);
signal grid : regfile := (others => "0000");
signal w_address : std_logic_vector(9 downto 0);
signal r_address : std_logic_vector(9 downto 0);
--signal grid : col := (others => (others => "0110"));

begin

mem_block : process(clk)
begin

if rising_edge(clk) then
    if (w_en = '1') then
        grid(to_integer(unsigned(w_address))) <= w_in;
    end if; 

end if;
end process mem_block;

r_data <= grid(to_integer(unsigned(r_address)));

w_address <= ( w_col & w_row );
r_address <= ( r_col & r_row );

end Behavioral;
