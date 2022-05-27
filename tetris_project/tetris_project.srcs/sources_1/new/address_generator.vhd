----------------------------------------------------------------------------------
-- Company: Dartmouth College
-- Engineer: Nestor Orozco-Llamas and Jason Rickenbacher
-- 
-- Create Date: 05/23/2022 01:05:49 AM
-- Design Name: 
-- Module Name: address_generator - Behavioral
-- Project Name: Tetris
-- Target Devices: Basys 3 (Artix 7)
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

entity address_generator is
  Port (
        curr_addr_1, curr_addr_2, curr_addr_3, curr_addr_4 : in STD_LOGIC_VECTOR(9 downto 0);
        rotation_number, action_number : in STD_LOGIC_VECTOR(1 downto 0);
        piece_number : in STD_LOGIC_VECTOR(3 downto 0);
        check_addr_1, check_addr_2, check_addr_3, check_addr_4 : out STD_LOGIC_VECTOR(9 downto 0);
        next_addr_1, next_addr_2, next_addr_3, next_addr_4 : out STD_LOGIC_VECTOR(9 downto 0);
        next_rotation : out STD_LOGIC_VECTOR(1 downto 0)
  );
end address_generator;

architecture Behavioral of address_generator is

signal next_addr_1_row, next_addr_1_col : unsigned(4 downto 0) := (others => '0');
signal next_addr_2_row, next_addr_2_col : unsigned(4 downto 0) := (others => '0');
signal next_addr_3_row, next_addr_3_col : unsigned(4 downto 0) := (others => '0');
signal next_addr_4_row, next_addr_4_col : unsigned(4 downto 0) := (others => '0');
signal top_left_addr_row, top_left_addr_col : unsigned(4 downto 0) := (others => '0');

signal check_1_row, check_1_col, check_2_row, check_2_col, check_3_row, check_3_col, check_4_row, check_4_col : unsigned(2 downto 0) := (others => '0');

begin

get_addresses: process(curr_addr_1, curr_addr_2, curr_addr_3, curr_addr_4, rotation_number, piece_number, action_number)
begin

----LEFT MOVEMENT----
if (action_number = "00") then
    next_addr_1_row <= unsigned(curr_addr_1(9 downto 5));
    next_addr_1_col <= unsigned(curr_addr_1(4 downto 0)) - 1;
    
    next_addr_2_row <= unsigned(curr_addr_1(9 downto 5));
    next_addr_2_col <= unsigned(curr_addr_1(4 downto 0)) - 1;
    
    next_addr_3_row <= unsigned(curr_addr_1(9 downto 5));
    next_addr_3_col <= unsigned(curr_addr_1(4 downto 0)) - 1;
    
    next_addr_4_row <= unsigned(curr_addr_1(9 downto 5));
    next_addr_4_col <= unsigned(curr_addr_1(4 downto 0)) - 1;
end if;

----RIGHT MOVEMENT----
if (action_number = "01") then
    next_addr_1_row <= unsigned(curr_addr_1(9 downto 5));
    next_addr_1_col <= unsigned(curr_addr_1(4 downto 0)) + 1;
    
    next_addr_2_row <= unsigned(curr_addr_1(9 downto 5));
    next_addr_2_col <= unsigned(curr_addr_1(4 downto 0)) + 1;
    
    next_addr_3_row <= unsigned(curr_addr_1(9 downto 5));
    next_addr_3_col <= unsigned(curr_addr_1(4 downto 0)) + 1;
    
    next_addr_4_row <= unsigned(curr_addr_1(9 downto 5));
    next_addr_4_col <= unsigned(curr_addr_1(4 downto 0)) + 1;
end if;

----DOWN MOVEMENT----
if (action_number = "11") then
    next_addr_1_row <= unsigned(curr_addr_1(9 downto 5)) + 1;
    next_addr_1_col <= unsigned(curr_addr_1(4 downto 0));
    
    next_addr_2_row <= unsigned(curr_addr_1(9 downto 5)) + 1;
    next_addr_2_col <= unsigned(curr_addr_1(4 downto 0));
    
    next_addr_3_row <= unsigned(curr_addr_1(9 downto 5)) + 1;
    next_addr_3_col <= unsigned(curr_addr_1(4 downto 0));
    
    next_addr_4_row <= unsigned(curr_addr_1(9 downto 5)) + 1;
    next_addr_4_col <= unsigned(curr_addr_1(4 downto 0));
end if;

----DEFAULTS----
check_1_row <= "111";
check_1_col <= "111";

check_2_row <= "111";
check_2_col <= "111";

check_3_row <= "111";
check_3_col <= "111";

check_4_row <= "111";
check_4_col <= "111";

next_rotation <= rotation_number;

--==========================================================================================
----I PIECE----
--==========================================================================================
    if (piece_number = "0001") then
        ----ROTATION 1----
        if (rotation_number = "01") then
            top_left_addr_row <= unsigned(curr_addr_1(9 downto 5));
            top_left_addr_col <= unsigned(curr_addr_1(4 downto 0)) - 3;
            ----LEFT MOVEMENT----
            if (action_number = "00") then
                check_1_row <= "000";
                check_1_col <= "010";
                
                check_2_row <= "001";
                check_2_col <= "010";
                
                check_3_row <= "010";
                check_3_col <= "010";
                
                check_4_row <= "011";
                check_4_col <= "010";

            ----RIGHT MOVEMENT----
            elsif (action_number = "01") then
                check_1_row <= "000";
                check_1_col <= "100";
                
                check_2_row <= "001";
                check_2_col <= "100";
                
                check_3_row <= "010";
                check_3_col <= "100";
                
                check_4_row <= "011";
                check_4_col <= "100";
            
            ----ROTATION MOVEMENT----
            elsif (action_number = "10") then
                check_1_row <= "010";
                check_1_col <= "001";
                
                check_2_row <= "010";
                check_2_col <= "010";
                
                check_3_row <= "010";
                check_3_col <= "100";
                
                check_4_row <= "111";
                check_4_col <= "111";
                
                next_addr_1_row <= unsigned(curr_addr_1(9 downto 5)) + 2;
                next_addr_1_col <= unsigned(curr_addr_1(4 downto 0)) - 2;
                
                next_addr_2_row <= unsigned(curr_addr_2(9 downto 5)) + 1;
                next_addr_2_col <= unsigned(curr_addr_2(4 downto 0)) - 1;
                
                next_addr_3_row <= unsigned(curr_addr_3(9 downto 5));
                next_addr_3_col <= unsigned(curr_addr_3(4 downto 0));
                
                next_addr_4_row <= unsigned(curr_addr_4(9 downto 5)) - 1;
                next_addr_4_col <= unsigned(curr_addr_4(4 downto 0)) + 1;
                
                next_rotation <= "00";
            
            ----DOWN MOVEMENT----
            else
                check_1_row <= "101";
                check_1_col <= "011";
                
                check_2_row <= "111";
                check_2_col <= "111";
                
                check_3_row <= "111";
                check_3_col <= "111";
                
                check_4_row <= "111";
                check_4_col <= "111";
                
            end if;
        
        ----ROTATION 0----
        else
            top_left_addr_row <= unsigned(curr_addr_1(9 downto 5)) - 2;
            top_left_addr_col <= unsigned(curr_addr_1(4 downto 0)) - 1;
            ----LEFT MOVEMENT----
            if (action_number = "00") then
                check_1_row <= "010";
                check_1_col <= "000";

            ----RIGHT MOVEMENT----
            elsif (action_number = "01") then
                check_1_row <= "010";
                check_1_col <= "101";
            
            ----ROTATION MOVEMENT----
            elsif (action_number = "10") then
                check_1_row <= "000";
                check_1_col <= "011";
                
                check_2_row <= "001";
                check_2_col <= "011";
                
                check_3_row <= "011";
                check_3_col <= "011";
                
                next_addr_1_row <= unsigned(curr_addr_1(9 downto 5)) - 2;
                next_addr_1_col <= unsigned(curr_addr_1(4 downto 0)) + 2;
                
                next_addr_2_row <= unsigned(curr_addr_2(9 downto 5)) - 1;
                next_addr_2_col <= unsigned(curr_addr_2(4 downto 0)) + 1;
                
                next_addr_4_row <= unsigned(curr_addr_4(9 downto 5)) + 1;
                next_addr_4_col <= unsigned(curr_addr_4(4 downto 0)) - 1;
                
                next_rotation <= "01";
            
            ----DOWN MOVEMENT----
            else
                check_1_row <= "100";
                check_1_col <= "001";
                
                check_2_row <= "100";
                check_2_col <= "010";
                
                check_3_row <= "100";
                check_3_col <= "011";
                
                check_4_row <= "100";
                check_4_col <= "100";
                
            end if;
        end if;
    end if;
    
--==========================================================================================
----O PIECE----
--==========================================================================================
    if (piece_number = "0010") then
        top_left_addr_row <= unsigned(curr_addr_1(9 downto 5));
        top_left_addr_col <= unsigned(curr_addr_1(4 downto 0)) - 2;
        ----ROTATION 0----
        
        ----LEFT MOVEMENT----
        if (action_number = "00") then
            check_1_row <= "000";
            check_1_col <= "001";
            
            check_2_row <= "001";
            check_2_col <= "001";

        ----RIGHT MOVEMENT----
        elsif (action_number = "01") then
            check_1_row <= "000";
            check_1_col <= "100";
            
            check_2_row <= "001";
            check_2_col <= "100";
        
        ----DOWN MOVEMENT----
        else
            check_1_row <= "010";
            check_1_col <= "010";
            
            check_2_row <= "010";
            check_2_col <= "011";

        end if;
    end if;
    
--==========================================================================================
----J PIECE----
--==========================================================================================
    if (piece_number = "0011") then
        ----ROTATION 0----
        if (rotation_number = "00") then
            top_left_addr_row <= unsigned(curr_addr_1(9 downto 5)) - 1;
            top_left_addr_col <= unsigned(curr_addr_1(4 downto 0)) - 1;
            ----LEFT MOVEMENT----
            if (action_number = "00") then
                check_1_row <= "001";
                check_1_col <= "000";
                
                check_2_row <= "010";
                check_2_col <= "010";

            ----RIGHT MOVEMENT----
            elsif (action_number = "01") then
                check_1_row <= "001";
                check_1_col <= "100";
                
                check_2_row <= "010";
                check_2_col <= "100";
            
            ----ROTATION MOVEMENT----
            elsif (action_number = "10") then
                check_1_row <= "000";
                check_1_col <= "010";
                
                check_2_row <= "010";
                check_2_col <= "001";
                
                check_3_row <= "010";
                check_3_col <= "010";
                
                next_addr_1_row <= unsigned(curr_addr_1(9 downto 5)) - 1;
                next_addr_1_col <= unsigned(curr_addr_1(4 downto 0)) + 1;
                
                next_addr_3_row <= unsigned(curr_addr_3(9 downto 5)) + 1;
                next_addr_3_col <= unsigned(curr_addr_3(4 downto 0)) - 1;
                
                next_addr_4_row <= unsigned(curr_addr_4(9 downto 5));
                next_addr_4_col <= unsigned(curr_addr_4(4 downto 0)) - 2;
                
                next_rotation <= "01";
            
            ----DOWN MOVEMENT----
            else
                check_1_row <= "010";
                check_1_col <= "001";
                
                check_2_row <= "010";
                check_2_col <= "010";
                
                check_3_row <= "011";
                check_3_col <= "011";
                
            end if;
        
        ----ROTATION 1----
        elsif (rotation_number = "01") then
            top_left_addr_row <= unsigned(curr_addr_1(9 downto 5));
            top_left_addr_col <= unsigned(curr_addr_1(4 downto 0)) - 2;
            ----LEFT MOVEMENT----
            if (action_number = "00") then
                check_1_row <= "000";
                check_1_col <= "001";
                
                check_2_row <= "001";
                check_2_col <= "001";
                
                check_3_row <= "010";
                check_3_col <= "000";
                
            ----RIGHT MOVEMENT----
            elsif (action_number = "01") then
                check_1_row <= "000";
                check_1_col <= "011";
                
                check_2_row <= "001";
                check_2_col <= "011";
                
                check_3_row <= "010";
                check_3_col <= "011";
            
            ----ROTATION MOVEMENT----
            elsif (action_number = "10") then
                check_1_row <= "000";
                check_1_col <= "001";
                
                check_2_row <= "001";
                check_2_col <= "001";
                
                check_3_row <= "001";
                check_3_col <= "011";
                
                next_addr_1_row <= unsigned(curr_addr_1(9 downto 5)) + 1;
                next_addr_1_col <= unsigned(curr_addr_1(4 downto 0)) + 1;
                
                next_addr_3_row <= unsigned(curr_addr_3(9 downto 5)) - 1;
                next_addr_3_col <= unsigned(curr_addr_3(4 downto 0)) - 1;
                
                next_addr_4_row <= unsigned(curr_addr_4(9 downto 5)) - 2;
                next_addr_4_col <= unsigned(curr_addr_4(4 downto 0));
                
                next_rotation <= "10";
            
            ----DOWN MOVEMENT----
            else
                check_1_row <= "011";
                check_1_col <= "001";
                
                check_2_row <= "011";
                check_2_col <= "010";
                
            end if;
            
        ----ROTATION 2----
        elsif (rotation_number = "10") then
            top_left_addr_row <= unsigned(curr_addr_1(9 downto 5)) - 1;
            top_left_addr_col <= unsigned(curr_addr_1(4 downto 0)) - 3;
            ----LEFT MOVEMENT----
            if (action_number = "00") then
                check_1_row <= "000";
                check_1_col <= "000";
                
                check_2_row <= "001";
                check_2_col <= "000";

            ----RIGHT MOVEMENT----
            elsif (action_number = "01") then
                check_1_row <= "000";
                check_1_col <= "010";
                
                check_2_row <= "001";
                check_2_col <= "100";
            
            ----ROTATION MOVEMENT----
            elsif (action_number = "10") then
                check_1_row <= "000";
                check_1_col <= "010";
                
                check_2_row <= "000";
                check_2_col <= "011";
                
                check_3_row <= "010";
                check_3_col <= "010";
                
                next_addr_1_row <= unsigned(curr_addr_1(9 downto 5)) + 1;
                next_addr_1_col <= unsigned(curr_addr_1(4 downto 0)) - 1;
                
                next_addr_3_row <= unsigned(curr_addr_3(9 downto 5)) - 1;
                next_addr_3_col <= unsigned(curr_addr_3(4 downto 0)) + 1;
                
                next_addr_4_row <= unsigned(curr_addr_4(9 downto 5));
                next_addr_4_col <= unsigned(curr_addr_4(4 downto 0)) + 2;
                
                next_rotation <= "11";
            
            ----DOWN MOVEMENT----
            else
                check_1_row <= "010";
                check_1_col <= "001";
                
                check_2_row <= "010";
                check_2_col <= "010";
                
                check_3_row <= "010";
                check_3_col <= "011";
                
            end if;
            
        ----ROTATION 3----
        else
            top_left_addr_row <= unsigned(curr_addr_1(9 downto 5)) - 2;
            top_left_addr_col <= unsigned(curr_addr_1(4 downto 0)) - 2;
            ----LEFT MOVEMENT----
            if (action_number = "00") then
                check_1_row <= "000";
                check_1_col <= "001";
                
                check_2_row <= "001";
                check_2_col <= "001";
                
                check_3_row <= "010";
                check_3_col <= "001";

            ----RIGHT MOVEMENT----
            elsif (action_number = "01") then
                check_1_row <= "000";
                check_1_col <= "100";
                
                check_2_row <= "001";
                check_2_col <= "011";
                
                check_3_row <= "010";
                check_3_col <= "011";
            
            ----ROTATION MOVEMENT----
            elsif (action_number = "10") then
                check_1_row <= "001";
                check_1_col <= "001";
                
                check_2_row <= "001";
                check_2_col <= "011";
                
                check_3_row <= "010";
                check_3_col <= "011";
                
                next_addr_1_row <= unsigned(curr_addr_1(9 downto 5)) - 1;
                next_addr_1_col <= unsigned(curr_addr_1(4 downto 0)) - 1;
                
                next_addr_3_row <= unsigned(curr_addr_3(9 downto 5)) + 1;
                next_addr_3_col <= unsigned(curr_addr_3(4 downto 0)) + 1;
                
                next_addr_4_row <= unsigned(curr_addr_4(9 downto 5)) + 2;
                next_addr_4_col <= unsigned(curr_addr_4(4 downto 0));
                
                next_rotation <= "00";
            
            ----DOWN MOVEMENT----
            else
                check_1_row <= "011";
                check_1_col <= "010";
                
                check_2_row <= "001";
                check_2_col <= "011";
                
            end if;
        end if;
    end if;

--==========================================================================================
----L PIECE----
--==========================================================================================
    if (piece_number = "0011") then
        ----ROTATION 0----
        if (rotation_number = "00") then
            top_left_addr_row <= unsigned(curr_addr_1(9 downto 5)) - 1;
            top_left_addr_col <= unsigned(curr_addr_1(4 downto 0)) - 3;
            ----LEFT MOVEMENT----
            if (action_number = "00") then
                check_1_row <= "001";
                check_1_col <= "000";
                
                check_2_row <= "010";
                check_2_col <= "000";

            ----RIGHT MOVEMENT----
            elsif (action_number = "01") then
                check_1_row <= "001";
                check_1_col <= "100";
                
                check_2_row <= "010";
                check_2_col <= "010";
            
            ----ROTATION MOVEMENT----
            elsif (action_number = "10") then
                check_1_row <= "000";
                check_1_col <= "001";
                
                check_2_row <= "000";
                check_2_col <= "010";
                
                check_3_row <= "010";
                check_3_col <= "010";
                
                next_addr_1_row <= unsigned(curr_addr_1(9 downto 5)) + 1;
                next_addr_1_col <= unsigned(curr_addr_1(4 downto 0)) - 1;
                
                next_addr_3_row <= unsigned(curr_addr_3(9 downto 5)) - 1;
                next_addr_3_col <= unsigned(curr_addr_3(4 downto 0)) + 1;
                
                next_addr_4_row <= unsigned(curr_addr_4(9 downto 5)) - 2;
                next_addr_4_col <= unsigned(curr_addr_4(4 downto 0));
                
                next_rotation <= "01";
            
            ----DOWN MOVEMENT----
            else
                check_1_row <= "010";
                check_1_col <= "010";
                
                check_2_row <= "010";
                check_2_col <= "011";
                
                check_3_row <= "011";
                check_3_col <= "001";
                
            end if;
        
        ----ROTATION 1----
        elsif (rotation_number = "01") then
            top_left_addr_row <= unsigned(curr_addr_1(9 downto 5)) - 2;
            top_left_addr_col <= unsigned(curr_addr_1(4 downto 0)) - 2;
            ----LEFT MOVEMENT----
            if (action_number = "00") then
                check_1_row <= "000";
                check_1_col <= "000";
                
                check_2_row <= "001";
                check_2_col <= "001";
                
                check_3_row <= "010";
                check_3_col <= "001";

            ----RIGHT MOVEMENT----
            elsif (action_number = "01") then
                check_1_row <= "000";
                check_1_col <= "011";
                
                check_2_row <= "001";
                check_2_col <= "011";
                
                check_3_row <= "010";
                check_3_col <= "011";
            
            ----ROTATION MOVEMENT----
            elsif (action_number = "10") then
                check_1_row <= "000";
                check_1_col <= "011";
                
                check_2_row <= "001";
                check_2_col <= "001";
                
                check_3_row <= "001";
                check_3_col <= "011";
                
                next_addr_1_row <= unsigned(curr_addr_1(9 downto 5)) - 1;
                next_addr_1_col <= unsigned(curr_addr_1(4 downto 0)) - 1;
                
                next_addr_3_row <= unsigned(curr_addr_3(9 downto 5)) + 1;
                next_addr_3_col <= unsigned(curr_addr_3(4 downto 0)) + 1;
                
                next_addr_4_row <= unsigned(curr_addr_4(9 downto 5));
                next_addr_4_col <= unsigned(curr_addr_4(4 downto 0)) + 2;
                
                next_rotation <= "10";
            
            ----DOWN MOVEMENT----
            else
                check_1_row <= "001";
                check_1_col <= "001";
                
                check_2_row <= "011";
                check_2_col <= "010";
                
            end if;
            
        ----ROTATION 2----
        elsif (rotation_number = "10") then
            top_left_addr_row <= unsigned(curr_addr_1(9 downto 5)) - 1;
            top_left_addr_col <= unsigned(curr_addr_1(4 downto 0)) - 1;
            ----LEFT MOVEMENT----
            if (action_number = "00") then
                check_1_row <= "000";
                check_1_col <= "010";
                
                check_2_row <= "001";
                check_2_col <= "000";

            ----RIGHT MOVEMENT----
            elsif (action_number = "01") then
                check_1_row <= "000";
                check_1_col <= "100";
                
                check_2_row <= "001";
                check_2_col <= "100";
            
            ----ROTATION MOVEMENT----
            elsif (action_number = "10") then
                check_1_row <= "000";
                check_1_col <= "010";
                
                check_2_row <= "010";
                check_2_col <= "010";
                
                check_3_row <= "010";
                check_3_col <= "011";
                
                next_addr_1_row <= unsigned(curr_addr_1(9 downto 5)) - 1;
                next_addr_1_col <= unsigned(curr_addr_1(4 downto 0)) + 1;
                
                next_addr_3_row <= unsigned(curr_addr_3(9 downto 5)) + 1;
                next_addr_3_col <= unsigned(curr_addr_3(4 downto 0)) - 1;
                
                next_addr_4_row <= unsigned(curr_addr_4(9 downto 5)) + 2;
                next_addr_4_col <= unsigned(curr_addr_4(4 downto 0));
                
                next_rotation <= "11";
            
            ----DOWN MOVEMENT----
            else
                check_1_row <= "010";
                check_1_col <= "001";
                
                check_2_row <= "010";
                check_2_col <= "010";
                
                check_3_row <= "010";
                check_3_col <= "011";
                
            end if;
            
        ----ROTATION 3----
        else
            top_left_addr_row <= unsigned(curr_addr_1(9 downto 5));
            top_left_addr_col <= unsigned(curr_addr_1(4 downto 0)) - 2;
            ----LEFT MOVEMENT----
            if (action_number = "00") then
                check_1_row <= "000";
                check_1_col <= "001";
                
                check_2_row <= "001";
                check_2_col <= "001";
                
                check_3_row <= "010";
                check_3_col <= "001";

            ----RIGHT MOVEMENT----
            elsif (action_number = "01") then
                check_1_row <= "000";
                check_1_col <= "011";
                
                check_2_row <= "001";
                check_2_col <= "011";
                
                check_3_row <= "010";
                check_3_col <= "100";
            
            ----ROTATION MOVEMENT----
            elsif (action_number = "10") then
                check_1_row <= "001";
                check_1_col <= "001";
                
                check_2_row <= "001";
                check_2_col <= "011";
                
                check_3_row <= "010";
                check_3_col <= "001";
                
                next_addr_1_row <= unsigned(curr_addr_1(9 downto 5)) + 1;
                next_addr_1_col <= unsigned(curr_addr_1(4 downto 0)) + 1;
                
                next_addr_3_row <= unsigned(curr_addr_3(9 downto 5)) - 1;
                next_addr_3_col <= unsigned(curr_addr_3(4 downto 0)) - 1;
                
                next_addr_4_row <= unsigned(curr_addr_4(9 downto 5)) - 2;
                next_addr_4_col <= unsigned(curr_addr_4(4 downto 0));
                
                next_rotation <= "00";
            
            ----DOWN MOVEMENT----
            else
                check_1_row <= "011";
                check_1_col <= "010";
                
                check_2_row <= "011";
                check_2_col <= "011";
                
            end if;
        end if;
    end if;
    
--==========================================================================================
----S PIECE----
--==========================================================================================
    if (piece_number = "0011") then
        ----ROTATION 0----
        if (rotation_number = "00") then
            top_left_addr_row <= unsigned(curr_addr_1(9 downto 5)) - 2;
            top_left_addr_col <= unsigned(curr_addr_1(4 downto 0)) - 1;
            ----LEFT MOVEMENT----
            if (action_number = "00") then
                check_1_row <= "010";
                check_1_col <= "000";
                
                check_2_row <= "001";
                check_2_col <= "001";

            ----RIGHT MOVEMENT----
            elsif (action_number = "01") then
                check_1_row <= "001";
                check_1_col <= "100";
                
                check_2_row <= "010";
                check_2_col <= "011";
            
            ----ROTATION MOVEMENT----
            elsif (action_number = "10") then
                check_1_row <= "000";
                check_1_col <= "010";
                
                check_2_row <= "010";
                check_2_col <= "011";
                
                next_addr_1_row <= unsigned(curr_addr_1(9 downto 5));
                next_addr_1_col <= unsigned(curr_addr_1(4 downto 0)) + 2;
                
                next_addr_2_row <= unsigned(curr_addr_2(9 downto 5)) - 1;
                next_addr_2_col <= unsigned(curr_addr_2(4 downto 0)) + 1;
                
                next_addr_4_row <= unsigned(curr_addr_4(9 downto 5)) - 1;
                next_addr_4_col <= unsigned(curr_addr_4(4 downto 0)) - 1;
                
                next_rotation <= "01";
            
            ----DOWN MOVEMENT----
            else
                check_1_row <= "011";
                check_1_col <= "001";
                
                check_2_row <= "011";
                check_2_col <= "010";
                
                check_3_row <= "010";
                check_3_col <= "011";
                
            end if;
            
        ----ROTATION 1----
        else
            top_left_addr_row <= unsigned(curr_addr_1(9 downto 5)) - 2;
            top_left_addr_col <= unsigned(curr_addr_1(4 downto 0)) - 3;
            ----LEFT MOVEMENT----
            if (action_number = "00") then
                check_1_row <= "000";
                check_1_col <= "001";
                
                check_2_row <= "001";
                check_2_col <= "001";
                
                check_3_row <= "010";
                check_3_col <= "010";

            ----RIGHT MOVEMENT----
            elsif (action_number = "01") then
                check_1_row <= "000";
                check_1_col <= "011";
                
                check_2_row <= "001";
                check_2_col <= "100";
                
                check_3_row <= "010";
                check_3_col <= "100";
            
            ----ROTATION MOVEMENT----
            elsif (action_number = "10") then
                check_1_row <= "010";
                check_1_col <= "001";
                
                check_2_row <= "010";
                check_2_col <= "010";
                
                next_addr_1_row <= unsigned(curr_addr_1(9 downto 5)) - 2;
                next_addr_1_col <= unsigned(curr_addr_1(4 downto 0));
                
                next_addr_2_row <= unsigned(curr_addr_2(9 downto 5)) + 1;
                next_addr_2_col <= unsigned(curr_addr_2(4 downto 0)) - 1;
                
                next_addr_4_row <= unsigned(curr_addr_4(9 downto 5)) + 1;
                next_addr_4_col <= unsigned(curr_addr_4(4 downto 0)) + 1;
                
                next_rotation <= "00";
            
            ----DOWN MOVEMENT----
            else
                check_1_row <= "010";
                check_1_col <= "010";
                
                check_2_row <= "011";
                check_2_col <= "011";
                
            end if;
        end if;
    end if;


--==========================================================================================
----Z PIECE----
--==========================================================================================
    if (piece_number = "0011") then
        ----ROTATION 0----
        if (rotation_number = "00") then
            top_left_addr_row <= unsigned(curr_addr_1(9 downto 5)) - 2;
            top_left_addr_col <= unsigned(curr_addr_1(4 downto 0)) - 3;
            ----LEFT MOVEMENT----
            if (action_number = "00") then
                check_1_row <= "001";
                check_1_col <= "000";
                
                check_2_row <= "010";
                check_2_col <= "001";

            ----RIGHT MOVEMENT----
            elsif (action_number = "01") then
                check_1_row <= "001";
                check_1_col <= "011";
                
                check_2_row <= "010";
                check_2_col <= "100";
            
            ----ROTATION MOVEMENT----
            elsif (action_number = "10") then
                check_1_row <= "000";
                check_1_col <= "011";
                
                check_2_row <= "001";
                check_2_col <= "011";
                
                next_addr_1_row <= unsigned(curr_addr_1(9 downto 5)) - 2;
                next_addr_1_col <= unsigned(curr_addr_1(4 downto 0));
                
                next_addr_2_row <= unsigned(curr_addr_2(9 downto 5)) - 1;
                next_addr_2_col <= unsigned(curr_addr_2(4 downto 0)) + 1;
                
                next_addr_4_row <= unsigned(curr_addr_4(9 downto 5)) + 1;
                next_addr_4_col <= unsigned(curr_addr_4(4 downto 0)) + 1;
                
                next_rotation <= "01";
            
            ----DOWN MOVEMENT----
            else
                check_1_row <= "010";
                check_1_col <= "001";
                
                check_2_row <= "011";
                check_2_col <= "010";
                
                check_3_row <= "011";
                check_3_col <= "011";
                
            end if;
        ----ROTATION 1----
        else
            top_left_addr_row <= unsigned(curr_addr_1(9 downto 5));
            top_left_addr_col <= unsigned(curr_addr_1(4 downto 0)) - 3;
            ----LEFT MOVEMENT----
            if (action_number = "00") then
                check_1_row <= "000";
                check_1_col <= "010";
                
                check_2_row <= "001";
                check_2_col <= "001";
                
                check_3_row <= "010";
                check_3_col <= "001";

            ----RIGHT MOVEMENT----
            elsif (action_number = "01") then
                check_1_row <= "000";
                check_1_col <= "100";
                
                check_2_row <= "001";
                check_2_col <= "100";
                
                check_3_row <= "010";
                check_3_col <= "011";
            
            ----ROTATION MOVEMENT----
            elsif (action_number = "10") then
                check_1_row <= "001";
                check_1_col <= "001";
                
                check_2_row <= "010";
                check_2_col <= "011";
                
                next_addr_1_row <= unsigned(curr_addr_1(9 downto 5)) + 2;
                next_addr_1_col <= unsigned(curr_addr_1(4 downto 0));
                
                next_addr_2_row <= unsigned(curr_addr_2(9 downto 5)) + 1;
                next_addr_2_col <= unsigned(curr_addr_2(4 downto 0)) - 1;
                
                next_addr_4_row <= unsigned(curr_addr_4(9 downto 5)) - 1;
                next_addr_4_col <= unsigned(curr_addr_4(4 downto 0)) - 1;
                
                next_rotation <= "00";
            
            ----DOWN MOVEMENT----
            else
                check_1_row <= "011";
                check_1_col <= "010";
                
                check_2_row <= "010";
                check_2_col <= "011";
                
            end if;
        end if;
    end if;


--==========================================================================================
----T PIECE----
--==========================================================================================
    if (piece_number = "0011") then
        ----ROTATION 0----
        if (rotation_number = "00") then
            top_left_addr_row <= unsigned(curr_addr_1(9 downto 5)) - 1;
            top_left_addr_col <= unsigned(curr_addr_1(4 downto 0)) - 1;
            ----LEFT MOVEMENT----
            if (action_number = "00") then
                check_1_row <= "001";
                check_1_col <= "000";
                
                check_2_row <= "010";
                check_2_col <= "001";

            ----RIGHT MOVEMENT----
            elsif (action_number = "01") then
                check_1_row <= "001";
                check_1_col <= "100";
                
                check_2_row <= "010";
                check_2_col <= "011";
            
            ----ROTATION MOVEMENT----
            elsif (action_number = "10") then
                check_1_row <= "000";
                check_1_col <= "010";
                
                next_addr_1_row <= unsigned(curr_addr_1(9 downto 5)) - 1;
                next_addr_1_col <= unsigned(curr_addr_1(4 downto 0)) + 1;
                
                next_addr_3_row <= unsigned(curr_addr_3(9 downto 5)) + 1;
                next_addr_3_col <= unsigned(curr_addr_3(4 downto 0)) - 1;
                
                next_addr_4_row <= unsigned(curr_addr_4(9 downto 5)) - 1;
                next_addr_4_col <= unsigned(curr_addr_4(4 downto 0)) - 1;
                
                next_rotation <= "01";
            
            ----DOWN MOVEMENT----
            else
                check_1_row <= "010";
                check_1_col <= "001";
                
                check_2_row <= "011";
                check_2_col <= "010";
                
                check_3_row <= "010";
                check_3_col <= "011";
                
            end if;
        
        ----ROTATION 1----
        elsif (rotation_number = "01") then
            top_left_addr_row <= unsigned(curr_addr_1(9 downto 5));
            top_left_addr_col <= unsigned(curr_addr_1(4 downto 0)) - 2;
            ----LEFT MOVEMENT----
            if (action_number = "00") then
                check_1_row <= "000";
                check_1_col <= "001";
                
                check_2_row <= "100";
                check_2_col <= "000";
                
                check_3_row <= "010";
                check_3_col <= "001";

            ----RIGHT MOVEMENT----
            elsif (action_number = "01") then
                check_1_row <= "000";
                check_1_col <= "011";
                
                check_2_row <= "001";
                check_2_col <= "011";
                
                check_3_row <= "010";
                check_3_col <= "011";
                
            ----ROTATION MOVEMENT----
            elsif (action_number = "10") then
                check_1_row <= "001";
                check_1_col <= "011";
                
                next_addr_1_row <= unsigned(curr_addr_1(9 downto 5)) + 1;
                next_addr_1_col <= unsigned(curr_addr_1(4 downto 0)) + 1;
                
                next_addr_3_row <= unsigned(curr_addr_3(9 downto 5)) - 1;
                next_addr_3_col <= unsigned(curr_addr_3(4 downto 0)) - 1;
                
                next_addr_4_row <= unsigned(curr_addr_4(9 downto 5)) - 1;
                next_addr_4_col <= unsigned(curr_addr_4(4 downto 0)) + 1;
                
                next_rotation <= "10";
            
            ----DOWN MOVEMENT----
            else
                check_1_row <= "010";
                check_1_col <= "001";
                
                check_2_row <= "011";
                check_2_col <= "010";
                
            end if;
            
        ----ROTATION 2----
        elsif (rotation_number = "10") then
            top_left_addr_row <= unsigned(curr_addr_1(9 downto 5)) - 1;
            top_left_addr_col <= unsigned(curr_addr_1(4 downto 0)) - 3;
            ----LEFT MOVEMENT----
            if (action_number = "00") then
                check_1_row <= "001";
                check_1_col <= "000";
                
                check_2_row <= "000";
                check_2_col <= "001";

            ----RIGHT MOVEMENT----
            elsif (action_number = "01") then
                check_1_row <= "000";
                check_1_col <= "011";
                
                check_2_row <= "001";
                check_2_col <= "100";
            
            ----ROTATION MOVEMENT----
            elsif (action_number = "10") then
                check_1_row <= "010";
                check_1_col <= "010";
                
                next_addr_1_row <= unsigned(curr_addr_1(9 downto 5)) + 1;
                next_addr_1_col <= unsigned(curr_addr_1(4 downto 0)) - 1;
                
                next_addr_3_row <= unsigned(curr_addr_3(9 downto 5)) - 1;
                next_addr_3_col <= unsigned(curr_addr_3(4 downto 0)) + 1;
                
                next_addr_4_row <= unsigned(curr_addr_4(9 downto 5)) + 1;
                next_addr_4_col <= unsigned(curr_addr_4(4 downto 0)) + 1;
                
                next_rotation <= "11";
            
            ----DOWN MOVEMENT----
            else
                check_1_row <= "010";
                check_1_col <= "001";
                
                check_2_row <= "010";
                check_2_col <= "010";
                
                check_3_row <= "010";
                check_3_col <= "011";
                
            end if;
            
        ----ROTATION 3----
        else
            top_left_addr_row <= unsigned(curr_addr_1(9 downto 5)) - 2;
            top_left_addr_col <= unsigned(curr_addr_1(4 downto 0)) - 2;
            ----LEFT MOVEMENT----
            if (action_number = "00") then
                check_1_row <= "000";
                check_1_col <= "001";
                
                check_2_row <= "001";
                check_2_col <= "001";
                
                check_3_row <= "010";
                check_3_col <= "001";

            ----RIGHT MOVEMENT----
            elsif (action_number = "01") then
                check_1_row <= "000";
                check_1_col <= "011";
                
                check_2_row <= "001";
                check_2_col <= "100";
                
                check_3_row <= "010";
                check_3_col <= "011";
            
            ----ROTATION MOVEMENT----
            elsif (action_number = "10") then
                check_1_row <= "001";
                check_1_col <= "001";
                
                next_addr_1_row <= unsigned(curr_addr_1(9 downto 5)) - 1;
                next_addr_1_col <= unsigned(curr_addr_1(4 downto 0)) - 1;
                
                next_addr_3_row <= unsigned(curr_addr_3(9 downto 5)) + 1;
                next_addr_3_col <= unsigned(curr_addr_3(4 downto 0)) + 1;
                
                next_addr_4_row <= unsigned(curr_addr_4(9 downto 5)) + 1;
                next_addr_4_col <= unsigned(curr_addr_4(4 downto 0)) - 1;
                
                next_rotation <= "00";
            
            ----DOWN MOVEMENT----
            else
                check_1_row <= "011";
                check_1_col <= "010";
                
                check_2_row <= "010";
                check_2_col <= "011";
                
            end if;
        end if;
    end if;

end process;

next_addr_1 <= std_logic_vector(next_addr_1_row) & std_logic_vector(next_addr_1_col);
next_addr_2 <= std_logic_vector(next_addr_2_row) & std_logic_vector(next_addr_2_col);
next_addr_3 <= std_logic_vector(next_addr_3_row) & std_logic_vector(next_addr_3_col);
next_addr_4 <= std_logic_vector(next_addr_4_row) & std_logic_vector(next_addr_4_col);



check_addr_1 <= "0000000000" when (check_1_row = 7) else
                std_logic_vector(resize(check_1_row, 5) + top_left_addr_row) & std_logic_vector(resize(check_1_col, 5) + top_left_addr_col);
check_addr_2 <= "0000000000" when (check_2_row = 7) else
                std_logic_vector(resize(check_2_row, 5) + top_left_addr_row) & std_logic_vector(resize(check_2_col, 5) + top_left_addr_col);
check_addr_3 <= "0000000000" when (check_3_row = 7) else
                std_logic_vector(resize(check_3_row, 5) + top_left_addr_row) & std_logic_vector(resize(check_3_col, 5) + top_left_addr_col);
check_addr_4 <= "0000000000" when (check_4_row = 7) else
                std_logic_vector(resize(check_4_row, 5) + top_left_addr_row) & std_logic_vector(resize(check_4_col, 5) + top_left_addr_col);
                
end Behavioral;
