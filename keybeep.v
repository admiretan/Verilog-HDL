/*************************************
功能：1个带消抖功能的按键控制LED灯
作者：谭刚林
版本：V01
时间：2020.9.24
**************************************/
module keybeep(
	input		sys_clk,
	input		sys_rst,
	input		key,
	
	output	beep
	);
	
	wire key_flag;
	wire key_value;
	
	key_debounce1 user_key_debounce(
		.sys_clk		(sys_clk),
		.sys_rst 	(sys_rst),
		.key			(key),
		.key_flag	(key_flag),
		.key_value	(key_value)
	);
	
	beep_control1 user_beep_control(
		.sys_clk		(sys_clk),
		.sys_rst 	(sys_rst),
		.key_flag	(key_flag),
		.key_value	(key_value),
		.beep			(beep)
		);
endmodule







































































/*
module keybeep(
	input		sys_clk,
	input		sys_rst,
	input		key,
	output	beep
	);
	
	wire	key_value;
	wire	key_flag;
	
	key_debounce u_key_debounce(
		.sys_clk		(sys_clk),
		.sys_rst		(sys_rst),
		.key			(key),
		.key_flag	(key_flag),
		.key_value	(key_value)
	);

	beep_control u_beep_control(
		.sys_clk		(sys_clk),
		.sys_rst		(sys_rst),
		.key_flag	(key_flag),
		.key_value	(key_value),
		.beep			(beep)
	);
	
endmodule
*/