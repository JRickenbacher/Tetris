----------------------------------------------------------------------------------
-- Company: Dartmouth College
-- Engineers: Nestor Orozco-Llamas and Jason Rickenbacher
-- 
-- Create Date: 05/20/2022 03:01:59 PM
-- Design Name: 
-- Module Name: Grid_Memory_tb - testbench
-- Project Name: Tetris
-- Target Devices: Basys 3 (Artix 7)
-- Tool Versions: 
-- Description: Testing the grid_memory block
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

entity Grid_Memory_tb is
end Grid_Memory_tb;

architecture testbench of Grid_Memory_tb is

component Grid_Memory is
port (     clk   : in STD_LOGIC;
           w_row : in STD_LOGIC_VECTOR(4 downto 0);
           w_col : in STD_LOGIC_VECTOR(4 downto 0);
           w_in : in STD_LOGIC_VECTOR(3 downto 0);
           w_en : in STD_LOGIC;
           r_row : in STD_LOGIC_VECTOR(4 downto 0);
           r_col : in STD_LOGIC_VECTOR(4 downto 0);
           r_data : out STD_LOGIC_VECTOR(3 downto 0)
           );
end component;
CONSTANT clk_period : TIME := 40 ns;
signal clk : std_logic := '0';
signal w_row : STD_LOGIC_VECTOR(4 downto 0) := (others => '0');
signal w_col : STD_LOGIC_VECTOR(4 downto 0) := (others => '0');
signal w_in : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
signal w_en : STD_LOGIC := '0';
signal r_row : STD_LOGIC_VECTOR(4 downto 0) := (others => '0');
signal r_col : STD_LOGIC_VECTOR(4 downto 0) := (others => '0');
signal r_data : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');

begin

uut : Grid_Memory PORT MAP(
           clk   => clk,
           w_row => w_row,
           w_col => w_col,
           w_in => w_in,
           w_en => w_en,
           r_row => r_row,
           r_col => r_col,
           r_data => r_data
           );
           
clkgen_proc : PROCESS
BEGIN
    WAIT for clk_period / 2;
    clk <= NOT(clk);
END PROCESS clkgen_proc;

stim_proc : process
begin
wait for clk_period;

w_en <= '1';
w_in <= "0101";
wait for clk_period;
w_en <= '0';

wait for clk_period;
w_in <= "1001";
w_row <= "10001";
w_col <= "10101";
w_en <= '1';

wait for clk_period;
w_en <= '0';

wait for clk_period * 2;
r_row <= "10001";
r_col <= "10101";

wait;
end process stim_proc;

end testbench;
