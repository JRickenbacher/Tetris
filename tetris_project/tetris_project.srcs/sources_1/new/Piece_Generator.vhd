----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/22/2022 09:00:58 PM
-- Design Name: 
-- Module Name: Piece_Generator - Behavioral
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

entity Piece_Generator is
    Port ( clk_port : in STD_LOGIC;
           Generate_Piece_Port : in STD_LOGIC;
           New_Piece_Port : out STD_LOGIC_VECTOR (3 downto 0);
           address_1, address_2, address_3, address_4 : out STD_LOGIC_VECTOR(9 downto 0)
           );
end Piece_Generator;

architecture Behavioral of Piece_Generator is
signal new_color : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');

signal piece_count : unsigned(2 downto 0) := "000";
signal piece_count_tc : STD_LOGIC := '0';

begin



counter : process(clk_port)
begin

    if rising_edge(clk_port) then
        if piece_count_tc = '1' then
            piece_count <= "001";
        else
            piece_count <= piece_count + 1;
        end if;
    end if;

end process counter;

datapath : process(clk_port)
begin

    if rising_edge(clk_port) then
        if Generate_Piece_Port = '1' then
            new_color <= '0' & STD_LOGIC_VECTOR(piece_count);
        end if;
    end if;

end process datapath;

piece_count_tc <= '1' when (piece_count = 7) else '0';
New_Piece_Port <= new_color;



address_1 <= "0001001110" when (new_color = "0001") else
             "0001001111" when (new_color = "0010") else
             "0001001110" when (new_color = "0011") else
             "0001010000" when (new_color = "0100") else
             "0001101110" when (new_color = "0101") else
             "0001110000" when (new_color = "0110") else
             "0001001110";
             
address_2 <= "0001001111" when (new_color = "0001") else
             "0001010000" when (new_color = "0010") else
             "0001001111" when (new_color = "0011") else
             "0001001111" when (new_color = "0100") else
             "0001101111" when (new_color = "0101") else
             "0001101111" when (new_color = "0110") else
             "0001001111";
         
address_3 <= "0001010000" when (new_color = "0001") else
             "0001101111" when (new_color = "0010") else
             "0001010000" when (new_color = "0011") else
             "0001001110" when (new_color = "0100") else
             "0001001111" when (new_color = "0101") else
             "0001001111" when (new_color = "0110") else
             "0001010000";
             
address_4 <= "0001010001" when (new_color = "0001") else
             "0001110000" when (new_color = "0010") else
             "0001110000" when (new_color = "0011") else
             "0001101110" when (new_color = "0100") else
             "0001010000" when (new_color = "0101") else
             "0001001110" when (new_color = "0110") else
             "0001101111";




end Behavioral;
