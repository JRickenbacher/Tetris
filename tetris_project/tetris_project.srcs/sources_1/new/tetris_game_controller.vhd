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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tetris_game_controller is
    Port ( PIXEL_CLK : in STD_LOGIC;
           MEMORY_UPDATE : in STD_LOGIC;
           KEY_UP : IN STD_LOGIC;
           KEY_DOWN : IN STD_LOGIC;
           KEY_LEFT : IN STD_LOGIC;
           KEY_RIGHT : IN STD_LOGIC;
           DOWN_TC : IN STD_LOGIC;        
           CLR_DOWN_CNT: OUT STD_LOGIC      
);
end tetris_game_controller;

architecture Behavioral of tetris_game_controller is

type state_type is (waitInit, newGame, gameOver, generatePiece, waitAction, checkDown, moveDown, checkLines, clearLines, checkGO, storeAction, toggleDownCnt, checkRight, checkLeft, moveRight, moveLeft, checkRotate, rotatePiece);
signal CS, NS : state_type := waitInit;

begin

state_update : process(PIXEL_CLK)
begin
if rising_edge(PIXEL_CLK) then
    CS <= NS;
end if;
end process state_update;

next_state_logic : process(CS, KEY_UP, KEY_DOWN, KEY_LEFT, KEY_RIGHT, MEMORY_UPDATE)
begin


case(CS) is

    when waitInit =>
        if KEY_UP = '1' then
            NS <= newGame;
        end if;
        
    when newGame =>
        if MEMORY_UPDATE = '1' then
            NS <= CS;
        end if;
        
    when generatePiece =>
    when waitAction =>
    when checkDown =>
    when moveDown =>
    when checkLines =>
    when clearLines =>
    when checkGO =>
    when storeAction =>
    when toggleDownCnt =>
    when checkRight =>
    when checkLeft =>
    when moveRight =>
    when moveLeft =>
    when checkRotate =>
    when rotatePiece =>
    when gameOver =>
    when others =>
        NS <= CS;
end case;
end process next_state_logic;

output_logic : process(CS)
begin
-- defaults


case(CS) is

    when waitInit =>       
    when newGame =>
    when generatePiece =>
    when waitAction =>
    when checkDown =>
    when moveDown =>
    when checkLines =>
    when clearLines =>
    when checkGO =>
    when storeAction =>
    when toggleDownCnt =>
    when checkRight =>
    when checkLeft =>
    when moveRight =>
    when moveLeft =>
    when checkRotate =>
    when rotatePiece =>
    when gameOver =>
    when others =>
        NS <= CS;
end case;
end process output_logic;


end Behavioral;
