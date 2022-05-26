----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/26/2022 10:08:29 AM
-- Design Name: 
-- Module Name: write_new_piece - Behavioral
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

entity write_new_piece is
  Port (
        clk : in std_logic;
        curr_addr_1, curr_addr_2, curr_addr_3, curr_addr_4 : in std_logic_vector(9 downto 0);
        write_new_piece_en : in std_logic;
        write_new_piece_address : out std_logic_vector(9 downto 0)
  );
end write_new_piece;

architecture Behavioral of write_new_piece is

signal addr_count : unsigned(1 downto 0);

begin

count: process(clk)
begin

    if rising_edge(clk) then
        addr_count <= addr_count + 1;
    end if;
    
end process;

write_new_piece_address <= curr_addr_1 when (addr_count = "00") else
                           curr_addr_2 when (addr_count = "01") else
                           curr_addr_3 when (addr_count = "10") else
                           curr_addr_4;

end Behavioral;
