module beep_control(
	input		sys_clk,
	input		sys_rst,
	input		key_flag,
	input		key_value,
	
	output	reg beep
	);

	always @(posedge sys_clk or negedge sys_rst) begin
		if(!sys_rst)
			beep <= 1'b0;
		else if(key_flag && (~key_value))
			beep <= ~beep;
	end
	
endmodule
 