----------------------------------------------------------------------------------
-- Company: Dartmouth College
-- Engineer: Nestor Orozco-Llamas and Jason Rickenbacher
-- 
-- Create Date: 05/22/2022 10:09:43 PM
-- Design Name: 
-- Module Name: tetris_game_controller - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: Tetris Controller
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

entity tetris_game_controller is
    Port ( PIXEL_CLK : in STD_LOGIC;
           MEMORY_UPDATE : in STD_LOGIC;
           KEY_UP : IN STD_LOGIC;
           KEY_LEFT : IN STD_LOGIC;
           KEY_RIGHT : IN STD_LOGIC;
           DOWN_TC : IN STD_LOGIC;
           NOT_VALID : IN STD_LOGIC;
           CURRENT_ACTION : IN STD_LOGIC_VECTOR(1 downto 0);        
           CLR_DOWN_CNT: OUT STD_LOGIC;
           REQ_MOVE : OUT STD_LOGIC;
           LOAD_NEXT_MOVE_EN : OUT STD_LOGIC;
           LOAD_GEN_EN : OUT STD_LOGIC;
           LOAD_NEW_ACTION_EN : OUT STD_LOGIC;
           GEN_PIECE : OUT STD_LOGIC;
           WRITE_NEW_PIECE_EN : OUT STD_LOGIC;
           WRITE_EN : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
           NEXT_ACTION : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
           READ_COLLISION : OUT STD_LOGIC;
           MAKE_MOVE_EN : OUT STD_LOGIC
);
end tetris_game_controller;

architecture Behavioral of tetris_game_controller is

type state_type is (GenNewPiece, LoadNewPiece, WriteNewPiece, MainWait, StoreUp, StoreLeft, StoreRight, StoreDown, CheckValidMove, WaitValidMove, MakeMove);
signal CS, NS : state_type := GenNewPiece;

signal count_write_new_piece_en : std_logic := '0';
signal write_new_piece_count : unsigned(1 downto 0) := "00";
signal write_new_piece_tc : std_logic := '0';

signal count_valid_move_en : std_logic := '0';
signal valid_move_count : unsigned(2 downto 0) := "000";
signal valid_move_tc : std_logic := '0';

signal count_make_move_en : std_logic := '0';
signal make_move_count : unsigned(2 downto 0) := "000";
signal make_move_tc : std_logic := '0';

begin

state_update : process(PIXEL_CLK)
begin
    if rising_edge(PIXEL_CLK) then
        CS <= NS;
    end if;
end process state_update;

next_state_logic : process(CS, KEY_UP, KEY_LEFT, KEY_RIGHT, MEMORY_UPDATE, NOT_VALID, DOWN_TC, CURRENT_ACTION)
begin
    
    NS <= CS;

    case(CS) is
        
        WHEN GenNewPiece =>
            NS <= LoadNewPiece;
            
        WHEN LoadNewPiece =>
            if memory_update = '1' then
                NS <= WriteNewPiece;
            end if;
            
        WHEN WriteNewPiece =>
            if (write_new_piece_tc = '1') then
                NS <= MainWait;
            end if;
        
        WHEN MainWait =>
            if (Key_Right = '1') then
                NS <= StoreRight;
            end if;
            if (Key_Left = '1') then
                NS <= StoreLeft;
            end if;
            if (Key_Up = '1') then
                NS <= StoreUp;
            end if;
            if (DOWN_TC = '1') then
                NS <= StoreDown;
            end if;
        
        WHEN StoreUp =>
            if memory_update = '1' then
                NS <= CheckValidMove;
            end if;
        
        WHEN StoreLeft =>
            if memory_update = '1' then
                NS <= CheckValidMove;
            end if;
        
        WHEN StoreRight =>
            if memory_update = '1' then
                NS <= CheckValidMove;
            end if;
        
        WHEN StoreDown =>
            if memory_update = '1' then
                NS <= CheckValidMove;
            end if;
        
        WHEN CheckValidMove =>
            NS <= WaitValidMove;
        
        WHEN WaitValidMove =>
            if (valid_move_tc = '1') then
                if (NOT_VALID = '0') then
                    NS <= MakeMove;
                else
                    if (CURRENT_ACTION = "11") then
                        NS <= GenNewPiece;
                    else
                        NS <= MainWait;
                    end if;
                end if;
            end if;
        
        WHEN MakeMove =>
            if (make_move_tc = '1') then
                NS <= MainWait;
            end if;
        
        WHEN others =>
            NS <= GenNewPiece;
        
    end case;
end process next_state_logic;

output_logic : process(CS)
begin
-- defaults
    CLR_DOWN_CNT <= '0';
    REQ_MOVE <= '0';
    LOAD_NEXT_MOVE_EN <= '0';
    LOAD_GEN_EN <= '0';
    LOAD_NEW_ACTION_EN <= '0';
    GEN_PIECE <= '0';
    WRITE_NEW_PIECE_EN <= '0';
    WRITE_EN <= "0";
    NEXT_ACTION <= "00";
    READ_COLLISION <= '0';
    MAKE_MOVE_EN <= '0';

    case(CS) is
    
        WHEN GenNewPiece =>
            GEN_PIECE <= '1';
            CLR_DOWN_CNT <= '1';
            
        WHEN LoadNewPiece =>
            Load_gen_en <= '1';
            
        WHEN WriteNewPiece =>
            count_write_new_piece_en <= '1';
            write_new_piece_en <= '1';
            write_en <= "1";
        
        WHEN StoreUp =>
            LOAD_NEXT_MOVE_EN <= '1';
            NEXT_ACTION <= "10";
        
        WHEN StoreLeft =>
            LOAD_NEXT_MOVE_EN <= '1';
            NEXT_ACTION <= "00";
        
        WHEN StoreRight =>
            LOAD_NEXT_MOVE_EN <= '1';
            NEXT_ACTION <= "01";
            
        WHEN StoreDown =>
            LOAD_NEXT_MOVE_EN <= '1';
            NEXT_ACTION <= "11";
        
        WHEN CheckValidMove =>
            REQ_MOVE <= '1';
        
        WHEN WaitValidMove =>
            count_valid_move_en <= '1';
            READ_COLLISION <= '1';
        
        WHEN MakeMove =>
            count_make_move_en <= '1';
            MAKE_MOVE_EN <= '1';
            WRITE_EN <= "1";

        WHEN others =>
            CLR_DOWN_CNT <= '0';
            REQ_MOVE <= '0';
            LOAD_NEXT_MOVE_EN <= '0';
            LOAD_GEN_EN <= '0';
            LOAD_NEW_ACTION_EN <= '0';
            GEN_PIECE <= '0';
            WRITE_NEW_PIECE_EN <= '0';
            WRITE_EN <= "0";
            NEXT_ACTION <= "00";
            READ_COLLISION <= '0';
            MAKE_MOVE_EN <= '0';
                
    end case;
end process output_logic;

count_write_new_piece : process(pixel_clk)
begin

    if rising_edge(pixel_clk) then
        if count_write_new_piece_en = '1' then
            write_new_piece_count <= write_new_piece_count + 1;
        end if;
        if write_new_piece_tc = '1' then 
            write_new_piece_count <= "00";
        end if;
    end if;

end process;

write_new_piece_tc <= '1' when (write_new_piece_count = "11") else
                      '0';

count_valid_move : process(pixel_clk)
begin

    if rising_edge(pixel_clk) then
        if count_valid_move_en = '1' then
            valid_move_count <= valid_move_count + 1;
        end if;
        if valid_move_tc = '1' then 
            valid_move_count <= "000";
        end if;
    end if;

end process;

valid_move_tc <= '1' when (valid_move_count = "101") else
                 '0';

count_make_move : process(pixel_clk)
begin

    if rising_edge(pixel_clk) then
        if count_make_move_en = '1' then
            make_move_count <= make_move_count + 1;
        end if;
        if make_move_tc = '1' then 
            make_move_count <= "000";
        end if;
    end if;

end process;

make_move_tc <= '1' when (make_move_count = "111") else
                 '0';


end Behavioral;
