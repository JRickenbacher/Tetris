----------------------------------------------------------------------------------
-- Company: Dartmouth College
-- Engineer: Nestor Orozco-Llamas and Jason Rickenbacher
-- 
-- Create Date: 05/26/2022 03:21:05 PM
-- Design Name: 
-- Module Name: tetris_shell - Behavioral
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tetris_shell is
    Port ( clk_ext_port : in STD_LOGIC;
           KEY_UP_PORT : in STD_LOGIC;
           KEY_DOWN_PORT : in STD_LOGIC;
           KEY_LEFT_PORT : in STD_LOGIC;
           KEY_RIGHT_PORT : in STD_LOGIC;
           color_port : out STD_LOGIC_VECTOR (11 downto 0);
           hsynch_port : out STD_LOGIC;
           vsynch_port : out STD_LOGIC);
end tetris_shell;

architecture Behavioral of tetris_shell is
--=================================
--Sub component Declarations
--=================================
--+++++++++++++++++++++++++++++++++
--Pixel Clock Generator
--+++++++++++++++++++++++++++++++++
component pixel_clock_generator is
    port (
            --External clock
            input_clk_port		: in std_logic;
            --Pixel clock
            pixel_clk_port	    : out std_logic);
end component;

--+++++++++++++++++++++++++++++++++
-- Input Conditioning - Debouncing - Synchronizer - Monopulse or Direct Button
--+++++++++++++++++++++++++++++++++
component button_interface is
    Port( clk_port            : in  std_logic;
		  button_port         : in  std_logic;
		  button_db_port      : out std_logic;
		  button_mp_port      : out std_logic);	
end component;

--+++++++++++++++++++++++++++++++++
-- Tetris Game Controller
--+++++++++++++++++++++++++++++++++
component tetris_game_controller is
    Port ( PIXEL_CLK        : in STD_LOGIC;
           MEMORY_UPDATE    : in STD_LOGIC;
           KEY_UP           : in STD_LOGIC;
           KEY_LEFT         : in STD_LOGIC;
           KEY_RIGHT        : IN STD_LOGIC;
           DOWN_TC          : IN STD_LOGIC;
           NOT_VALID        : IN STD_LOGIC;
           CURRENT_ACTION   : IN STD_LOGIC_VECTOR(1 downto 0);        
           CLR_DOWN_CNT     : OUT STD_LOGIC;
           REQ_MOVE         : OUT STD_LOGIC;
           LOAD_NEXT_MOVE_EN: OUT STD_LOGIC;
           LOAD_GEN_EN      : OUT STD_LOGIC;
           LOAD_NEW_ACTION_EN : OUT STD_LOGIC;
           GEN_PIECE : OUT STD_LOGIC;
           WRITE_NEW_PIECE_EN : OUT STD_LOGIC;
           WRITE_EN : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
           NEXT_ACTION : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
           READ_COLLISION : OUT STD_LOGIC;
           MAKE_MOVE_EN : OUT STD_LOGIC
);
end component;

--+++++++++++++++++++++++++++++++++
--VGA Controller
--+++++++++++++++++++++++++++++++++
component vga_controller is
    Port ( pixel_clk : in STD_LOGIC;
           hsync : out STD_LOGIC;
           vsync : out STD_LOGIC;
           vga_read_addr : out STD_LOGIC_VECTOR(9 downto 0);
           vblank : out STD_LOGIC;
           hblank : out STD_LOGIC;
           video_on : out STD_LOGIC;
           memory_update : out STD_LOGIC);
end component;

--+++++++++++++++++++++++++++++++++
--IP Core memory component
--+++++++++++++++++++++++++++++++++
component blk_mem_gen_0 IS
  PORT (
    clka : IN STD_LOGIC;
    ena : IN STD_LOGIC;
    wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    addra : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
    dina : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    douta : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
  );
end component;
  
component Piece_Generator IS
        Port ( clk_port : in STD_LOGIC;
           Generate_Piece_Port : in STD_LOGIC;
           New_Piece_Port : out STD_LOGIC_VECTOR (3 downto 0);
           address_1, address_2, address_3, address_4 : out STD_LOGIC_VECTOR(9 downto 0) );
END component;

--+++++++++++++++++++++++++++++++++
--color decoder component
--+++++++++++++++++++++++++++++++++
component Color_Decoder is
    Port ( Piece : in STD_LOGIC_VECTOR (3 downto 0);
           Color : out STD_LOGIC_VECTOR (11 downto 0));
end component;

component Down_Counter is
    Port (
        clk : in std_logic;
        down_count_clr, down_count_en, down_pressed : in std_logic;
        down_triggered : out std_logic
  );
end component;

component write_new_piece is
    Port (
        clk : in std_logic;
        curr_addr_1, curr_addr_2, curr_addr_3, curr_addr_4 : in std_logic_vector(9 downto 0);
        write_new_piece_en : in std_logic;
        write_new_piece_address : out std_logic_vector(9 downto 0)
  );
end component;

component piece_memory is
    Port (
        clk: in std_logic;
        next_move_addr_1, next_move_addr_2, next_move_addr_3, next_move_addr_4: in std_logic_vector(9 downto 0);
        next_gen_addr_1, next_gen_addr_2, next_gen_addr_3, next_gen_addr_4: in std_logic_vector(9 downto 0);
        next_rotation : in std_logic_vector(1 downto 0);
        next_piece_number : in std_logic_vector(3 downto 0);
        next_action : in std_logic_vector(1 downto 0);
        load_next_move_en, load_next_gen_en, load_new_action_en : in std_logic; 
        curr_addr_1, curr_addr_2, curr_addr_3, curr_addr_4: out std_logic_vector(9 downto 0);
        curr_rotation : out std_logic_vector(1 downto 0);
        curr_piece_number: out std_logic_vector(3 downto 0);
        curr_action : out std_logic_vector(1 downto 0)
   );
end component;

component address_generator is
    Port (
        curr_addr_1, curr_addr_2, curr_addr_3, curr_addr_4 : in STD_LOGIC_VECTOR(9 downto 0);
        rotation_number, action_number : in STD_LOGIC_VECTOR(2 downto 0);
        piece_number : in STD_LOGIC_VECTOR(3 downto 0);
        check_addr_1, check_addr_2, check_addr_3, check_addr_4 : out STD_LOGIC_VECTOR(9 downto 0);
        next_addr_1, next_addr_2, next_addr_3, next_addr_4 : out STD_LOGIC_VECTOR(9 downto 0);
        next_rotation : out STD_LOGIC_VECTOR(1 downto 0)
  );
end component;

component make_move is
    Port (
            clk : in std_logic;
            curr_addr_1, curr_addr_2, curr_addr_3, curr_addr_4 : in std_logic_vector(9 downto 0);
            next_addr_1, next_addr_2, next_addr_3, next_addr_4 : in std_logic_vector(9 downto 0);
            make_move_en : in std_logic;
            curr_piece : in std_logic_vector(3 downto 0);
            update_data : out std_logic_vector(3 downto 0);
            update_addr : out std_logic_vector(9 downto 0)
      );
end component;

component collision_detection is
    Port ( 
            clk : in STD_LOGIC;
            request_move : in STD_LOGIC;
            color_output : in STD_LOGIC_VECTOR(3 downto 0);
            check_addr_1, check_addr_2, check_addr_3, check_addr_4 : in STD_LOGIC_VECTOR(9 downto 0);
            collision_read_addr : out STD_LOGIC_VECTOR(9 downto 0);
            not_valid_move : out STD_LOGIC
            );
end component;

component memory_interface is
    Port (
        collision_addr, move_addr, VGA_addr, gen_piece_addr : in std_logic_vector(9 downto 0);
        move_data, gen_piece_data : in std_logic_vector(3 downto 0);
        write_piece_en, make_move_en, read_collision, video_on : in std_logic;
        addr_out : out std_logic_vector(9 downto 0);
        data_out : out std_logic_vector(3 downto 0)
   );
end component;

--=================================
--Sub component Declarations
--=================================
--+++++++++++++++++++++++++++++++++
--Pixel Clock
--+++++++++++++++++++++++++++++++++
signal pixel_clk_signal : STD_LOGIC := '0';

--+++++++++++++++++++++++++++++++++
--VGA Controller
--+++++++++++++++++++++++++++++++++
signal row_signal : STD_LOGIC_VECTOR(4 downto 0) := (others => '0');
signal col_signal : STD_LOGIC_VECTOR(4 downto 0) := (others => '0');
signal read_mem_signal : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
signal address : STD_LOGIC_VECTOR(9 downto 0) := (others => '0');

begin
--+++++++++++++++++++++++++++++++++
--Wire pixel clock generator into the shell:
--+++++++++++++++++++++++++++++++++
clocking: pixel_clock_generator port map(
    input_clk_port => clk_ext_port,     -- External clock
    pixel_clk_port => pixel_clk_signal);   -- pixel clock

--+++++++++++++++++++++++++++++++++
-- Wire UP Button to Input Conditioning
--+++++++++++++++++++++++++++++++++
game_controller : tetris_game_controller 
    Port Map
     ( PIXEL_CLK => pixel_clk_signal,
       MEMORY_UPDATE => ,
       KEY_UP => ,
       KEY_LEFT => ,
       KEY_RIGHT => ,
       DOWN_TC => ,
       NOT_VALID => ,
       CURRENT_ACTION => ,        
       CLR_DOWN_CNT => ,
       REQ_MOVE => ,
       LOAD_NEXT_MOVE_EN => ,
       LOAD_GEN_EN => ,
       LOAD_NEW_ACTION_EN => ,
       GEN_PIECE => ,
       WRITE_NEW_PIECE_EN => ,
       WRITE_EN => ,
       NEXT_ACTION => ,
       READ_COLLISION => ,
       MAKE_MOVE_EN => 
);	

--+++++++++++++++++++++++++++++++++
-- Wire UP Button to Input Conditioning
--+++++++++++++++++++++++++++++++++
input_conditioning_up : button_interface port map(
          clk_port          => pixel_clk_signal,
		  button_port       => KEY_UP_PORT,
		  button_db_port    => open,
		  button_mp_port    => open
		  );	
--+++++++++++++++++++++++++++++++++
-- Wire DOWN Button to Input Conditioning
--+++++++++++++++++++++++++++++++++
input_conditioning_down : button_interface port map(
          clk_port          => pixel_clk_signal,
		  button_port       => KEY_DOWN_PORT,
		  button_db_port    => open,
		  button_mp_port    => open
		  );	
--+++++++++++++++++++++++++++++++++
-- Wire LEFT Button to Input Conditioning
--+++++++++++++++++++++++++++++++++
input_conditioning_left : button_interface port map(
          clk_port          => pixel_clk_signal,
		  button_port       => KEY_LEFT_PORT,
		  button_db_port    => open,
		  button_mp_port    => open
		  );	
--+++++++++++++++++++++++++++++++++
-- Wire RIGHT Button to Input Conditioning
--+++++++++++++++++++++++++++++++++
input_conditioning_right : button_interface port map(
          clk_port          => pixel_clk_signal,
		  button_port       => KEY_RIGHT_PORT,
		  button_db_port    => open,
		  button_mp_port    => open
		  );	

--++++++++++++++++++++++++++++++++++
--Wire VGA Controller into the shell:
--++++++++++++++++++++++++++++++++++
vga_controller_block: vga_controller port map(
    pixel_clk => pixel_clk_signal,
    hsync => hsynch_port,
    vsync => vsynch_port,
    vga_read_addr => ,
    vblank => open,
    hblank => open,
    video_on => open,
    memory_update => open);

--+++++++++++++++++++++++++++++++++
--Wire VGA Test Block into the shell:
--+++++++++++++++++++++++++++++++++
memory: blk_mem_gen_0 PORT map(
    clka => pixel_clk_signal,
    ena => '1',
    wea => "0",
    addra => address,
    dina => "0000",
    douta => read_mem_signal
  );

piece_generation: Piece_Generator PORT MAP(
   clk_port => pixel_clk_signal,
   Generate_Piece_Port => '0',
   New_Piece_Port => open,
   address_1 => open, 
   address_2 => open, 
   address_3 => open, 
   address_4  => open
);
--+++++++++++++++++++++++++++++++++
--Wire color decoder
--+++++++++++++++++++++++++++++++++
color: color_decoder port map(
          Piece => read_mem_signal,
          Color => color_port
          );

address_generator_block: Address_Generator PORT MAP(
    curr_addr_1 => ,
    curr_addr_2 => ,
    curr_addr_3 => ,
    curr_addr_4 => ,
    rotation_number => ,
    action_number => ,
    piece_number => ,
    check_addr_1 => ,
    check_addr_2 => ,
    check_addr_3 => ,
    check_addr_4 => ,
    next_addr_1 => ,
    next_addr_2 => ,
    next_addr_3 => ,
    next_addr_4 => ,
    next_rotation => 
    );

collision_detector: Collision_detection PORT MAP(
    clk => pixel_clk_signal,
    request_move => ,
    color_output => ,
    check_addr_1 => ,
    check_addr_2 => ,
    check_addr_3, => ,
    check_addr_4 => ,
    collision_read_addr => ,
    not_valid_move => 
    );

down_counter_block : down_counter PORT MAP(
        clk => ,
        down_count_clr => ,
        down_count_en => ,
        down_pressed => ,
        down_triggered => 
  );

make_move_block : make_move PORT MAP(
        clk => pixel_clk_signal,
        curr_addr_1 => ,
        curr_addr_2 => ,
        curr_addr_3 => ,
        curr_addr_4 => ,
        next_addr_1 => ,
        next_addr_2 => ,
        next_addr_3 => ,
        next_addr_4 => ,
        make_move_en => ,
        curr_piece => ,
        update_data => ,
        update_addr => 
  );
  
memory_interface_block : memory_interface PORT MAP(
        collision_addr => ,
        move_addr => ,
        VGA_addr => ,
        gen_piece_addr => ,
        move_data => ,
        gen_piece_data => ,
        write_piece_en => ,
        make_move_en => ,
        read_collision => ,
        video_on => ,
        addr_out => ,
        data_out => 
   );
   
piece_memory_block : piece_memory PORT MAP(
        clk => pixel_clk_signal,
        next_move_addr_1 => ,
        next_move_addr_2 => ,
        next_move_addr_3 => ,
        next_move_addr_4 => ,
        next_gen_addr_1 => ,
        next_gen_addr_2 => ,
        next_gen_addr_3 => ,
        next_gen_addr_4 => ,
        next_rotation => ,
        next_piece_number => ,
        next_action => ,
        load_next_move_en => ,
        load_next_gen_en => ,
        load_new_action_en => ,
        curr_addr_1 => ,
        curr_addr_2 => ,
        curr_addr_3 => ,
        curr_addr_4 => ,
        curr_rotation => ,
        curr_piece_number => ,
        curr_action => 
   );

write_new_piece_block : write_new_piece
  PORT MAP (
        clk => pixel_clk_signal,
        curr_addr_1 => ,
        curr_addr_2 => ,
        curr_addr_3 => ,
        curr_addr_4 => ,
        write_new_piece_en => ,
        write_new_piece_address => ,
  );

address <= row_signal & col_signal;

end Behavioral;
