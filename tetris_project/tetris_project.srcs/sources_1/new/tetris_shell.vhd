----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
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

architecture Behavioral of vga_test_shell is
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
    Port(  PIXEL_CLK : in STD_LOGIC;
           MEMORY_UPDATE : in STD_LOGIC;
           KEY_UP : IN STD_LOGIC;
           KEY_DOWN : IN STD_LOGIC;
           KEY_LEFT : IN STD_LOGIC;
           KEY_RIGHT : IN STD_LOGIC;
           DOWN_TC : IN STD_LOGIC;        
           CLR_DOWN_CNT: OUT STD_LOGIC 
           );	
end component;

--+++++++++++++++++++++++++++++++++
--VGA Controller
--+++++++++++++++++++++++++++++++++
component vga_controller is
    Port ( pixel_clk : in STD_LOGIC;
           hsync : out STD_LOGIC;
           vsync : out STD_LOGIC;
           row : out STD_LOGIC_VECTOR(4 downto 0);
           col : out STD_LOGIC_VECTOR(4 downto 0);
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

--signal hsynch_signal : STD_LOGIC := '0';
--signal vsynch_signal : STD_LOGIC := '0';

--+++++++++++++++++++++++++++++++++
--VGA Test Pattern
--+++++++++++++++++++++++++++++++++
--signal color_signal : STD_LOGIC_VECTOR(11 downto 0) := (others => '0');

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
game_controller : tetris_game_controller port map(
          PIXEL_CLK => pixel_clk_signal,
          MEMORY_UPDATE => '0',
          KEY_UP  => '0',
          KEY_DOWN => '0',
          KEY_LEFT => '0',
          KEY_RIGHT => '0',
          DOWN_TC => '0',       
          CLR_DOWN_CNT => open
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
controller: vga_controller port map(
    pixel_clk => pixel_clk_signal,
    hsync => hsynch_port,
    vsync => vsynch_port,
    row => row_signal,
    col => col_signal,
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

address <= row_signal & col_signal;

end Behavioral;
