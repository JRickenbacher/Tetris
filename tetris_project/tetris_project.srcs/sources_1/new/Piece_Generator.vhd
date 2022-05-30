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

--signal piece_count : unsigned(2 downto 0) := "001";
--signal piece_count_tc : STD_LOGIC := '0';

signal pieces_used : unsigned(2 downto 0) := "000";
signal pieces_used_tc : std_logic := '0';

signal reg_1 : std_logic_vector(3 downto 0) := "0001";
signal reg_2 : std_logic_vector(3 downto 0) := "0010";
signal reg_3 : std_logic_vector(3 downto 0) := "0011";
signal reg_4 : std_logic_vector(3 downto 0) := "0100";
signal reg_5 : std_logic_vector(3 downto 0) := "0101";
signal reg_6 : std_logic_vector(3 downto 0) := "0110";
signal reg_7 : std_logic_vector(3 downto 0) := "0111";

begin



counter : process(clk_port)
begin

--    if rising_edge(clk_port) then
--        if piece_count_tc = '1' then
--            piece_count <= "001";
--        else
--            piece_count <= piece_count + 1;
--        end if;
--    end if;

    if rising_edge(clk_port) then
        if generate_piece_port = '1' then
            if pieces_used_tc = '1' then
                pieces_used <= "000";
            else
                pieces_used <= pieces_used + 1;
            end if;
        end if;
    end if;

end process counter;

datapath : process(clk_port)
begin

    if rising_edge(clk_port) then
        if Generate_Piece_Port = '1' then
--            new_color <= '0' & STD_LOGIC_VECTOR(piece_count);
            if pieces_used = 0 then
                new_color <= reg_7;
            elsif pieces_used = 1 then
                new_color <= reg_6;
            elsif pieces_used = 2 then
                new_color <= reg_5;
            elsif pieces_used = 3 then
                new_color <= reg_4;
            elsif pieces_used = 4 then
                new_color <= reg_3;
            elsif pieces_used = 5 then
                new_color <= reg_2;
            elsif pieces_used = 6 then
                new_color <= reg_1;
            end if;
            
        else
            if pieces_used < 1 then
                reg_7 <= reg_6;
            end if;
            
            if pieces_used < 2 then
                reg_6 <= reg_5;
            end if;
            
            if pieces_used < 3 then
                reg_5 <= reg_4;
            end if;
            
            if pieces_used < 4 then
                reg_4 <= reg_3;
            end if;
            
            if pieces_used < 5 then
                reg_3 <= reg_2;
            end if;
            
            if pieces_used < 6 then
                reg_2 <= reg_1;
            end if;
            
            if pieces_used = 0 then
                reg_1 <= reg_7;
            elsif pieces_used = 1 then
                reg_1 <= reg_6;
            elsif pieces_used = 2 then
                reg_1 <= reg_5;
            elsif pieces_used = 3 then
                reg_1 <= reg_4;
            elsif pieces_used = 4 then
                reg_1 <= reg_3;
            elsif pieces_used = 5 then
                reg_1 <= reg_2;
            elsif pieces_used = 6 then
                reg_1 <= reg_1;
            end if;
        end if;
        
    end if;

end process datapath;

--piece_count_tc <= '1' when (piece_count = 7) else '0';

pieces_used_tc <= '1' when (pieces_used = 6) else '0';

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
