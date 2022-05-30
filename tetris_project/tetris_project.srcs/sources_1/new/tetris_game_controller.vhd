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
           KEY_DOWN : IN STD_LOGIC;
           DOWN_TC : IN STD_LOGIC;
           NOT_VALID : IN STD_LOGIC;
           CURRENT_ACTION : IN STD_LOGIC_VECTOR(1 downto 0);
           CLEAR_LINES  : IN STD_LOGIC;        
           done_drawing : IN STD_LOGIC;
           gameover : IN STD_LOGIC;
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
           MAKE_MOVE_EN : OUT STD_LOGIC;
           CHECK_LINES : OUT STD_LOGIC;
           CLEAR_LINES_EN : OUT STD_LOGIC;
           GAME_GRID_MEM_WRITE_EN : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
           clear_draw_count : OUT STD_LOGIC;
           drawing_number : OUT STD_LOGIC_VECTOR(1 downto 0);
           currently_playing : OUT STD_LOGIC;
           CHECK_GAMEOVER_EN : OUT STD_LOGIC
);
end tetris_game_controller;

architecture Behavioral of tetris_game_controller is

type state_type is (GenNewPiece, LoadNewPiece, WriteNewPiece, CheckLines, ClearLines, MainWait, StoreUp, StoreLeft, StoreRight, 
                    StoreDown, CheckValidMove, WaitValidMove, MakeMove, LoadNewMove, InterpretValidMove, WaitLines,
                    StartWait, DrawTetris, WaitTetris, PrepDrawGameBoard, DrawGameBoard, CheckGameOver, DrawGameOver, WaitGameOver);
signal CS, NS : state_type := StartWait;

signal count_write_new_piece_en : std_logic := '0';
signal write_new_piece_count : unsigned(1 downto 0) := "00";
signal write_new_piece_tc : std_logic := '0';

signal count_valid_move_en : std_logic := '0';
signal valid_move_count : unsigned(2 downto 0) := "000";
signal valid_move_tc : std_logic := '0';

signal count_make_move_en : std_logic := '0';
signal make_move_count : unsigned(2 downto 0) := "000";
signal make_move_tc : std_logic := '0';

signal check_lines_count_en : std_logic := '0';
signal check_lines_count : unsigned(7 downto 0) := "00000000";
signal check_lines_tc : std_logic := '0';

signal clear_lines_count_en : std_logic := '0';
signal clear_lines_count : unsigned(7 downto 0) := "00000000";
signal clear_lines_tc : std_logic := '0';


signal wait_lines_en : std_logic := '0';
signal wait_lines_count : unsigned(2 downto 0) := "000";
signal wait_lines_tc : std_logic := '0';

SIGNAL CHECK_GAMEOVER_EN_SIGNAL : STD_LOGIC := '0';
SIGNAL CHECK_GAMEOVER_COUNT : UNSIGNED(2 DOWNTO 0) := (OTHERS => '0');
SIGNAL CHECK_GAMEOVER_TC : STD_LOGIC := '0';

begin

state_update : process(PIXEL_CLK)
begin
    if rising_edge(PIXEL_CLK) then
        CS <= NS;
    end if;
end process state_update;

next_state_logic : process(CS, KEY_UP, KEY_LEFT, KEY_RIGHT, KEY_DOWN, MEMORY_UPDATE, NOT_VALID, DOWN_TC, 
                            CURRENT_ACTION, write_new_piece_tc, valid_move_tc, make_move_tc, 
                            clear_lines, check_lines_tc, clear_lines_tc, wait_lines_tc,
                            Done_drawing, gameover)
begin
    
    NS <= CS;

    case(CS) is
    
        WHEN StartWait =>
            if (memory_update = '1') then
                NS <= DrawTetris;
            end if;
        
        WHEN DrawTetris =>
            if (done_drawing = '1') then
                NS <= WaitTetris;
            end if;
        
        WHEN WaitTetris =>
            if ((KEY_UP = '1') OR (KEY_LEFT = '1') OR (KEY_RIGHT = '1') OR (KEY_DOWN = '1')) then
                NS <= PrepDrawGameBoard;
            end if;
        
        WHEN PrepDrawGameBoard =>
            if (memory_update = '1') then
                NS <= DrawGameBoard;
            end if;
        
        WHEN DrawGameBoard =>
            if (done_drawing = '1') then
                NS <= GenNewPiece;
            end if;
        
        WHEN GenNewPiece =>
            NS <= CheckGameOver;
            
        WHEN CheckGameOver =>
            if (check_gameover_tc = '1') then
                if (gameover = '1') then
                    NS <= DrawGameOver;
                else
                    NS <= LoadNewPiece;
                end if;
            end if;
        
        WHEN DrawGameOver =>
            if (done_drawing = '1') then
                NS <= WaitGameOver;
            end if;
        
        WHEN WaitGameOver =>
            if ((KEY_UP = '1') OR (KEY_LEFT = '1') OR (KEY_RIGHT = '1') OR (KEY_DOWN = '1')) then
                NS <= StartWait;
            end if;
            
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
            if (memory_update = '1' and DOWN_TC = '1') then
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
            NS <= CheckValidMove;
            
        WHEN CheckValidMove =>
            NS <= WaitValidMove;
        
        WHEN WaitValidMove =>
            if (valid_move_tc = '1') then
                NS <= InterpretValidMove;
            end if;


        WHEN InterpretValidMove =>
            if (NOT_VALID = '0') then
                NS <= MakeMove;
            else
                if (CURRENT_ACTION = "11") then
                    NS <= CheckLines;
                else
                    NS <= MainWait;
                end if;
            end if;
        
        WHEN MakeMove =>
            if (make_move_tc = '1') then
                NS <= LoadNewMove;
            end if;
            
        WHEN LoadNewMove =>
--            NS <= CheckLines;
            NS <= MainWait;
        
        WHEN CheckLines => 
            if check_lines_tc = '1' then
                if clear_lines = '1' then
                    NS <= WaitLines;
                else
                  NS <= GenNewPiece;
                end if;
             end if;
       WHEN WaitLines =>
            if wait_lines_tc = '1' then
                NS <= ClearLines;
            end if;
                
                
        WHEN ClearLines => 
            if clear_lines_tc = '1' then
                NS <= GenNewPiece;
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
    count_make_move_en <= '0';
    count_write_new_piece_en <= '0';
    count_valid_move_en <= '0';
    CHECK_LINES <= '0';
    check_lines_count_en <= '0';
    CLEAR_LINES_EN <= '0';
    clear_lines_count_en <= '0';
    GAME_GRID_MEM_WRITE_EN <= "1";
    clear_draw_count <= '1';
    drawing_number <= "00";
    currently_playing <= '1';
    CHECK_GAMEOVER_EN_SIGNAL <= '0';
    wait_lines_en <= '0';
    case(CS) is
    
        WHEN StartWait =>
            currently_playing <= '0';
        
        WHEN DrawTetris =>
            drawing_number <= "00";
            clear_draw_count <= '0';
            WRITE_EN <= "1";
            currently_playing <= '0';
            
        WHEN WaitTetris =>
            currently_playing <= '0';
            
        WHEN PrepDrawGameBoard =>
            currently_playing <= '0';
        
        WHEN DrawGameBoard =>
            drawing_number <= "01";
            clear_draw_count <= '0';
            WRITE_EN <= "1";
            currently_playing <= '0';
    
        WHEN GenNewPiece =>
            GEN_PIECE <= '1';
            CLR_DOWN_CNT <= '1';
            currently_playing <= '0';
            
        WHEN CheckGameOver =>
            CHECK_GAMEOVER_EN_SIGNAL <= '1';            
        
        WHEN DrawGameOver =>
            drawing_number <= "10";
            clear_draw_count <= '0';
            WRITE_EN <= "1";
            currently_playing <= '0';
            
        WHEN WaitGameOver =>
            currently_playing <= '0';
            
        WHEN LoadNewPiece =>
            Load_gen_en <= '1';
            
        WHEN WriteNewPiece =>
            count_write_new_piece_en <= '1';
            write_new_piece_en <= '1';
            write_en <= "1";
        
        WHEN StoreUp =>
            LOAD_NEW_ACTION_EN <= '1';
            NEXT_ACTION <= "10";
        
        WHEN StoreLeft =>
            LOAD_NEW_ACTION_EN <= '1';
            NEXT_ACTION <= "00";
        
        WHEN StoreRight =>
            LOAD_NEW_ACTION_EN <= '1';
            NEXT_ACTION <= "01";
            
        WHEN StoreDown =>
            LOAD_NEW_ACTION_EN <= '1';
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
            if (CURRENT_ACTION = "11") then
                CLR_DOWN_CNT <= '1';
            end if;
            
        WHEN LoadNewMove =>
            LOAD_NEXT_MOVE_EN <= '1';

        WHEN CheckLines =>
            CHECK_LINES <= '1';
            check_lines_count_en <= '1';
       
        WHEN ClearLines =>
            CLEAR_LINES_EN <= '1';
            clear_lines_count_en <= '1';
            GAME_GRID_MEM_WRITE_EN <= "0";
            WRITE_EN <= "1";
        WHEN WaitLines =>
             wait_lines_en <= '1';

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

count_check_lines : process(pixel_clk)
begin

    if rising_edge(pixel_clk) then
        if check_lines_count_en = '1' then
            check_lines_count <= check_lines_count + 1;
        end if;
        if check_lines_tc = '1' then 
            check_lines_count <= "00000000";
        end if;
    end if;

end process;

check_lines_tc <= '1' when (check_lines_count = 210) else '0';



wait_lines_move : process(pixel_clk)
begin

    if rising_edge(pixel_clk) then
        if wait_lines_en = '1' then
            wait_lines_count <= wait_lines_count + 1;
        end if;
        if wait_lines_tc = '1' then 
            wait_lines_count <= "000";
        end if;
    end if;

end process;



wait_lines_tc <= '1' when (wait_lines_count = "111") else
                 '0';
                 
                 
count_clear_lines : process(pixel_clk)
begin

    if rising_edge(pixel_clk) then
        if clear_lines_count_en = '1' then
            clear_lines_count <= clear_lines_count + 1;
        end if;
        if clear_lines_tc = '1' then 
            clear_lines_count <= "00000000";
        end if;
    end if;

end process;

clear_lines_tc <= '1' when (clear_lines_count = 211) else '0';

COUNT_CHECK_GAMEOVER : process(pixel_clk)
begin

    if rising_edge(pixel_clk) then
        if (CHECK_GAMEOVER_EN_SIGNAL = '1') then
            CHECK_GAMEOVER_COUNT <= CHECK_GAMEOVER_COUNT + 1;
        end if;
        if CHECK_GAMEOVER_TC = '1' then 
            CHECK_GAMEOVER_COUNT <= (OTHERS => '0');
        end if;
    end if;

end process;

CHECK_GAMEOVER_TC <= '1' when (CHECK_GAMEOVER_COUNT = 6) else '0';
CHECK_GAMEOVER_EN <= CHECK_GAMEOVER_EN_SIGNAL;

end Behavioral;
