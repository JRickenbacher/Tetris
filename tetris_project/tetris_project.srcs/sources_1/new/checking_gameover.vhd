----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/29/2022 06:01:02 PM
-- Design Name: 
-- Module Name: checking_gameover - Behavioral
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

entity checking_gameover is
  Port (
        clk : in STD_LOGIC;
        check_gameover_en : in STD_LOGIC;
        read_data : in STD_LOGIC_VECTOR(3 downto 0);
        address_1, address_2, address_3, address_4 : in STD_LOGIC_VECTOR(9 downto 0);
        gameover_addr : out STD_LOGIC_VECTOR(9 downto 0);
        gameover : out STD_LOGIC
   );
end checking_gameover;

architecture Behavioral of checking_gameover is

signal addr_count : unsigned(2 downto 0) := (others => '0');
signal addr_count_tc, valid_read, gameover_signal, is_zero : std_logic := '0';

begin

gameover_addr <= address_1 WHEN (addr_count = 0) ELSE
                 address_2 WHEN (addr_count = 1) ELSE
                 address_3 WHEN (addr_count = 2) ELSE
                 address_4;

count_proc : process(clk)
begin

    if rising_edge(clk) then
        if addr_count_tc = '1' then
            addr_count <= (others => '0');
        elsif check_gameover_en = '1' then
            addr_count <= addr_count + 1;
        end if;
        
        if NOT(check_gameover_en) = '1' then
            gameover_signal <= '0';
        else
            gameover_signal <= (valid_read AND NOT(is_zero)) OR gameover_signal;
        end if;
    end if;
    

end process;

addr_count_tc <= '1' when (addr_count = 6) else '0';
valid_read <= '1' when (addr_count > 1 AND addr_count < 6) else '0';
is_zero <= '1' when (read_data = "0000") else '0';
gameover <= gameover_signal;

end Behavioral;
