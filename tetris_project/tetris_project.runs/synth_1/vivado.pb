
y
Command: %s
53*	vivadotcl2H
4synth_design -top tetris_shell -part xc7a35tcpg236-12default:defaultZ4-113h px? 
:
Starting synth_design
149*	vivadotclZ4-321h px? 
?
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2
	Synthesis2default:default2
xc7a35t2default:defaultZ17-347h px? 
?
0Got license for feature '%s' and/or device '%s'
310*common2
	Synthesis2default:default2
xc7a35t2default:defaultZ17-349h px? 
?
%s*synth2?
xStarting RTL Elaboration : Time (s): cpu = 00:00:02 ; elapsed = 00:00:03 . Memory (MB): peak = 420.734 ; gain = 102.051
2default:defaulth px? 
?
synthesizing module '%s'638*oasys2 
tetris_shell2default:default2h
RO:/ENGS31/Tetris/tetris_project/tetris_project.srcs/sources_1/new/tetris_shell.vhd2default:default2
482default:default8@Z8-638h px? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2)
pixel_clock_generator2default:default2i
UO:/ENGS31/Tetris/tetris_project/tetris_project.srcs/sources_1/new/clock_generator.vhd2default:default2
172default:default2
clocking2default:default2)
pixel_clock_generator2default:default2h
RO:/ENGS31/Tetris/tetris_project/tetris_project.srcs/sources_1/new/tetris_shell.vhd2default:default2
4102default:default8@Z8-3491h px? 
?
synthesizing module '%s'638*oasys2)
pixel_clock_generator2default:default2k
UO:/ENGS31/Tetris/tetris_project/tetris_project.srcs/sources_1/new/clock_generator.vhd2default:default2
262default:default8@Z8-638h px? 
?
,binding component instance '%s' to cell '%s'113*oasys2&
pixel_clock_buffer2default:default2
BUFG2default:default2k
UO:/ENGS31/Tetris/tetris_project/tetris_project.srcs/sources_1/new/clock_generator.vhd2default:default2
622default:default8@Z8-113h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2)
pixel_clock_generator2default:default2
12default:default2
12default:default2k
UO:/ENGS31/Tetris/tetris_project/tetris_project.srcs/sources_1/new/clock_generator.vhd2default:default2
262default:default8@Z8-256h px? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2*
tetris_game_controller2default:default2p
\O:/ENGS31/Tetris/tetris_project/tetris_project.srcs/sources_1/new/tetris_game_controller.vhd2default:default2
322default:default2#
game_controller2default:default2*
tetris_game_controller2default:default2h
RO:/ENGS31/Tetris/tetris_project/tetris_project.srcs/sources_1/new/tetris_shell.vhd2default:default2
4172default:default8@Z8-3491h px? 
?
synthesizing module '%s'638*oasys2*
tetris_game_controller2default:default2r
\O:/ENGS31/Tetris/tetris_project/tetris_project.srcs/sources_1/new/tetris_game_controller.vhd2default:default2
682default:default8@Z8-638h px? 
?
Esignal '%s' is read in the process but is not in the sensitivity list614*oasys2%
CHECK_GAMEOVER_TC2default:default2r
\O:/ENGS31/Tetris/tetris_project/tetris_project.srcs/sources_1/new/tetris_game_controller.vhd2default:default2
1132default:default8@Z8-614h px? 
?
Esignal '%s' is read in the process but is not in the sensitivity list614*oasys2"
CURRENT_ACTION2default:default2r
\O:/ENGS31/Tetris/tetris_project/tetris_project.srcs/sources_1/new/tetris_game_controller.vhd2default:default2
2722default:default8@Z8-614h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2*
tetris_game_controller2default:default2
22default:default2
12default:default2r
\O:/ENGS31/Tetris/tetris_project/tetris_project.srcs/sources_1/new/tetris_game_controller.vhd2default:default2
682default:default8@Z8-256h px? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
check_lines2default:default2e
QO:/ENGS31/Tetris/tetris_project/tetris_project.srcs/sources_1/new/check_lines.vhd2default:default2
322default:default2%
check_lines_block2default:default2
check_lines2default:default2h
RO:/ENGS31/Tetris/tetris_project/tetris_project.srcs/sources_1/new/tetris_shell.vhd2default:default2
4552default:default8@Z8-3491h px? 
?
synthesizing module '%s'638*oasys2
check_lines2default:default2g
QO:/ENGS31/Tetris/tetris_project/tetris_project.srcs/sources_1/new/check_lines.vhd2default:default2
482default:default8@Z8-638h px? 
?
+Unused sequential element %s was removed. 
4326*oasys2,
delayed_clear_line_3_reg2default:default2g
QO:/ENGS31/Tetris/tetris_project/tetris_project.srcs/sources_1/new/check_lines.vhd2default:default2
1572default:default8@Z8-6014h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2
check_lines2default:default2
32default:default2
12default:default2g
QO:/ENGS31/Tetris/tetris_project/tetris_project.srcs/sources_1/new/check_lines.vhd2default:default2
482default:default8@Z8-256h px? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
mux7seg2default:default2j
VO:/ENGS31/Tetris/tetris_project/tetris_project.srcs/sources_1/new/seven_seg_driver.vhd2default:default2
252default:default2
	seven_seg2default:default2
mux7seg2default:default2h
RO:/ENGS31/Tetris/tetris_project/tetris_project.srcs/sources_1/new/tetris_shell.vhd2default:default2
4722default:default8@Z8-3491h px? 
?
synthesizing module '%s'638*oasys2
mux7seg2default:default2l
VO:/ENGS31/Tetris/tetris_project/tetris_project.srcs/sources_1/new/seven_seg_driver.vhd2default:default2
372default:default8@Z8-638h px? 
?
default block is never used226*oasys2l
VO:/ENGS31/Tetris/tetris_project/tetris_project.srcs/sources_1/new/seven_seg_driver.vhd2default:default2
732default:default8@Z8-226h px? 
?
default block is never used226*oasys2l
VO:/ENGS31/Tetris/tetris_project/tetris_project.srcs/sources_1/new/seven_seg_driver.vhd2default:default2
872default:default8@Z8-226h px? 
?
default block is never used226*oasys2l
VO:/ENGS31/Tetris/tetris_project/tetris_project.srcs/sources_1/new/seven_seg_driver.vhd2default:default2
972default:default8@Z8-226h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2
mux7seg2default:default2
42default:default2
12default:default2l
VO:/ENGS31/Tetris/tetris_project/tetris_project.srcs/sources_1/new/seven_seg_driver.vhd2default:default2
372default:default8@Z8-256h px? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
bin2bcd2default:default2g
SO:/ENGS31/Tetris/tetris_project/tetris_project.srcs/sources_1/new/Binary_to_BCD.vhd2default:default2
52default:default2
BINtoBCD2default:default2
bin2bcd2default:default2h
RO:/ENGS31/Tetris/tetris_project/tetris_project.srcs/sources_1/new/tetris_shell.vhd2default:default2
4832default:default8@Z8-3491h px? 
?
synthesizing module '%s'638*oasys2
bin2bcd2default:default2i
SO:/ENGS31/Tetris/tetris_project/tetris_project.srcs/sources_1/new/Binary_to_BCD.vhd2default:default2
152default:default8@Z8-638h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2
bin2bcd2default:default2
52default:default2
12default:default2i
SO:/ENGS31/Tetris/tetris_project/tetris_project.srcs/sources_1/new/Binary_to_BCD.vhd2default:default2
152default:default8@Z8-256h px? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2$
button_interface2default:default2l
XO:/ENGS31/Tetris/tetris_project/tetris_project.srcs/sources_1/new/input_conditioning.vhd2default:default2
142default:default2)
input_conditioning_up2default:default2$
button_interface2default:default2h
RO:/ENGS31/Tetris/tetris_project/tetris_project.srcs/sources_1/new/tetris_shell.vhd2default:default2
4952default:default8@Z8-3491h px? 
?
synthesizing module '%s'638*oasys2$
button_interface2default:default2n
XO:/ENGS31/Tetris/tetris_project/tetris_project.srcs/sources_1/new/input_conditioning.vhd2default:default2
242default:default8@Z8-638h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2$
button_interface2default:default2
62default:default2
12default:default2n
XO:/ENGS31/Tetris/tetris_project/tetris_project.srcs/sources_1/new/input_conditioning.vhd2default:default2
242default:default8@Z8-256h px? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2$
button_interface2default:default2l
XO:/ENGS31/Tetris/tetris_project/tetris_project.srcs/sources_1/new/input_conditioning.vhd2default:default2
142default:default2+
input_conditioning_down2default:default2$
button_interface2default:default2h
RO:/ENGS31/Tetris/tetris_project/tetris_project.srcs/sources_1/new/tetris_shell.vhd2default:default2
5042default:default8@Z8-3491h px? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2$
button_interface2default:default2l
XO:/ENGS31/Tetris/tetris_project/tetris_project.srcs/sources_1/new/input_conditioning.vhd2default:default2
142default:default2+
input_conditioning_left2default:default2$
button_interface2default:default2h
RO:/ENGS31/Tetris/tetris_project/tetris_project.srcs/sources_1/new/tetris_shell.vhd2default:default2
5132default:default8@Z8-3491h px? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2$
button_interface2default:default2l
XO:/ENGS31/Tetris/tetris_project/tetris_project.srcs/sources_1/new/input_conditioning.vhd2default:default2
142default:default2,
input_conditioning_right2default:default2$
button_interface2default:default2h
RO:/ENGS31/Tetris/tetris_project/tetris_project.srcs/sources_1/new/tetris_shell.vhd2default:default2
5222default:default8@Z8-3491h px? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2"
vga_controller2default:default2h
TO:/ENGS31/Tetris/tetris_project/tetris_project.srcs/sources_1/new/vga_controller.vhd2default:default2
312default:default2(
vga_controller_block2default:default2"
vga_controller2default:default2h
RO:/ENGS31/Tetris/tetris_project/tetris_project.srcs/sources_1/new/tetris_shell.vhd2default:default2
5322default:default8@Z8-3491h px? 
?
synthesizing module '%s'638*oasys2"
vga_controller2default:default2j
TO:/ENGS31/Tetris/tetris_project/tetris_project.srcs/sources_1/new/vga_controller.vhd2default:default2
452default:default8@Z8-638h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2"
vga_controller2default:default2
72default:default2
12default:default2j
TO:/ENGS31/Tetris/tetris_project/tetris_project.srcs/sources_1/new/vga_controller.vhd2default:default2
452default:default8@Z8-256h px? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2!
blk_mem_gen_02default:default2?
sO:/ENGS31/Tetris/tetris_project/tetris_project.runs/synth_1/.Xil/Vivado-11576-mecha-4/realtime/blk_mem_gen_0_stub.v2default:default2
62default:default2
memory2default:default2!
blk_mem_gen_02default:default2h
RO:/ENGS31/Tetris/tetris_project/tetris_project.srcs/sources_1/new/tetris_shell.vhd2default:default2
5472default:default8@Z8-3491h px? 
?
synthesizing module '%s'%s4497*oasys2!
blk_mem_gen_02default:default2
 2default:default2?
sO:/ENGS31/Tetris/tetris_project/tetris_project.runs/synth_1/.Xil/Vivado-11576-mecha-4/realtime/blk_mem_gen_0_stub.v2default:default2
62default:default8@Z8-6157h px? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys2!
blk_mem_gen_02default:default2
 2default:default2
82default:default2
12default:default2?
sO:/ENGS31/Tetris/tetris_project/tetris_project.runs/synth_1/.Xil/Vivado-11576-mecha-4/realtime/blk_mem_gen_0_stub.v2default:default2
62default:default8@Z8-6155h px? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2!
blk_mem_gen_12default:default2?
sO:/ENGS31/Tetris/tetris_project/tetris_project.runs/synth_1/.Xil/Vivado-11576-mecha-4/realtime/blk_mem_gen_1_stub.v2default:default2
62default:default2
grid_memory2default:default2!
blk_mem_gen_12default:default2h
RO:/ENGS31/Tetris/tetris_project/tetris_project.srcs/sources_1/new/tetris_shell.vhd2default:default2
5592default:default8@Z8-3491h px? 
?
synthesizing module '%s'%s4497*oasys2!
blk_mem_gen_12default:default2
 2default:default2?
sO:/ENGS31/Tetris/tetris_project/tetris_project.runs/synth_1/.Xil/Vivado-11576-mecha-4/realtime/blk_mem_gen_1_stub.v2default:default2
62default:default8@Z8-6157h px? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys2!
blk_mem_gen_12default:default2
 2default:default2
92default:default2
12default:default2?
sO:/ENGS31/Tetris/tetris_project/tetris_project.runs/synth_1/.Xil/Vivado-11576-mecha-4/realtime/blk_mem_gen_1_stub.v2default:default2
62default:default8@Z8-6155h px? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2#
Piece_Generator2default:default2i
UO:/ENGS31/Tetris/tetris_project/tetris_project.srcs/sources_1/new/Piece_Generator.vhd2default:default2
342default:default2$
piece_generation2default:default2#
Piece_Generator2default:default2h
RO:/ENGS31/Tetris/tetris_project/tetris_project.srcs/sources_1/new/tetris_shell.vhd2default:default2
5682default:default8@Z8-3491h px? 
?
synthesizing module '%s'638*oasys2#
Piece_Generator2default:default2k
UO:/ENGS31/Tetris/tetris_project/tetris_project.srcs/sources_1/new/Piece_Generator.vhd2default:default2
432default:default8@Z8-638h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2#
Piece_Generator2default:default2
102default:default2
12default:default2k
UO:/ENGS31/Tetris/tetris_project/tetris_project.srcs/sources_1/new/Piece_Generator.vhd2default:default2
432default:default8@Z8-256h px? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2!
Color_Decoder2default:default2g
SO:/ENGS31/Tetris/tetris_project/tetris_project.srcs/sources_1/new/Color_Decoder.vhd2default:default2
312default:default2
color2default:default2!
Color_Decoder2default:default2h
RO:/ENGS31/Tetris/tetris_project/tetris_project.srcs/sources_1/new/tetris_shell.vhd2default:default2
5812default:default8@Z8-3491h px? 
?
synthesizing module '%s'638*oasys2!
Color_Decoder2default:default2i
SO:/ENGS31/Tetris/tetris_project/tetris_project.srcs/sources_1/new/Color_Decoder.vhd2default:default2
392default:default8@Z8-638h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2!
Color_Decoder2default:default2
112default:default2
12default:default2i
SO:/ENGS31/Tetris/tetris_project/tetris_project.srcs/sources_1/new/Color_Decoder.vhd2default:default2
392default:default8@Z8-256h px? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2%
address_generator2default:default2k
WO:/ENGS31/Tetris/tetris_project/tetris_project.srcs/sources_1/new/address_generator.vhd2default:default2
342default:default2+
address_generator_block2default:default2%
address_generator2default:default2h
RO:/ENGS31/Tetris/tetris_project/tetris_project.srcs/sources_1/new/tetris_shell.vhd2default:default2
5902default:default8@Z8-3491h px? 
?
synthesizing module '%s'638*oasys2%
address_generator2default:default2m
WO:/ENGS31/Tetris/tetris_project/tetris_project.srcs/sources_1/new/address_generator.vhd2default:default2
442default:default8@Z8-638h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2%
address_generator2default:default2
122default:default2
12default:default2m
WO:/ENGS31/Tetris/tetris_project/tetris_project.srcs/sources_1/new/address_generator.vhd2default:default2
442default:default8@Z8-256h px? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2'
collision_detection2default:default2m
YO:/ENGS31/Tetris/tetris_project/tetris_project.srcs/sources_1/new/collision_detection.vhd2default:default2
332default:default2&
collision_detector2default:default2'
collision_detection2default:default2h
RO:/ENGS31/Tetris/tetris_project/tetris_project.srcs/sources_1/new/tetris_shell.vhd2default:default2
6052default:default8@Z8-3491h px? 
?
synthesizing module '%s'638*oasys2'
collision_detection2default:default2o
YO:/ENGS31/Tetris/tetris_project/tetris_project.srcs/sources_1/new/collision_detection.vhd2default:default2
452default:default8@Z8-638h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2'
collision_detection2default:default2
132default:default2
12default:default2o
YO:/ENGS31/Tetris/tetris_project/tetris_project.srcs/sources_1/new/collision_detection.vhd2default:default2
452default:default8@Z8-256h px? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2 
down_counter2default:default2f
RO:/ENGS31/Tetris/tetris_project/tetris_project.srcs/sources_1/new/down_counter.vhd2default:default2
342default:default2&
down_counter_block2default:default2 
Down_Counter2default:default2h
RO:/ENGS31/Tetris/tetris_project/tetris_project.srcs/sources_1/new/tetris_shell.vhd2default:default2
6212default:default8@Z8-3491h px? 
?
synthesizing module '%s'638*oasys2 
down_counter2default:default2h
RO:/ENGS31/Tetris/tetris_project/tetris_project.srcs/sources_1/new/down_counter.vhd2default:default2
452default:default8@Z8-638h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2 
down_counter2default:default2
142default:default2
12default:default2h
RO:/ENGS31/Tetris/tetris_project/tetris_project.srcs/sources_1/new/down_counter.vhd2default:default2
452default:default8@Z8-256h px? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
	make_move2default:default2c
OO:/ENGS31/Tetris/tetris_project/tetris_project.srcs/sources_1/new/make_move.vhd2default:default2
282default:default2#
make_move_block2default:default2
	make_move2default:default2h
RO:/ENGS31/Tetris/tetris_project/tetris_project.srcs/sources_1/new/tetris_shell.vhd2default:default2
6322default:default8@Z8-3491h px? 
?
synthesizing module '%s'638*oasys2
	make_move2default:default2e
OO:/ENGS31/Tetris/tetris_project/tetris_project.srcs/sources_1/new/make_move.vhd2default:default2
402default:default8@Z8-638h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2
	make_move2default:default2
152default:default2
12default:default2e
OO:/ENGS31/Tetris/tetris_project/tetris_project.srcs/sources_1/new/make_move.vhd2default:default2
402default:default8@Z8-256h px? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2$
memory_interface2default:default2j
VO:/ENGS31/Tetris/tetris_project/tetris_project.srcs/sources_1/new/memory_interface.vhd2default:default2
322default:default2*
memory_interface_block2default:default2$
memory_interface2default:default2h
RO:/ENGS31/Tetris/tetris_project/tetris_project.srcs/sources_1/new/tetris_shell.vhd2default:default2
6482default:default8@Z8-3491h px? 
?
synthesizing module '%s'638*oasys2$
memory_interface2default:default2l
VO:/ENGS31/Tetris/tetris_project/tetris_project.srcs/sources_1/new/memory_interface.vhd2default:default2
462default:default8@Z8-638h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2$
memory_interface2default:default2
162default:default2
12default:default2l
VO:/ENGS31/Tetris/tetris_project/tetris_project.srcs/sources_1/new/memory_interface.vhd2default:default2
462default:default8@Z8-256h px? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2 
piece_memory2default:default2f
RO:/ENGS31/Tetris/tetris_project/tetris_project.srcs/sources_1/new/piece_memory.vhd2default:default2
342default:default2&
piece_memory_block2default:default2 
piece_memory2default:default2h
RO:/ENGS31/Tetris/tetris_project/tetris_project.srcs/sources_1/new/tetris_shell.vhd2default:default2
6722default:default8@Z8-3491h px? 
?
synthesizing module '%s'638*oasys2 
piece_memory2default:default2h
RO:/ENGS31/Tetris/tetris_project/tetris_project.srcs/sources_1/new/piece_memory.vhd2default:default2
522default:default8@Z8-638h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2 
piece_memory2default:default2
172default:default2
12default:default2h
RO:/ENGS31/Tetris/tetris_project/tetris_project.srcs/sources_1/new/piece_memory.vhd2default:default2
522default:default8@Z8-256h px? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2#
write_new_piece2default:default2i
UO:/ENGS31/Tetris/tetris_project/tetris_project.srcs/sources_1/new/write_new_piece.vhd2default:default2
272default:default2)
write_new_piece_block2default:default2#
write_new_piece2default:default2h
RO:/ENGS31/Tetris/tetris_project/tetris_project.srcs/sources_1/new/tetris_shell.vhd2default:default2
6972default:default8@Z8-3491h px? 
?
synthesizing module '%s'638*oasys2#
write_new_piece2default:default2k
UO:/ENGS31/Tetris/tetris_project/tetris_project.srcs/sources_1/new/write_new_piece.vhd2default:default2
362default:default8@Z8-638h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2#
write_new_piece2default:default2
182default:default2
12default:default2k
UO:/ENGS31/Tetris/tetris_project/tetris_project.srcs/sources_1/new/write_new_piece.vhd2default:default2
362default:default8@Z8-256h px? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2 
Draw_Counter2default:default2f
RO:/ENGS31/Tetris/tetris_project/tetris_project.srcs/sources_1/new/Draw_Counter.vhd2default:default2
342default:default2&
draw_counter_block2default:default2 
draw_counter2default:default2h
RO:/ENGS31/Tetris/tetris_project/tetris_project.srcs/sources_1/new/tetris_shell.vhd2default:default2
7082default:default8@Z8-3491h px? 
?
synthesizing module '%s'638*oasys2 
Draw_Counter2default:default2h
RO:/ENGS31/Tetris/tetris_project/tetris_project.srcs/sources_1/new/Draw_Counter.vhd2default:default2
432default:default8@Z8-638h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2 
Draw_Counter2default:default2
192default:default2
12default:default2h
RO:/ENGS31/Tetris/tetris_project/tetris_project.srcs/sources_1/new/Draw_Counter.vhd2default:default2
432default:default8@Z8-256h px? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2%
Get_Drawing_Color2default:default2k
WO:/ENGS31/Tetris/tetris_project/tetris_project.srcs/sources_1/new/Get_Drawing_Color.vhd2default:default2
342default:default2+
Get_Drawing_Color_block2default:default2%
Get_Drawing_Color2default:default2h
RO:/ENGS31/Tetris/tetris_project/tetris_project.srcs/sources_1/new/tetris_shell.vhd2default:default2
7162default:default8@Z8-3491h px? 
?
synthesizing module '%s'638*oasys2%
Get_Drawing_Color2default:default2m
WO:/ENGS31/Tetris/tetris_project/tetris_project.srcs/sources_1/new/Get_Drawing_Color.vhd2default:default2
422default:default8@Z8-638h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2%
Get_Drawing_Color2default:default2
202default:default2
12default:default2m
WO:/ENGS31/Tetris/tetris_project/tetris_project.srcs/sources_1/new/Get_Drawing_Color.vhd2default:default2
422default:default8@Z8-256h px? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2%
checking_gameover2default:default2k
WO:/ENGS31/Tetris/tetris_project/tetris_project.srcs/sources_1/new/checking_gameover.vhd2default:default2
342default:default2+
checking_gameover_block2default:default2%
checking_gameover2default:default2h
RO:/ENGS31/Tetris/tetris_project/tetris_project.srcs/sources_1/new/tetris_shell.vhd2default:default2
7232default:default8@Z8-3491h px? 
?
synthesizing module '%s'638*oasys2%
checking_gameover2default:default2m
WO:/ENGS31/Tetris/tetris_project/tetris_project.srcs/sources_1/new/checking_gameover.vhd2default:default2
452default:default8@Z8-638h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2%
checking_gameover2default:default2
212default:default2
12default:default2m
WO:/ENGS31/Tetris/tetris_project/tetris_project.srcs/sources_1/new/checking_gameover.vhd2default:default2
452default:default8@Z8-256h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2 
tetris_shell2default:default2
222default:default2
12default:default2h
RO:/ENGS31/Tetris/tetris_project/tetris_project.srcs/sources_1/new/tetris_shell.vhd2default:default2
482default:default8@Z8-256h px? 
?
!design %s has unconnected port %s3331*oasys2#
write_new_piece2default:default2&
write_new_piece_en2default:defaultZ8-3331h px? 

!design %s has unconnected port %s3331*oasys2
bin2bcd2default:default2
	input[15]2default:defaultZ8-3331h px? 

!design %s has unconnected port %s3331*oasys2
bin2bcd2default:default2
	input[14]2default:defaultZ8-3331h px? 
?
!design %s has unconnected port %s3331*oasys2*
tetris_game_controller2default:default2"
check_lines_tc2default:defaultZ8-3331h px? 
?
%s*synth2?
xFinished RTL Elaboration : Time (s): cpu = 00:00:04 ; elapsed = 00:00:06 . Memory (MB): peak = 488.445 ; gain = 169.762
2default:defaulth px? 
D
%s
*synth2,

Report Check Netlist: 
2default:defaulth p
x
? 
u
%s
*synth2]
I+------+------------------+-------+---------+-------+------------------+
2default:defaulth p
x
? 
u
%s
*synth2]
I|      |Item              |Errors |Warnings |Status |Description       |
2default:defaulth p
x
? 
u
%s
*synth2]
I+------+------------------+-------+---------+-------+------------------+
2default:defaulth p
x
? 
u
%s
*synth2]
I|1     |multi_driven_nets |      0|        0|Passed |Multi driven nets |
2default:defaulth p
x
? 
u
%s
*synth2]
I+------+------------------+-------+---------+-------+------------------+
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
M
%s
*synth25
!Start Handling Custom Attributes
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Handling Custom Attributes : Time (s): cpu = 00:00:05 ; elapsed = 00:00:07 . Memory (MB): peak = 488.445 ; gain = 169.762
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished RTL Optimization Phase 1 : Time (s): cpu = 00:00:05 ; elapsed = 00:00:07 . Memory (MB): peak = 488.445 ; gain = 169.762
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
V
Loading part %s157*device2#
xc7a35tcpg236-12default:defaultZ21-403h px? 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px? 
>

Processing XDC Constraints
244*projectZ1-262h px? 
=
Initializing timing engine
348*projectZ1-569h px? 
?
$Parsing XDC File [%s] for cell '%s'
848*designutils2?
yo:/ENGS31/Tetris/tetris_project/tetris_project.srcs/sources_1/ip/blk_mem_gen_1/blk_mem_gen_1/blk_mem_gen_1_in_context.xdc2default:default2!
grid_memory	2default:default8Z20-848h px? 
?
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2?
yo:/ENGS31/Tetris/tetris_project/tetris_project.srcs/sources_1/ip/blk_mem_gen_1/blk_mem_gen_1/blk_mem_gen_1_in_context.xdc2default:default2!
grid_memory	2default:default8Z20-847h px? 
?
$Parsing XDC File [%s] for cell '%s'
848*designutils2?
yo:/ENGS31/Tetris/tetris_project/tetris_project.srcs/sources_1/ip/blk_mem_gen_0/blk_mem_gen_0/blk_mem_gen_0_in_context.xdc2default:default2
memory	2default:default8Z20-848h px? 
?
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2?
yo:/ENGS31/Tetris/tetris_project/tetris_project.srcs/sources_1/ip/blk_mem_gen_0/blk_mem_gen_0/blk_mem_gen_0_in_context.xdc2default:default2
memory	2default:default8Z20-847h px? 
?
Parsing XDC File [%s]
179*designutils2n
XO:/ENGS31/Tetris/tetris_project/tetris_project.srcs/constrs_1/new/tetris_constraints.xdc2default:default8Z20-179h px? 
?
Finished Parsing XDC File [%s]
178*designutils2n
XO:/ENGS31/Tetris/tetris_project/tetris_project.srcs/constrs_1/new/tetris_constraints.xdc2default:default8Z20-178h px? 
?
?Implementation specific constraints were found while reading constraint file [%s]. These constraints will be ignored for synthesis but will be used in implementation. Impacted constraints are listed in the file [%s].
233*project2l
XO:/ENGS31/Tetris/tetris_project/tetris_project.srcs/constrs_1/new/tetris_constraints.xdc2default:default22
.Xil/tetris_shell_propImpl.xdc2default:defaultZ1-236h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2 
00:00:00.0012default:default2
819.3632default:default2
0.0002default:defaultZ17-268h px? 
H
&Completed Processing XDC Constraints

245*projectZ1-263h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2
00:00:002default:default2
819.3982default:default2
0.0002default:defaultZ17-268h px? 
~
!Unisim Transformation Summary:
%s111*project29
%No Unisim elements were transformed.
2default:defaultZ1-111h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2 
00:00:00.0012default:default2
819.3982default:default2
0.0002default:defaultZ17-268h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common24
 Constraint Validation Runtime : 2default:default2
00:00:002default:default2 
00:00:00.0172default:default2
819.3982default:default2
0.0002default:defaultZ17-268h px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
~Finished Constraint Validation : Time (s): cpu = 00:00:13 ; elapsed = 00:00:18 . Memory (MB): peak = 819.398 ; gain = 500.715
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
V
%s
*synth2>
*Start Loading Part and Timing Information
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
J
%s
*synth22
Loading part: xc7a35tcpg236-1
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Loading Part and Timing Information : Time (s): cpu = 00:00:13 ; elapsed = 00:00:18 . Memory (MB): peak = 819.398 ; gain = 500.715
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
Z
%s
*synth2B
.Start Applying 'set_property' XDC Constraints
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished applying 'set_property' XDC Constraints : Time (s): cpu = 00:00:13 ; elapsed = 00:00:18 . Memory (MB): peak = 819.398 ; gain = 500.715
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
3inferred FSM for state register '%s' in module '%s'802*oasys2
CS_reg2default:default2*
tetris_game_controller2default:defaultZ8-802h px? 
?
[ROM "%s" won't be mapped to Block RAM because address size (%s) smaller than threshold (%s)3996*oasys2 
CLR_DOWN_CNT2default:default2
22default:default2
52default:defaultZ8-5544h px? 
?
[ROM "%s" won't be mapped to Block RAM because address size (%s) smaller than threshold (%s)3996*oasys2%
CHECK_GAMEOVER_TC2default:default2
32default:default2
52default:defaultZ8-5544h px? 
?
[ROM "%s" won't be mapped to Block RAM because address size (%s) smaller than threshold (%s)3996*oasys2&
write_new_piece_tc2default:default2
22default:default2
52default:defaultZ8-5544h px? 
?
[ROM "%s" won't be mapped to Block RAM because address size (%s) smaller than threshold (%s)3996*oasys2!
valid_move_tc2default:default2
32default:default2
52default:defaultZ8-5544h px? 
?
[ROM "%s" won't be mapped to Block RAM because address size (%s) smaller than threshold (%s)3996*oasys2 
make_move_tc2default:default2
32default:default2
52default:defaultZ8-5544h px? 
?
[ROM "%s" won't be mapped to Block RAM because address size (%s) smaller than threshold (%s)3996*oasys2!
wait_lines_tc2default:default2
32default:default2
52default:defaultZ8-5544h px? 
}
8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2!
wait_lines_en2default:defaultZ8-5546h px? 
?
8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2,
CHECK_GAMEOVER_EN_SIGNAL2default:defaultZ8-5546h px? 
?
TROM size for "%s" is below threshold of ROM address width. It will be mapped to LUTs4039*oasys2%
currently_playing2default:defaultZ8-5587h px? 
~
8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2"
drawing_number2default:defaultZ8-5546h px? 
?
8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2$
clear_draw_count2default:defaultZ8-5546h px? 
?
8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2*
GAME_GRID_MEM_WRITE_EN2default:defaultZ8-5546h px? 
~
8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2"
CLEAR_LINES_EN2default:defaultZ8-5546h px? 
{
8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2
CHECK_LINES2default:defaultZ8-5546h px? 
?
8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2&
count_make_move_en2default:defaultZ8-5546h px? 
?
8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2'
count_valid_move_en2default:defaultZ8-5546h px? 
{
8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2
NEXT_ACTION2default:defaultZ8-5546h px? 
?
TROM size for "%s" is below threshold of ROM address width. It will be mapped to LUTs4039*oasys2
WRITE_EN2default:defaultZ8-5587h px? 
?
8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2,
count_write_new_piece_en2default:defaultZ8-5546h px? 
y
8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2
	GEN_PIECE2default:defaultZ8-5546h px? 
?
8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2&
LOAD_NEW_ACTION_EN2default:defaultZ8-5546h px? 
{
8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2
LOAD_GEN_EN2default:defaultZ8-5546h px? 
?
8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2%
LOAD_NEXT_MOVE_EN2default:defaultZ8-5546h px? 
x
8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2
REQ_MOVE2default:defaultZ8-5546h px? 
?
[ROM "%s" won't be mapped to Block RAM because address size (%s) smaller than threshold (%s)3996*oasys2
NS2default:default2
12default:default2
52default:defaultZ8-5544h px? 
?
[ROM "%s" won't be mapped to Block RAM because address size (%s) smaller than threshold (%s)3996*oasys2
NS2default:default2
12default:default2
52default:defaultZ8-5544h px? 
?
[ROM "%s" won't be mapped to Block RAM because address size (%s) smaller than threshold (%s)3996*oasys2
NS2default:default2
22default:default2
52default:defaultZ8-5544h px? 
?
[ROM "%s" won't be mapped to Block RAM because address size (%s) smaller than threshold (%s)3996*oasys2
NS2default:default2
12default:default2
52default:defaultZ8-5544h px? 
?
}HDL ADVISOR - The operator resource <%s> is shared. To prevent sharing consider applying a KEEP on the output of the operator4233*oasys2
adder2default:default2g
QO:/ENGS31/Tetris/tetris_project/tetris_project.srcs/sources_1/new/check_lines.vhd2default:default2
862default:default8@Z8-5818h px? 
|
8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2 
row_count_tc2default:defaultZ8-5546h px? 
~
8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2"
check_lines_tc2default:defaultZ8-5546h px? 
?
8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2&
game_grid_count_tc2default:defaultZ8-5546h px? 
x
8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2
full_row2default:defaultZ8-5546h px? 
?
[ROM "%s" won't be mapped to Block RAM because address size (%s) smaller than threshold (%s)3996*oasys2
is_empty2default:default2
42default:default2
52default:defaultZ8-5544h px? 
|
8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2 
col_count_tc2default:defaultZ8-5546h px? 
?
[ROM "%s" won't be mapped to Block RAM because address size (%s) smaller than threshold (%s)3996*oasys2
score_count2default:default2
22default:default2
52default:defaultZ8-5544h px? 
?
3inferred FSM for state register '%s' in module '%s'802*oasys2%
current_state_reg2default:default2$
button_interface2default:defaultZ8-802h px? 
w
8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2
timeout2default:defaultZ8-5546h px? 
?
[ROM "%s" won't be mapped to Block RAM because address size (%s) smaller than threshold (%s)3996*oasys2
reset2default:default2
22default:default2
52default:defaultZ8-5544h px? 
?
[ROM "%s" won't be mapped to Block RAM because address size (%s) smaller than threshold (%s)3996*oasys2
	debounced2default:default2
22default:default2
52default:defaultZ8-5544h px? 
?
[ROM "%s" won't be mapped to Block RAM because address size (%s) smaller than threshold (%s)3996*oasys2

next_state2default:default2
12default:default2
52default:defaultZ8-5544h px? 
?
[ROM "%s" won't be mapped to Block RAM because address size (%s) smaller than threshold (%s)3996*oasys2

next_state2default:default2
12default:default2
52default:defaultZ8-5544h px? 
t
8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2
v_tc2default:defaultZ8-5546h px? 
t
8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2
h_tc2default:defaultZ8-5546h px? 
z
8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2

v_block_tc2default:defaultZ8-5546h px? 
z
8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2

h_block_tc2default:defaultZ8-5546h px? 
?
[ROM "%s" won't be mapped to Block RAM because address size (%s) smaller than threshold (%s)3996*oasys2"
pieces_used_tc2default:default2
32default:default2
52default:defaultZ8-5544h px? 
?
[ROM "%s" won't be mapped to Block RAM because address size (%s) smaller than threshold (%s)3996*oasys2
Color2default:default2
42default:default2
52default:defaultZ8-5544h px? 
?
[ROM "%s" won't be mapped to Block RAM because address size (%s) smaller than threshold (%s)3996*oasys2!
next_rotation2default:default2
22default:default2
52default:defaultZ8-5544h px? 
?
[ROM "%s" won't be mapped to Block RAM because address size (%s) smaller than threshold (%s)3996*oasys2
open_square2default:default2
42default:default2
52default:defaultZ8-5544h px? 
?
[ROM "%s" won't be mapped to Block RAM because address size (%s) smaller than threshold (%s)3996*oasys2*
count_cleared_lines_tc2default:default2
42default:default2
52default:defaultZ8-5544h px? 
v
8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2
col_tc2default:defaultZ8-5546h px? 
v
8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2
row_tc2default:defaultZ8-5546h px? 
?
[ROM "%s" won't be mapped to Block RAM because address size (%s) smaller than threshold (%s)3996*oasys2

color_port2default:default2
12default:default2
52default:defaultZ8-5544h px? 
?
[ROM "%s" won't be mapped to Block RAM because address size (%s) smaller than threshold (%s)3996*oasys2!
addr_count_tc2default:default2
32default:default2
52default:defaultZ8-5544h px? 
?
[ROM "%s" won't be mapped to Block RAM because address size (%s) smaller than threshold (%s)3996*oasys2
is_zero2default:default2
42default:default2
52default:defaultZ8-5544h px? 
?
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s
*synth2t
`                   State |                     New Encoding |                Previous Encoding 
2default:defaulth p
x
? 
?
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s
*synth2s
_               startwait |         000000000000000000000001 |                            10000
2default:defaulth p
x
? 
?
%s
*synth2s
_              drawtetris |         000000000000000000000010 |                            10001
2default:defaulth p
x
? 
?
%s
*synth2s
_              waittetris |         000000000000000000000100 |                            10010
2default:defaulth p
x
? 
?
%s
*synth2s
_       prepdrawgameboard |         000000000000000000001000 |                            10011
2default:defaulth p
x
? 
?
%s
*synth2s
_           drawgameboard |         000000000000000000010000 |                            10100
2default:defaulth p
x
? 
?
%s
*synth2s
_             gennewpiece |         000000000000000000100000 |                            00000
2default:defaulth p
x
? 
?
%s
*synth2s
_           checkgameover |         000000000000000001000000 |                            10101
2default:defaulth p
x
? 
?
%s
*synth2s
_            drawgameover |         000000000000000010000000 |                            10110
2default:defaulth p
x
? 
?
%s
*synth2s
_            waitgameover |         000000000000000100000000 |                            10111
2default:defaulth p
x
? 
?
%s
*synth2s
_            loadnewpiece |         000000000000001000000000 |                            00001
2default:defaulth p
x
? 
?
%s
*synth2s
_           writenewpiece |         000000000000010000000000 |                            00010
2default:defaulth p
x
? 
?
%s
*synth2s
_                mainwait |         000000000000100000000000 |                            00110
2default:defaulth p
x
? 
?
%s
*synth2s
_               storedown |         000000000001000000000000 |                            01010
2default:defaulth p
x
? 
?
%s
*synth2s
_                 storeup |         000000000010000000000000 |                            00111
2default:defaulth p
x
? 
?
%s
*synth2s
_               storeleft |         000000000100000000000000 |                            01000
2default:defaulth p
x
? 
?
%s
*synth2s
_              storeright |         000000001000000000000000 |                            01001
2default:defaulth p
x
? 
?
%s
*synth2s
_          checkvalidmove |         000000010000000000000000 |                            01011
2default:defaulth p
x
? 
?
%s
*synth2s
_           waitvalidmove |         000000100000000000000000 |                            01100
2default:defaulth p
x
? 
?
%s
*synth2s
_      interpretvalidmove |         000001000000000000000000 |                            01111
2default:defaulth p
x
? 
?
%s
*synth2s
_                makemove |         000010000000000000000000 |                            01101
2default:defaulth p
x
? 
?
%s
*synth2s
_             loadnewmove |         000100000000000000000000 |                            01110
2default:defaulth p
x
? 
?
%s
*synth2s
_              checklines |         001000000000000000000000 |                            00011
2default:defaulth p
x
? 
?
%s
*synth2s
_               waitlines |         010000000000000000000000 |                            00100
2default:defaulth p
x
? 
?
%s
*synth2s
_              clearlines |         100000000000000000000000 |                            00101
2default:defaulth p
x
? 
?
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
Gencoded FSM with state register '%s' using encoding '%s' in module '%s'3353*oasys2
CS_reg2default:default2
one-hot2default:default2*
tetris_game_controller2default:defaultZ8-3354h px? 
?
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s
*synth2t
`                   State |                     New Encoding |                Previous Encoding 
2default:defaulth p
x
? 
?
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s
*synth2s
_                     low |                               00 |                               00
2default:defaulth p
x
? 
?
%s
*synth2s
_             low_to_high |                               01 |                               01
2default:defaulth p
x
? 
?
%s
*synth2s
_                    high |                               10 |                               10
2default:defaulth p
x
? 
?
%s
*synth2s
_             high_to_low |                               11 |                               11
2default:defaulth p
x
? 
?
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
Gencoded FSM with state register '%s' using encoding '%s' in module '%s'3353*oasys2%
current_state_reg2default:default2

sequential2default:default2$
button_interface2default:defaultZ8-3354h px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished RTL Optimization Phase 2 : Time (s): cpu = 00:00:15 ; elapsed = 00:00:21 . Memory (MB): peak = 819.398 ; gain = 500.715
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
E
%s
*synth2-

Report RTL Partitions: 
2default:defaulth p
x
? 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
? 
W
%s
*synth2?
+| |RTL Partition |Replication |Instances |
2default:defaulth p
x
? 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
? 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
L
%s
*synth24
 Start RTL Component Statistics 
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
K
%s
*synth23
Detailed RTL Component Info : 
2default:defaulth p
x
? 
:
%s
*synth2"
+---Adders : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input     11 Bit       Adders := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input     10 Bit       Adders := 2     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      8 Bit       Adders := 6     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      6 Bit       Adders := 2     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      5 Bit       Adders := 30    
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      4 Bit       Adders := 34    
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      3 Bit       Adders := 8     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      2 Bit       Adders := 4     
2default:defaulth p
x
? 
=
%s
*synth2%
+---Registers : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	               11 Bit    Registers := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	               10 Bit    Registers := 10    
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                9 Bit    Registers := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                8 Bit    Registers := 8     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                6 Bit    Registers := 2     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                5 Bit    Registers := 8     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                4 Bit    Registers := 10    
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                3 Bit    Registers := 7     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                2 Bit    Registers := 10    
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                1 Bit    Registers := 22    
2default:defaulth p
x
? 
9
%s
*synth2!
+---Muxes : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	  24 Input     24 Bit        Muxes := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input     24 Bit        Muxes := 7     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input     15 Bit        Muxes := 2     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input     12 Bit        Muxes := 4     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   8 Input     12 Bit        Muxes := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input     11 Bit        Muxes := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input     10 Bit        Muxes := 8     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   4 Input     10 Bit        Muxes := 3     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      8 Bit        Muxes := 2     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      7 Bit        Muxes := 4     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   7 Input      7 Bit        Muxes := 4     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      6 Bit        Muxes := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      5 Bit        Muxes := 35    
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   4 Input      5 Bit        Muxes := 13    
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   5 Input      5 Bit        Muxes := 6     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      4 Bit        Muxes := 27    
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   4 Input      4 Bit        Muxes := 2     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	  20 Input      4 Bit        Muxes := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	  30 Input      4 Bit        Muxes := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      3 Bit        Muxes := 8     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      2 Bit        Muxes := 12    
2default:defaulth p
x
? 
Z
%s
*synth2B
.	  23 Input      2 Bit        Muxes := 2     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   4 Input      2 Bit        Muxes := 5     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   7 Input      2 Bit        Muxes := 3     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      1 Bit        Muxes := 53    
2default:defaulth p
x
? 
Z
%s
*synth2B
.	  23 Input      1 Bit        Muxes := 6     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	  24 Input      1 Bit        Muxes := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   4 Input      1 Bit        Muxes := 9     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   7 Input      1 Bit        Muxes := 2     
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
O
%s
*synth27
#Finished RTL Component Statistics 
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
Y
%s
*synth2A
-Start RTL Hierarchical Component Statistics 
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
O
%s
*synth27
#Hierarchical RTL Component report 
2default:defaulth p
x
? 
J
%s
*synth22
Module pixel_clock_generator 
2default:defaulth p
x
? 
K
%s
*synth23
Detailed RTL Component Info : 
2default:defaulth p
x
? 
=
%s
*synth2%
+---Registers : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                1 Bit    Registers := 2     
2default:defaulth p
x
? 
K
%s
*synth23
Module tetris_game_controller 
2default:defaulth p
x
? 
K
%s
*synth23
Detailed RTL Component Info : 
2default:defaulth p
x
? 
:
%s
*synth2"
+---Adders : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      3 Bit       Adders := 4     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      2 Bit       Adders := 1     
2default:defaulth p
x
? 
=
%s
*synth2%
+---Registers : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                3 Bit    Registers := 4     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                2 Bit    Registers := 1     
2default:defaulth p
x
? 
9
%s
*synth2!
+---Muxes : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	  24 Input     24 Bit        Muxes := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input     24 Bit        Muxes := 7     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      3 Bit        Muxes := 4     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      2 Bit        Muxes := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	  23 Input      2 Bit        Muxes := 2     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      1 Bit        Muxes := 14    
2default:defaulth p
x
? 
Z
%s
*synth2B
.	  23 Input      1 Bit        Muxes := 6     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	  24 Input      1 Bit        Muxes := 1     
2default:defaulth p
x
? 
@
%s
*synth2(
Module check_lines 
2default:defaulth p
x
? 
K
%s
*synth23
Detailed RTL Component Info : 
2default:defaulth p
x
? 
:
%s
*synth2"
+---Adders : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      8 Bit       Adders := 2     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      5 Bit       Adders := 2     
2default:defaulth p
x
? 
=
%s
*synth2%
+---Registers : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	               10 Bit    Registers := 2     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                9 Bit    Registers := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                8 Bit    Registers := 4     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                5 Bit    Registers := 2     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                1 Bit    Registers := 8     
2default:defaulth p
x
? 
9
%s
*synth2!
+---Muxes : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input     10 Bit        Muxes := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      8 Bit        Muxes := 2     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      4 Bit        Muxes := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      1 Bit        Muxes := 9     
2default:defaulth p
x
? 
<
%s
*synth2$
Module mux7seg 
2default:defaulth p
x
? 
K
%s
*synth23
Detailed RTL Component Info : 
2default:defaulth p
x
? 
:
%s
*synth2"
+---Adders : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input     11 Bit       Adders := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      2 Bit       Adders := 1     
2default:defaulth p
x
? 
=
%s
*synth2%
+---Registers : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	               11 Bit    Registers := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                2 Bit    Registers := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                1 Bit    Registers := 1     
2default:defaulth p
x
? 
9
%s
*synth2!
+---Muxes : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   4 Input      4 Bit        Muxes := 2     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   4 Input      1 Bit        Muxes := 1     
2default:defaulth p
x
? 
<
%s
*synth2$
Module bin2bcd 
2default:defaulth p
x
? 
K
%s
*synth23
Detailed RTL Component Info : 
2default:defaulth p
x
? 
:
%s
*synth2"
+---Adders : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      4 Bit       Adders := 33    
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      3 Bit       Adders := 1     
2default:defaulth p
x
? 
9
%s
*synth2!
+---Muxes : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input     15 Bit        Muxes := 2     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      4 Bit        Muxes := 24    
2default:defaulth p
x
? 
E
%s
*synth2-
Module button_interface 
2default:defaulth p
x
? 
K
%s
*synth23
Detailed RTL Component Info : 
2default:defaulth p
x
? 
:
%s
*synth2"
+---Adders : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      8 Bit       Adders := 1     
2default:defaulth p
x
? 
=
%s
*synth2%
+---Registers : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                8 Bit    Registers := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                2 Bit    Registers := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                1 Bit    Registers := 1     
2default:defaulth p
x
? 
9
%s
*synth2!
+---Muxes : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   4 Input      2 Bit        Muxes := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      2 Bit        Muxes := 2     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      1 Bit        Muxes := 3     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   4 Input      1 Bit        Muxes := 2     
2default:defaulth p
x
? 
C
%s
*synth2+
Module vga_controller 
2default:defaulth p
x
? 
K
%s
*synth23
Detailed RTL Component Info : 
2default:defaulth p
x
? 
:
%s
*synth2"
+---Adders : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input     10 Bit       Adders := 2     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      5 Bit       Adders := 4     
2default:defaulth p
x
? 
=
%s
*synth2%
+---Registers : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	               10 Bit    Registers := 2     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                5 Bit    Registers := 4     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                1 Bit    Registers := 5     
2default:defaulth p
x
? 
9
%s
*synth2!
+---Muxes : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input     10 Bit        Muxes := 2     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      5 Bit        Muxes := 2     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      1 Bit        Muxes := 5     
2default:defaulth p
x
? 
D
%s
*synth2,
Module Piece_Generator 
2default:defaulth p
x
? 
K
%s
*synth23
Detailed RTL Component Info : 
2default:defaulth p
x
? 
:
%s
*synth2"
+---Adders : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      3 Bit       Adders := 1     
2default:defaulth p
x
? 
=
%s
*synth2%
+---Registers : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                4 Bit    Registers := 8     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                3 Bit    Registers := 1     
2default:defaulth p
x
? 
9
%s
*synth2!
+---Muxes : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      7 Bit        Muxes := 4     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   7 Input      7 Bit        Muxes := 4     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      3 Bit        Muxes := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      1 Bit        Muxes := 2     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   7 Input      1 Bit        Muxes := 2     
2default:defaulth p
x
? 
B
%s
*synth2*
Module Color_Decoder 
2default:defaulth p
x
? 
K
%s
*synth23
Detailed RTL Component Info : 
2default:defaulth p
x
? 
9
%s
*synth2!
+---Muxes : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input     12 Bit        Muxes := 4     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   8 Input     12 Bit        Muxes := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input     11 Bit        Muxes := 1     
2default:defaulth p
x
? 
F
%s
*synth2.
Module address_generator 
2default:defaulth p
x
? 
K
%s
*synth23
Detailed RTL Component Info : 
2default:defaulth p
x
? 
:
%s
*synth2"
+---Adders : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      5 Bit       Adders := 22    
2default:defaulth p
x
? 
9
%s
*synth2!
+---Muxes : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   4 Input      5 Bit        Muxes := 13    
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      5 Bit        Muxes := 32    
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   5 Input      5 Bit        Muxes := 6     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      3 Bit        Muxes := 2     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   7 Input      2 Bit        Muxes := 3     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      2 Bit        Muxes := 2     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   4 Input      2 Bit        Muxes := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      1 Bit        Muxes := 1     
2default:defaulth p
x
? 
H
%s
*synth20
Module collision_detection 
2default:defaulth p
x
? 
K
%s
*synth23
Detailed RTL Component Info : 
2default:defaulth p
x
? 
:
%s
*synth2"
+---Adders : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      2 Bit       Adders := 1     
2default:defaulth p
x
? 
=
%s
*synth2%
+---Registers : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	               10 Bit    Registers := 2     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                2 Bit    Registers := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                1 Bit    Registers := 1     
2default:defaulth p
x
? 
9
%s
*synth2!
+---Muxes : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   4 Input     10 Bit        Muxes := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      1 Bit        Muxes := 1     
2default:defaulth p
x
? 
A
%s
*synth2)
Module down_counter 
2default:defaulth p
x
? 
K
%s
*synth23
Detailed RTL Component Info : 
2default:defaulth p
x
? 
:
%s
*synth2"
+---Adders : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      6 Bit       Adders := 2     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      4 Bit       Adders := 1     
2default:defaulth p
x
? 
=
%s
*synth2%
+---Registers : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                6 Bit    Registers := 2     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                4 Bit    Registers := 1     
2default:defaulth p
x
? 
9
%s
*synth2!
+---Muxes : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      6 Bit        Muxes := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      4 Bit        Muxes := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      1 Bit        Muxes := 2     
2default:defaulth p
x
? 
>
%s
*synth2&
Module make_move 
2default:defaulth p
x
? 
K
%s
*synth23
Detailed RTL Component Info : 
2default:defaulth p
x
? 
:
%s
*synth2"
+---Adders : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      3 Bit       Adders := 1     
2default:defaulth p
x
? 
=
%s
*synth2%
+---Registers : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                3 Bit    Registers := 1     
2default:defaulth p
x
? 
9
%s
*synth2!
+---Muxes : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      4 Bit        Muxes := 1     
2default:defaulth p
x
? 
A
%s
*synth2)
Module piece_memory 
2default:defaulth p
x
? 
K
%s
*synth23
Detailed RTL Component Info : 
2default:defaulth p
x
? 
=
%s
*synth2%
+---Registers : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	               10 Bit    Registers := 4     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                4 Bit    Registers := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                2 Bit    Registers := 2     
2default:defaulth p
x
? 
9
%s
*synth2!
+---Muxes : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input     10 Bit        Muxes := 4     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      2 Bit        Muxes := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      1 Bit        Muxes := 2     
2default:defaulth p
x
? 
D
%s
*synth2,
Module write_new_piece 
2default:defaulth p
x
? 
K
%s
*synth23
Detailed RTL Component Info : 
2default:defaulth p
x
? 
:
%s
*synth2"
+---Adders : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      2 Bit       Adders := 1     
2default:defaulth p
x
? 
=
%s
*synth2%
+---Registers : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                2 Bit    Registers := 1     
2default:defaulth p
x
? 
9
%s
*synth2!
+---Muxes : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   4 Input     10 Bit        Muxes := 1     
2default:defaulth p
x
? 
A
%s
*synth2)
Module Draw_Counter 
2default:defaulth p
x
? 
K
%s
*synth23
Detailed RTL Component Info : 
2default:defaulth p
x
? 
:
%s
*synth2"
+---Adders : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      5 Bit       Adders := 2     
2default:defaulth p
x
? 
=
%s
*synth2%
+---Registers : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                5 Bit    Registers := 2     
2default:defaulth p
x
? 
9
%s
*synth2!
+---Muxes : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      5 Bit        Muxes := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      1 Bit        Muxes := 2     
2default:defaulth p
x
? 
F
%s
*synth2.
Module Get_Drawing_Color 
2default:defaulth p
x
? 
K
%s
*synth23
Detailed RTL Component Info : 
2default:defaulth p
x
? 
9
%s
*synth2!
+---Muxes : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	  20 Input      4 Bit        Muxes := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	  30 Input      4 Bit        Muxes := 1     
2default:defaulth p
x
? 
F
%s
*synth2.
Module checking_gameover 
2default:defaulth p
x
? 
K
%s
*synth23
Detailed RTL Component Info : 
2default:defaulth p
x
? 
:
%s
*synth2"
+---Adders : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      3 Bit       Adders := 1     
2default:defaulth p
x
? 
=
%s
*synth2%
+---Registers : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                3 Bit    Registers := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                1 Bit    Registers := 1     
2default:defaulth p
x
? 
9
%s
*synth2!
+---Muxes : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   4 Input     10 Bit        Muxes := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input     10 Bit        Muxes := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      3 Bit        Muxes := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      1 Bit        Muxes := 3     
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
[
%s
*synth2C
/Finished RTL Hierarchical Component Statistics
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
H
%s
*synth20
Start Part Resource Summary
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s
*synth2j
VPart Resources:
DSPs: 90 (col length:60)
BRAMs: 100 (col length: RAMB18 60 RAMB36 30)
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
K
%s
*synth23
Finished Part Resource Summary
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
W
%s
*synth2?
+Start Cross Boundary and Area Optimization
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
]
%s
*synth2E
1Warning: Parallel synthesis criteria is not met 
2default:defaulth p
x
? 
?
[ROM "%s" won't be mapped to Block RAM because address size (%s) smaller than threshold (%s)3996*oasys2%
CHECK_GAMEOVER_TC2default:default2
32default:default2
52default:defaultZ8-5544h px? 
?
[ROM "%s" won't be mapped to Block RAM because address size (%s) smaller than threshold (%s)3996*oasys2&
write_new_piece_tc2default:default2
22default:default2
52default:defaultZ8-5544h px? 
?
[ROM "%s" won't be mapped to Block RAM because address size (%s) smaller than threshold (%s)3996*oasys2!
valid_move_tc2default:default2
32default:default2
52default:defaultZ8-5544h px? 
?
[ROM "%s" won't be mapped to Block RAM because address size (%s) smaller than threshold (%s)3996*oasys2 
make_move_tc2default:default2
32default:default2
52default:defaultZ8-5544h px? 
?
[ROM "%s" won't be mapped to Block RAM because address size (%s) smaller than threshold (%s)3996*oasys2!
wait_lines_tc2default:default2
32default:default2
52default:defaultZ8-5544h px? 
?
[ROM "%s" won't be mapped to Block RAM because address size (%s) smaller than threshold (%s)3996*oasys2
NS2default:default2
22default:default2
52default:defaultZ8-5544h px? 
x
8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2
full_row2default:defaultZ8-5546h px? 
?
8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2&
game_grid_count_tc2default:defaultZ8-5546h px? 
~
8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2"
check_lines_tc2default:defaultZ8-5546h px? 
t
8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2
h_tc2default:defaultZ8-5546h px? 
t
8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2
v_tc2default:defaultZ8-5546h px? 
?
[ROM "%s" won't be mapped to Block RAM because address size (%s) smaller than threshold (%s)3996*oasys2"
pieces_used_tc2default:default2
32default:default2
52default:defaultZ8-5544h px? 
?
[ROM "%s" won't be mapped to Block RAM because address size (%s) smaller than threshold (%s)3996*oasys2
Color2default:default2
42default:default2
52default:defaultZ8-5544h px? 
?
[ROM "%s" won't be mapped to Block RAM because address size (%s) smaller than threshold (%s)3996*oasys2
p_0_out2default:default2
22default:default2
52default:defaultZ8-5544h px? 
?
[ROM "%s" won't be mapped to Block RAM because address size (%s) smaller than threshold (%s)3996*oasys2
p_0_out2default:default2
22default:default2
52default:defaultZ8-5544h px? 
?
[ROM "%s" won't be mapped to Block RAM because address size (%s) smaller than threshold (%s)3996*oasys2!
addr_count_tc2default:default2
32default:default2
52default:defaultZ8-5544h px? 
?
8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys21
input_conditioning_up/timeout2default:defaultZ8-5546h px? 
?
8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys23
input_conditioning_down/timeout2default:defaultZ8-5546h px? 
?
8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys23
input_conditioning_left/timeout2default:defaultZ8-5546h px? 
?
8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys24
 input_conditioning_right/timeout2default:defaultZ8-5546h px? 
?
!design %s has unconnected port %s3331*oasys2#
write_new_piece2default:default2&
write_new_piece_en2default:defaultZ8-3331h px? 

!design %s has unconnected port %s3331*oasys2
bin2bcd2default:default2
	input[15]2default:defaultZ8-3331h px? 

!design %s has unconnected port %s3331*oasys2
bin2bcd2default:default2
	input[14]2default:defaultZ8-3331h px? 
?
!design %s has unconnected port %s3331*oasys2*
tetris_game_controller2default:default2"
check_lines_tc2default:defaultZ8-3331h px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Cross Boundary and Area Optimization : Time (s): cpu = 00:00:50 ; elapsed = 00:00:58 . Memory (MB): peak = 862.176 ; gain = 543.492
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
E
%s
*synth2-

Report RTL Partitions: 
2default:defaulth p
x
? 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
? 
W
%s
*synth2?
+| |RTL Partition |Replication |Instances |
2default:defaulth p
x
? 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
? 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
R
%s
*synth2:
&Start Applying XDC Timing Constraints
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Applying XDC Timing Constraints : Time (s): cpu = 00:00:59 ; elapsed = 00:01:07 . Memory (MB): peak = 862.176 ; gain = 543.492
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
F
%s
*synth2.
Start Timing Optimization
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
|Finished Timing Optimization : Time (s): cpu = 00:00:59 ; elapsed = 00:01:07 . Memory (MB): peak = 862.176 ; gain = 543.492
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
E
%s
*synth2-

Report RTL Partitions: 
2default:defaulth p
x
? 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
? 
W
%s
*synth2?
+| |RTL Partition |Replication |Instances |
2default:defaulth p
x
? 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
? 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
E
%s
*synth2-
Start Technology Mapping
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
{Finished Technology Mapping : Time (s): cpu = 00:01:00 ; elapsed = 00:01:08 . Memory (MB): peak = 864.379 ; gain = 545.695
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
E
%s
*synth2-

Report RTL Partitions: 
2default:defaulth p
x
? 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
? 
W
%s
*synth2?
+| |RTL Partition |Replication |Instances |
2default:defaulth p
x
? 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
? 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s
*synth2'
Start IO Insertion
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
Q
%s
*synth29
%Start Flattening Before IO Insertion
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
T
%s
*synth2<
(Finished Flattening Before IO Insertion
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
H
%s
*synth20
Start Final Netlist Cleanup
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
K
%s
*synth23
Finished Final Netlist Cleanup
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
uFinished IO Insertion : Time (s): cpu = 00:01:01 ; elapsed = 00:01:09 . Memory (MB): peak = 864.379 ; gain = 545.695
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
D
%s
*synth2,

Report Check Netlist: 
2default:defaulth p
x
? 
u
%s
*synth2]
I+------+------------------+-------+---------+-------+------------------+
2default:defaulth p
x
? 
u
%s
*synth2]
I|      |Item              |Errors |Warnings |Status |Description       |
2default:defaulth p
x
? 
u
%s
*synth2]
I+------+------------------+-------+---------+-------+------------------+
2default:defaulth p
x
? 
u
%s
*synth2]
I|1     |multi_driven_nets |      0|        0|Passed |Multi driven nets |
2default:defaulth p
x
? 
u
%s
*synth2]
I+------+------------------+-------+---------+-------+------------------+
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
O
%s
*synth27
#Start Renaming Generated Instances
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Renaming Generated Instances : Time (s): cpu = 00:01:01 ; elapsed = 00:01:09 . Memory (MB): peak = 864.379 ; gain = 545.695
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
E
%s
*synth2-

Report RTL Partitions: 
2default:defaulth p
x
? 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
? 
W
%s
*synth2?
+| |RTL Partition |Replication |Instances |
2default:defaulth p
x
? 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
? 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
L
%s
*synth24
 Start Rebuilding User Hierarchy
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Rebuilding User Hierarchy : Time (s): cpu = 00:01:01 ; elapsed = 00:01:09 . Memory (MB): peak = 864.379 ; gain = 545.695
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
K
%s
*synth23
Start Renaming Generated Ports
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Renaming Generated Ports : Time (s): cpu = 00:01:01 ; elapsed = 00:01:09 . Memory (MB): peak = 864.379 ; gain = 545.695
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
M
%s
*synth25
!Start Handling Custom Attributes
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Handling Custom Attributes : Time (s): cpu = 00:01:01 ; elapsed = 00:01:09 . Memory (MB): peak = 864.379 ; gain = 545.695
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
J
%s
*synth22
Start Renaming Generated Nets
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Renaming Generated Nets : Time (s): cpu = 00:01:01 ; elapsed = 00:01:09 . Memory (MB): peak = 864.379 ; gain = 545.695
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
K
%s
*synth23
Start Writing Synthesis Report
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
A
%s
*synth2)

Report BlackBoxes: 
2default:defaulth p
x
? 
O
%s
*synth27
#+------+--------------+----------+
2default:defaulth p
x
? 
O
%s
*synth27
#|      |BlackBox name |Instances |
2default:defaulth p
x
? 
O
%s
*synth27
#+------+--------------+----------+
2default:defaulth p
x
? 
O
%s
*synth27
#|1     |blk_mem_gen_0 |         1|
2default:defaulth p
x
? 
O
%s
*synth27
#|2     |blk_mem_gen_1 |         1|
2default:defaulth p
x
? 
O
%s
*synth27
#+------+--------------+----------+
2default:defaulth p
x
? 
A
%s*synth2)

Report Cell Usage: 
2default:defaulth px? 
K
%s*synth23
+------+--------------+------+
2default:defaulth px? 
K
%s*synth23
|      |Cell          |Count |
2default:defaulth px? 
K
%s*synth23
+------+--------------+------+
2default:defaulth px? 
K
%s*synth23
|1     |blk_mem_gen_0 |     1|
2default:defaulth px? 
K
%s*synth23
|2     |blk_mem_gen_1 |     1|
2default:defaulth px? 
K
%s*synth23
|3     |BUFG          |     2|
2default:defaulth px? 
K
%s*synth23
|4     |CARRY4        |    10|
2default:defaulth px? 
K
%s*synth23
|5     |LUT1          |    40|
2default:defaulth px? 
K
%s*synth23
|6     |LUT2          |   104|
2default:defaulth px? 
K
%s*synth23
|7     |LUT3          |    81|
2default:defaulth px? 
K
%s*synth23
|8     |LUT4          |   134|
2default:defaulth px? 
K
%s*synth23
|9     |LUT5          |   174|
2default:defaulth px? 
K
%s*synth23
|10    |LUT6          |   419|
2default:defaulth px? 
K
%s*synth23
|11    |MUXF7         |     6|
2default:defaulth px? 
K
%s*synth23
|12    |FDRE          |   366|
2default:defaulth px? 
K
%s*synth23
|13    |FDSE          |    12|
2default:defaulth px? 
K
%s*synth23
|14    |IBUF          |     5|
2default:defaulth px? 
K
%s*synth23
|15    |OBUF          |    26|
2default:defaulth px? 
K
%s*synth23
+------+--------------+------+
2default:defaulth px? 
E
%s
*synth2-

Report Instance Areas: 
2default:defaulth p
x
? 
p
%s
*synth2X
D+------+---------------------------+-----------------------+------+
2default:defaulth p
x
? 
p
%s
*synth2X
D|      |Instance                   |Module                 |Cells |
2default:defaulth p
x
? 
p
%s
*synth2X
D+------+---------------------------+-----------------------+------+
2default:defaulth p
x
? 
p
%s
*synth2X
D|1     |top                        |                       |  1387|
2default:defaulth p
x
? 
p
%s
*synth2X
D|2     |  check_lines_block        |check_lines            |   227|
2default:defaulth p
x
? 
p
%s
*synth2X
D|3     |  checking_gameover_block  |checking_gameover      |     8|
2default:defaulth p
x
? 
p
%s
*synth2X
D|4     |  clocking                 |pixel_clock_generator  |     5|
2default:defaulth p
x
? 
p
%s
*synth2X
D|5     |  collision_detector       |collision_detection    |    31|
2default:defaulth p
x
? 
p
%s
*synth2X
D|6     |  down_counter_block       |down_counter           |    43|
2default:defaulth p
x
? 
p
%s
*synth2X
D|7     |  draw_counter_block       |Draw_Counter           |    86|
2default:defaulth p
x
? 
p
%s
*synth2X
D|8     |  game_controller          |tetris_game_controller |   153|
2default:defaulth p
x
? 
p
%s
*synth2X
D|9     |  input_conditioning_down  |button_interface       |    27|
2default:defaulth p
x
? 
p
%s
*synth2X
D|10    |  input_conditioning_left  |button_interface_0     |    31|
2default:defaulth p
x
? 
p
%s
*synth2X
D|11    |  input_conditioning_right |button_interface_1     |    30|
2default:defaulth p
x
? 
p
%s
*synth2X
D|12    |  input_conditioning_up    |button_interface_2     |    31|
2default:defaulth p
x
? 
p
%s
*synth2X
D|13    |  make_move_block          |make_move              |     5|
2default:defaulth p
x
? 
p
%s
*synth2X
D|14    |  piece_generation         |Piece_Generator        |    90|
2default:defaulth p
x
? 
p
%s
*synth2X
D|15    |  piece_memory_block       |piece_memory           |   328|
2default:defaulth p
x
? 
p
%s
*synth2X
D|16    |  seven_seg                |mux7seg                |    35|
2default:defaulth p
x
? 
p
%s
*synth2X
D|17    |  vga_controller_block     |vga_controller         |   206|
2default:defaulth p
x
? 
p
%s
*synth2X
D|18    |  write_new_piece_block    |write_new_piece        |     4|
2default:defaulth p
x
? 
p
%s
*synth2X
D+------+---------------------------+-----------------------+------+
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Writing Synthesis Report : Time (s): cpu = 00:01:01 ; elapsed = 00:01:09 . Memory (MB): peak = 864.379 ; gain = 545.695
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
r
%s
*synth2Z
FSynthesis finished with 0 errors, 0 critical warnings and 4 warnings.
2default:defaulth p
x
? 
?
%s
*synth2?
~Synthesis Optimization Runtime : Time (s): cpu = 00:00:50 ; elapsed = 00:01:01 . Memory (MB): peak = 864.379 ; gain = 214.742
2default:defaulth p
x
? 
?
%s
*synth2?
Synthesis Optimization Complete : Time (s): cpu = 00:01:01 ; elapsed = 00:01:09 . Memory (MB): peak = 864.379 ; gain = 545.695
2default:defaulth p
x
? 
B
 Translating synthesized netlist
350*projectZ1-571h px? 
f
-Analyzing %s Unisim elements for replacement
17*netlist2
162default:defaultZ29-17h px? 
j
2Unisim Transformation completed in %s CPU seconds
28*netlist2
02default:defaultZ29-28h px? 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px? 
u
)Pushed %s inverter(s) to %s load pin(s).
98*opt2
02default:default2
02default:defaultZ31-138h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2 
00:00:00.0012default:default2
864.3792default:default2
0.0002default:defaultZ17-268h px? 
~
!Unisim Transformation Summary:
%s111*project29
%No Unisim elements were transformed.
2default:defaultZ1-111h px? 
U
Releasing license: %s
83*common2
	Synthesis2default:defaultZ17-83h px? 
?
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
1632default:default2
112default:default2
02default:default2
02default:defaultZ4-41h px? 
^
%s completed successfully
29*	vivadotcl2 
synth_design2default:defaultZ4-42h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2"
synth_design: 2default:default2
00:01:032default:default2
00:01:122default:default2
864.3792default:default2
557.1642default:defaultZ17-268h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2
00:00:002default:default2
864.3792default:default2
0.0002default:defaultZ17-268h px? 
K
"No constraints selected for write.1103*constraintsZ18-5210h px? 
?
 The %s '%s' has been generated.
621*common2

checkpoint2default:default2`
LO:/ENGS31/Tetris/tetris_project/tetris_project.runs/synth_1/tetris_shell.dcp2default:defaultZ17-1381h px? 
?
%s4*runtcl2?
nExecuting : report_utilization -file tetris_shell_utilization_synth.rpt -pb tetris_shell_utilization_synth.pb
2default:defaulth px? 
?
Exiting %s at %s...
206*common2
Vivado2default:default2,
Fri Jun  3 17:16:09 20222default:defaultZ17-206h px? 


End Record