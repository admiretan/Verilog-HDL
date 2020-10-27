module key_debounce(
	input		sys_clk,
	input		sys_rst,
	input		key,
	
	output reg	key_flag,
	output reg	key_value
	);

	reg[31:0]	delay_cnt;
	reg			key_reg;
	
	always @(posedge sys_clk or negedge sys_rst)	begin
		if(!sys_rst)	begin
			key_reg <= 1'b1;
			delay_cnt <= 32'd0;
		end
		else	begin
			key_reg <= key;
			if(key_reg != key)
				delay_cnt	<=	32'd1000000;
			else if(key_reg == key)	begin
				if(delay_cnt > 32'd0)
					delay_cnt <= delay_cnt-1'b1;
				else
					delay_cnt <= delay_cnt;
			end
		end	
	end
	
	always @(posedge sys_clk or negedge sys_rst)	begin
		if(!sys_rst)	begin
			key_flag	<=	1'b0;
			key_value <= 1'b1;
		end
		else begin
			if(delay_cnt == 32'd1) begin
				key_flag <= 1'b1;
				key_value <= key;
			end
			else begin
				key_flag <= 1'b0;
				key_value <= key_value;
			end
		end
	end
	
endmodule
