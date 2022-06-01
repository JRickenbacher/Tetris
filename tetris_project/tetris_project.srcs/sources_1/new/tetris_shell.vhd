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
           vsynch_port : out STD_LOGIC;
           seg_ext_port	: out std_logic_vector(0 to 6);
		    dp_ext_port	: out std_logic;
            an_ext_port	: out std_logic_vector(3 downto 0) );
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
           check_lines_tc : in STD_LOGIC;
           clear_lines_tc : in STD_LOGIC;        
           done_drawing : IN STD_LOGIC;
           CLR_DOWN_CNT: OUT STD_LOGIC;
           gameover : IN STD_LOGIC;
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
           memory_update : out STD_LOGIC;
           h_count_port : out STD_LOGIC_VECTOR(9 downto 0);
           v_count_port : out STD_LOGIC_VECTOR(9 downto 0));
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


--+++++++++++++++++++++++++++++++++
--IP Core memory component
--+++++++++++++++++++++++++++++++++
component blk_mem_gen_1 IS
  PORT (
    clka : IN STD_LOGIC;
    ena : IN STD_LOGIC;
    wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    addra : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    dina : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    douta : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
  );
end component;

component Piece_Generator IS
        Port ( clk_port : in STD_LOGIC;
           Generate_Piece_Port : in STD_LOGIC;
           New_Piece_Port : out STD_LOGIC_VECTOR (3 downto 0);
           address_1, address_2, address_3, address_4 : out STD_LOGIC_VECTOR(9 downto 0);
           gameover : in STD_logic
           );
END component;

--+++++++++++++++++++++++++++++++++
--color decoder component
--+++++++++++++++++++++++++++++++++
component Color_Decoder is
    Port ( Piece : in STD_LOGIC_VECTOR (3 downto 0);
           h_count_port : in STD_LOGIC_VECTOR(9 downto 0);
           v_count_port : in STD_LOGIC_VECTOR(9 downto 0);
           video_on_port, currently_playing : in STD_LOGIC;
           Color : out STD_LOGIC_VECTOR (11 downto 0));
end component;

component Down_Counter is
    Port (
        clk : in std_logic;
        down_count_clr, down_count_en, down_pressed : in std_logic;
        clear_line_port : in std_logic;
         score : in STD_LOGIC_VECTOR(15 downto 0);
        currently_playing_port : in std_logic;
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
        rotation_number, action_number : in STD_LOGIC_VECTOR(1 downto 0);
        piece_number : in STD_LOGIC_VECTOR(3 downto 0);
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
            curr_addr_1 : in STD_LOGIC_VECTOR(9 downto 0);
            curr_addr_2 : in STD_LOGIC_VECTOR(9 downto 0);
            curr_addr_3 : in STD_LOGIC_VECTOR(9 downto 0);
            curr_addr_4 : in STD_LOGIC_VECTOR(9 downto 0);
            next_addr_1 : in STD_LOGIC_VECTOR(9 downto 0);
            next_addr_2 : in STD_LOGIC_VECTOR(9 downto 0);
            next_addr_3 : in STD_LOGIC_VECTOR(9 downto 0);
            next_addr_4 : in STD_LOGIC_VECTOR(9 downto 0);
            collision_read_addr : out STD_LOGIC_VECTOR(9 downto 0);
            not_valid_move : out STD_LOGIC
            );
end component;

component memory_interface is
    Port (
        collision_addr, move_addr, VGA_addr, gen_piece_addr, lines_addr, Drawing_Addr_Port, GAMEOVER_ADDR : in std_logic_vector(9 downto 0);
        move_data, gen_piece_data, lines_data, Drawing_Color_Port : in std_logic_vector(3 downto 0);
        check_lines, clear_lines_en: in std_logic;
        write_piece_en, make_move_en, read_collision, video_on, DRAW_EN, CHECK_GAMEOVER_EN : in std_logic;
        addr_out : out std_logic_vector(9 downto 0);
        data_out : out std_logic_vector(3 downto 0)
   );
end component;


component check_lines is
  Port ( clk         : in STD_LOGIC;
         MEM_DATA    : in STD_LOGIC_VECTOR(3 downto 0);
         CHECK_LINES : in STD_LOGIC;
         NEW_SCORE : in STD_LOGIC_VECTOR(1 downto 0);
         clear_lines_en : in STD_LOGIC;       
         MEM_ADDRESS : out STD_LOGIC_VECTOR(9 downto 0);
         GRID_ADDRESS : out STD_LOGIC_VECTOR(7 downto 0);
         CLEAR_LINES : out STD_LOGIC;
         GAME_GRID_IN : out STD_LOGIC_VECTOR(3 downto 0);
         check_lines_tc, clear_lines_tc : out STD_LOGIC;
         SCORE : out STD_LOGIC_VECTOR(15 downto 0);
         clear_line_port : out std_logic
         );
end component;

component mux7seg is
    Port ( clk_port 	: in  std_logic;						-- runs on a fast (1 MHz or so) clock
	       y3_port 		: in  std_logic_vector (3 downto 0);	-- digits
		   y2_port 		: in  std_logic_vector (3 downto 0);	-- digits
		   y1_port 		: in  std_logic_vector (3 downto 0);	-- digits
           y0_port 		: in  std_logic_vector (3 downto 0);	-- digits
           dp_set_port 	: in  std_logic_vector(3 downto 0);     -- decimal points
           seg_port 	: out  std_logic_vector(0 to 6);		-- segments (a...g)
           dp_port 		: out  std_logic;						-- decimal point
           an_port 		: out  std_logic_vector (3 downto 0) );	-- anodes
end component;

component bin2bcd is
    port ( 
        input:      in   std_logic_vector (15 downto 0);
        ones:       out  std_logic_vector (3 downto 0);
        tens:       out  std_logic_vector (3 downto 0);
        hundreds:   out  std_logic_vector (3 downto 0);
        thousands:  out  std_logic_vector (3 downto 0)
    );
end component;


component draw_counter is
  Port ( clk_port : in std_logic;
        clear_draw_count_port : in std_logic;
        drawing_addr_port : out std_logic_vector(9 downto 0);
        done_drawing_port : out std_logic
         );
end component;

component Get_Drawing_Color is
  Port ( drawing_addr_port : in std_logic_vector(9 downto 0);
        drawing_number_port : in std_logic_vector(1 downto 0);
        color_port : out std_logic_vector(3 downto 0)
         );
end component;

component checking_gameover is
  Port (
        clk : in STD_LOGIC;
        check_gameover_en : in STD_LOGIC;
        read_data : in STD_LOGIC_VECTOR(3 downto 0);
        address_1, address_2, address_3, address_4 : in STD_LOGIC_VECTOR(9 downto 0);
        gameover_addr : out STD_LOGIC_VECTOR(9 downto 0);
        gameover : out STD_LOGIC
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

signal v_count_signal : STD_LOGIC_VECTOR(9 downto 0) := (others => '0');
signal h_count_signal : STD_LOGIC_VECTOR(9 downto 0) := (others => '0');

signal up_key_signal, down_key_signal, left_key_signal, right_key_signal, down_key_signal_mp : STD_LOGIC := '0';

signal memory_update_signal : std_logic := '0';
signal video_on_signal : std_logic := '0';

signal new_addr_1_signal, new_addr_2_signal, new_addr_3_signal, new_addr_4_signal : STD_LOGIC_VECTOR(9 downto 0) := (others => '0');

signal curr_addr_1_signal, curr_addr_2_signal, curr_addr_3_signal, curr_addr_4_signal : STD_LOGIC_VECTOR(9 downto 0) := (others => '0');

signal next_move_addr_1_signal, next_move_addr_2_signal, next_move_addr_3_signal, next_move_addr_4_signal : STD_LOGIC_VECTOR(9 downto 0) := (others => '0');

signal check_addr_1_signal, check_addr_2_signal, check_addr_3_signal, check_addr_4_signal : STD_LOGIC_VECTOR(9 downto 0) := (others => '0');

signal make_move_addr_signal : STD_LOGIC_VECTOR(9 downto 0) := (others => '0');
signal make_move_data_signal : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');

signal mem_interface_addr_signal : STD_LOGIC_VECTOR(9 downto 0) := (others => '0');
signal mem_interface_data_signal : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');



signal down_tc_signal, not_valid_signal, clr_down_cnt_signal, req_move_signal, load_next_move_en_signal, load_gen_en_signal, load_new_action_en_signal : std_logic := '0'; 
signal gen_piece_signal, write_new_piece_en_signal, READ_COLLISION_signal, make_move_en_signal : std_logic := '0'; 

signal WRITE_EN_signal, game_grid_write_en_signal : std_logic_vector(0 downto 0) := "0";

signal current_action_signal, next_action_signal : std_logic_vector(1 downto 0) := "00";

signal vga_read_addr_signal, write_new_piece_addr_signal, collision_read_addr_signal : STD_LOGIC_VECTOR(9 downto 0) := (others => '0');

signal current_piece_number_signal, new_piece_number_signal : std_logic_vector(3 downto 0) := "0000";
signal current_rotation_number_signal, next_rotation_number_signal : std_logic_vector(1 downto 0) := "00";

--check lines signals
signal check_lines_signal, clear_lines_signal, clear_lines_en_signal : STD_LOGIC := '0';
signal game_grid_output_signal, game_grid_input_signal : std_logic_vector(3 downto 0) := "0000";
signal game_grid_address_signal : std_logic_vector(7 downto 0) := "00000000";
signal check_lines_address_signal : STD_LOGIC_VECTOR(9 downto 0) := (others => '0');
signal check_lines_tc_signal : std_logic := '0';
signal clear_lines_tc_signal : std_logic := '0';
signal clear_line_signal : std_logic := '0';

--drawing signals
signal clear_draw_count_signal : STD_LOGIC := '0';
signal Drawing_Addr_Signal : STD_LOGIC_VECTOR(9 downto 0) := (others => '0');
signal Drawing_Color_Signal : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
signal done_drawing_signal : STD_LOGIC := '0';
signal drawing_number_signal : STD_LOGIC_VECTOR(1 downto 0) := (others => '0');
signal draw_en_signal : std_logic := '0';
signal currently_playing_signal : STD_LOGIC := '0';

--check gameover signals
signal CHECK_GAMEOVER_EN_signal : STD_LOGIC := '0';
signal GAMEOVER_ADDR_signal : STD_LOGIC_VECTOR(9 downto 0) := (others => '0');
signal gameover_signal : std_logic := '0';
signal score_signal : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
signal ones_signal, tens_signal, hundreds_signal, thousands_signal : STD_LOGIC_VECTOR(3 downto 0);
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
       MEMORY_UPDATE => memory_update_signal,
       KEY_UP => up_key_signal,
       KEY_LEFT => left_key_signal,
       KEY_RIGHT => right_key_signal,
       KEY_DOWN => down_key_signal_mp,
       DOWN_TC => down_tc_signal,
       NOT_VALID => not_valid_signal,
       CURRENT_ACTION => current_action_signal,
       CLEAR_LINES => clear_lines_signal,        
       clear_lines_tc => clear_lines_tc_signal,
       CLR_DOWN_CNT => clr_down_cnt_signal,
       done_drawing => done_drawing_signal,
       gameover => gameover_signal,
       REQ_MOVE => req_move_signal,
       LOAD_NEXT_MOVE_EN => load_next_move_en_signal,
       LOAD_GEN_EN => load_gen_en_signal,
       LOAD_NEW_ACTION_EN => load_new_action_en_signal,
       GEN_PIECE => gen_piece_signal,
       WRITE_NEW_PIECE_EN => write_new_piece_en_signal,
       WRITE_EN => WRITE_EN_signal,
       NEXT_ACTION => next_action_signal,
       READ_COLLISION => READ_COLLISION_signal,
       MAKE_MOVE_EN => make_move_en_signal,
       CHECK_LINES => check_lines_signal,
       CLEAR_LINES_EN => clear_lines_en_signal,
       GAME_GRID_MEM_WRITE_EN => game_grid_write_en_signal,
       clear_draw_count => clear_draw_count_signal,
       drawing_number => drawing_number_signal,
       currently_playing => currently_playing_signal,
       CHECK_GAMEOVER_EN => CHECK_GAMEOVER_EN_signal,
       check_lines_tc => check_lines_tc_signal
);	
--+++++++++++++++++++++++++++++++++
-- Wire check lines
--+++++++++++++++++++++++++++++++++
check_lines_block : check_lines port map(
         clk         => pixel_clk_signal,
         MEM_DATA    => read_mem_signal,
         NEW_SCORE => drawing_number_signal,
         CHECK_LINES => check_lines_signal,
         clear_lines_en => clear_lines_en_signal,
         MEM_ADDRESS => check_lines_address_signal,
         GRID_ADDRESS => game_grid_address_signal,
         CLEAR_LINES => clear_lines_signal, 
         GAME_GRID_IN => game_grid_input_signal,
         check_lines_tc => check_lines_tc_signal,
         clear_lines_tc => clear_lines_tc_signal,
         score => score_signal,
         clear_line_port => clear_line_signal
         );


seven_seg: mux7seg port map(
	clk_port	=> pixel_clk_signal,		--should get the 1 MHz system clk
	y3_port		=> thousands_signal,		--left most digit
	y2_port 	=> hundreds_signal,		--center left digit
	y1_port 	=> tens_signal,		--center right digit
	y0_port 	=> ones_signal,		--right most digit
	dp_set_port => "0000",	--you get this one for free too
	seg_port 	=> seg_ext_port,
	dp_port 	=> dp_ext_port,
	an_port 	=> an_ext_port);	
	
BINtoBCD : bin2bcd 
    port map( 
        input => score_signal,
        ones => ones_signal,
        tens => tens_signal,
        hundreds => hundreds_signal,
        thousands => thousands_signal
    );

--+++++++++++++++++++++++++++++++++
-- Wire UP Button to Input Conditioning
--+++++++++++++++++++++++++++++++++
input_conditioning_up : button_interface port map(
          clk_port          => pixel_clk_signal,
		  button_port       => KEY_UP_PORT,
		  button_db_port    => open,
		  button_mp_port    => up_key_signal
		  );	
--+++++++++++++++++++++++++++++++++
-- Wire DOWN Button to Input Conditioning
--+++++++++++++++++++++++++++++++++
input_conditioning_down : button_interface port map(
          clk_port          => pixel_clk_signal,
		  button_port       => KEY_DOWN_PORT,
		  button_db_port    => down_key_signal,
		  button_mp_port    => down_key_signal_mp
		  );	
--+++++++++++++++++++++++++++++++++
-- Wire LEFT Button to Input Conditioning
--+++++++++++++++++++++++++++++++++
input_conditioning_left : button_interface port map(
          clk_port          => pixel_clk_signal,
		  button_port       => KEY_LEFT_PORT,
		  button_db_port    => open,
		  button_mp_port    => left_key_signal
		  );	
--+++++++++++++++++++++++++++++++++
-- Wire RIGHT Button to Input Conditioning
--+++++++++++++++++++++++++++++++++
input_conditioning_right : button_interface port map(
          clk_port          => pixel_clk_signal,
		  button_port       => KEY_RIGHT_PORT,
		  button_db_port    => open,
		  button_mp_port    => right_key_signal
		  );	

--++++++++++++++++++++++++++++++++++
--Wire VGA Controller into the shell:
--++++++++++++++++++++++++++++++++++
vga_controller_block: vga_controller port map(
    pixel_clk => pixel_clk_signal,
    hsync => hsynch_port,
    vsync => vsynch_port,
    vga_read_addr => vga_read_addr_signal,
    vblank => open,
    hblank => open,
    v_count_port => v_count_signal,
    h_count_port => h_count_signal,
    video_on => video_on_signal,
    memory_update => memory_update_signal);

--+++++++++++++++++++++++++++++++++
--Wire VGA Test Block into the shell:
--+++++++++++++++++++++++++++++++++
memory: blk_mem_gen_0 PORT map(
    clka => pixel_clk_signal,
    ena => '1',
    wea => WRITE_EN_signal,
    addra => mem_interface_addr_signal,
    dina => mem_interface_data_signal,
    douta => read_mem_signal
  );

--+++++++++++++++++++++++++++++++++
--Game Grid Memory:
--+++++++++++++++++++++++++++++++++
grid_memory: blk_mem_gen_1 PORT map(
    clka => pixel_clk_signal,
    ena => '1',
    wea => game_grid_write_en_signal,
    addra => game_grid_address_signal,
    dina => game_grid_input_signal,
    douta => game_grid_output_signal
  );
  
piece_generation: Piece_Generator PORT MAP(
   clk_port => pixel_clk_signal,
   Generate_Piece_Port => gen_piece_signal,
   New_Piece_Port => new_piece_number_signal,
   address_1 => new_addr_1_signal, 
   address_2 => new_addr_2_signal, 
   address_3 => new_addr_3_signal, 
   address_4  => new_addr_4_signal,
   gameover => gameover_signal
);
--+++++++++++++++++++++++++++++++++
--Wire color decoder
--+++++++++++++++++++++++++++++++++
color: color_decoder port map(
          Piece => read_mem_signal,
          v_count_port => v_count_signal,
          h_count_port => h_count_signal,
          video_on_port => VIDEO_ON_SIGNAL,
          Color => color_port,
          currently_playing => currently_playing_signal
          );

address_generator_block: Address_Generator PORT MAP(
    curr_addr_1 => curr_addr_1_signal,
    curr_addr_2 => curr_addr_2_signal,
    curr_addr_3 => curr_addr_3_signal,
    curr_addr_4 => curr_addr_4_signal,
    rotation_number => current_rotation_number_signal,
    action_number => current_action_signal,
    piece_number => current_piece_number_signal,
    next_addr_1 => next_move_addr_1_signal,
    next_addr_2 => next_move_addr_2_signal,
    next_addr_3 => next_move_addr_3_signal,
    next_addr_4 => next_move_addr_4_signal,
    next_rotation => next_rotation_number_signal
    );

collision_detector: Collision_detection PORT MAP(
    clk => pixel_clk_signal,
    request_move => req_move_signal,
    color_output => read_mem_signal,
    curr_addr_1 => curr_addr_1_signal,
    curr_addr_2 => curr_addr_2_signal,
    curr_addr_3 => curr_addr_3_signal,
    curr_addr_4 => curr_addr_4_signal,
    next_addr_1 => next_move_addr_1_signal,
    next_addr_2 => next_move_addr_2_signal,
    next_addr_3 => next_move_addr_3_signal,
    next_addr_4 => next_move_addr_4_signal,
    collision_read_addr => collision_read_addr_signal,
    not_valid_move => not_valid_signal
    );

down_counter_block : down_counter PORT MAP(
        clk => pixel_clk_signal,
        down_count_clr => clr_down_cnt_signal,
        down_count_en => memory_update_signal,
        down_pressed => down_key_signal,
        score => score_signal,
        clear_line_port => clear_line_signal,
        currently_playing_port => currently_playing_signal,
        down_triggered => down_tc_signal
  );

make_move_block : make_move PORT MAP(
        clk => pixel_clk_signal,
        curr_addr_1 => curr_addr_1_signal,
        curr_addr_2 => curr_addr_2_signal,
        curr_addr_3 => curr_addr_3_signal,
        curr_addr_4 => curr_addr_4_signal,
        next_addr_1 => next_move_addr_1_signal,
        next_addr_2 => next_move_addr_2_signal,
        next_addr_3 => next_move_addr_3_signal,
        next_addr_4 => next_move_addr_4_signal,
        make_move_en => make_move_en_signal,
        curr_piece => current_piece_number_signal,
        update_data => make_move_data_signal,
        update_addr => make_move_addr_signal
  );
  
memory_interface_block : memory_interface PORT MAP(
        collision_addr => collision_read_addr_signal,
        move_addr => make_move_addr_signal,
        VGA_addr => vga_read_addr_signal,
        gen_piece_addr => write_new_piece_addr_signal,
        move_data => make_move_data_signal,
        lines_addr => check_lines_address_signal,
        lines_data => game_grid_output_signal,
        check_lines => check_lines_signal,
        clear_lines_en => clear_lines_en_signal,
        gen_piece_data => current_piece_number_signal,
        write_piece_en => write_new_piece_en_signal,
        make_move_en => make_move_en_signal,
        read_collision => READ_COLLISION_signal,
        video_on => video_on_signal,
        addr_out => mem_interface_addr_signal,
        data_out => mem_interface_data_signal,
        Drawing_Addr_Port => Drawing_Addr_Signal,
        Drawing_Color_Port => Drawing_Color_Signal,
        DRAW_EN => DRAW_EN_SIGNAL,
        GAMEOVER_ADDR => GAMEOVER_ADDR_signal,
        CHECK_GAMEOVER_EN => CHECK_GAMEOVER_EN_signal
   );
   
piece_memory_block : piece_memory PORT MAP(
        clk => pixel_clk_signal,
        next_move_addr_1 => next_move_addr_1_signal,
        next_move_addr_2 => next_move_addr_2_signal,
        next_move_addr_3 => next_move_addr_3_signal,
        next_move_addr_4 => next_move_addr_4_signal,
        next_gen_addr_1 => new_addr_1_signal,
        next_gen_addr_2 => new_addr_2_signal,
        next_gen_addr_3 => new_addr_3_signal,
        next_gen_addr_4 => new_addr_4_signal,
        next_rotation => next_rotation_number_signal,
        next_piece_number => new_piece_number_signal,
        next_action => next_action_signal,
        load_next_move_en => load_next_move_en_signal,
        load_next_gen_en => load_gen_en_signal,
        load_new_action_en => load_new_action_en_signal,
        curr_addr_1 => curr_addr_1_signal,
        curr_addr_2 => curr_addr_2_signal,
        curr_addr_3 => curr_addr_3_signal,
        curr_addr_4 => curr_addr_4_signal,
        curr_rotation => current_rotation_number_signal,
        curr_piece_number => current_piece_number_signal,
        curr_action => current_action_signal
   );

write_new_piece_block : write_new_piece
  PORT MAP (
        clk => pixel_clk_signal,
        curr_addr_1 => curr_addr_1_signal,
        curr_addr_2 => curr_addr_2_signal,
        curr_addr_3 => curr_addr_3_signal,
        curr_addr_4 => curr_addr_4_signal,
        write_new_piece_en => write_new_piece_en_signal,
        write_new_piece_address => write_new_piece_addr_signal
  );
  
draw_counter_block : Draw_Counter
  Port MAP ( 
        clk_port => pixel_clk_signal,
        clear_draw_count_port => clear_draw_count_signal,
        drawing_addr_port => Drawing_Addr_Signal,
        done_drawing_port => done_drawing_signal
   );

Get_Drawing_Color_block : Get_Drawing_Color
  Port MAP ( 
        drawing_addr_port => Drawing_Addr_Signal,
        drawing_number_port => drawing_number_signal,
        color_port => Drawing_Color_Signal
  );
  
checking_gameover_block : checking_gameover
  Port MAP (
        clk => pixel_clk_signal,
        check_gameover_en => CHECK_GAMEOVER_EN_signal,
        read_data => read_mem_signal,
        address_1 => new_addr_1_signal, 
        address_2 => new_addr_2_signal,
        address_3 => new_addr_3_signal,
        address_4 => new_addr_4_signal,
        gameover_addr => GAMEOVER_ADDR_signal,
        gameover => gameover_signal
   );

address <= row_signal & col_signal;
draw_en_signal <= NOT(clear_draw_count_signal);

end Behavioral;
