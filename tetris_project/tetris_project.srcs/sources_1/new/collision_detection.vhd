----------------------------------------------------------------------------------
-- Company: Dartmouth College
-- Engineer: Nestor Orozco-Llamas and Jason Rickenbacher
-- 
-- Create Date: 05/25/2022 09:57:09 PM
-- Design Name: 
-- Module Name: collision_detection - Behavioral
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

entity collision_detection is
  Port ( 
            clk : in STD_LOGIC;
            request_move : in STD_LOGIC;
            color_output : in STD_LOGIC_VECTOR(3 downto 0);
            check_addr_1, check_addr_2, check_addr_3, check_addr_4 : in STD_LOGIC_VECTOR(9 downto 0);
            collision_read_addr : out STD_LOGIC_VECTOR(9 downto 0);
            not_valid_move : out STD_LOGIC
            );
end collision_detection;

architecture Behavioral of collision_detection is

signal read_address, current_read_address, next_read_address : STD_LOGIC_VECTOR(9 downto 0) := (others => '0');
signal read_count : unsigned(1 downto 0) := "00";
signal open_square, not_valid_signal, valid_address, valid_count, valid_output : STD_LOGIC := '0';

begin

counter : process(clk)
begin

if rising_edge(clk) then

    if request_move = '1' then
        read_count <= "00";
    elsif read_count < 3 then
        read_count <= read_count + 1;
    end if;
    
end if;

end process counter;

datapath : process(clk)
begin
if rising_edge(clk) then

    next_read_address <= read_address;
    current_read_address <= next_read_address;

    if request_move = '1' then
        not_valid_signal <= '0';
    elsif valid_output = '1' then
        not_valid_signal <= not_valid_signal or not(open_square);
    end if;
    

end if;
end process datapath;

read_address    <=  check_addr_1 when (read_count = 0) else
                    check_addr_2 when (read_count = 1) else
                    check_addr_3 when (read_count = 2) else
                    check_addr_4;

open_square     <=  '1' when (color_output = "0000") else '0';
not_valid_move  <=  not_valid_signal;
valid_address   <=  '0' when (read_address = "0000000000") else '1'; 
valid_count     <=  '1' when (read_count > 1) else '0';
valid_output    <=  '1' when (valid_address = '1' and valid_count = '1') else '1';

collision_read_addr <= read_address;

end Behavioral;
