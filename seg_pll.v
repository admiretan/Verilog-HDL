 module seg(
    input       sys_rst,
    input       sys_clk,
    output      reg [5:0] sel
    );
    
    wire clk_1khz;
    reg [2:0]counter;
    
    pll_1khz  user_pll_1khz(
	.areset(~sys_rst),
	.inclk0(sys_clk),
	.c0(clk_1khz));
    
    always @(posedge clk_1khz or negedge sys_rst)    begin
        if(~sys_rst)    
            counter <= 3'd0;
        else if(counter<3'd5)  
            counter <= counter + 1'b1;
        else
            counter <= 3'd0;
        
    end
    
    always @(posedge sys_clk or negedge sys_rst)    begin
        if(~sys_rst)
            sel <= 6'b111111;
        else begin
            case(counter)   
                3'd0:   sel <= 6'b111110;
                3'd1:   sel <= 6'b111101;
                3'd2:   sel <= 6'b111011;
                3'd3:   sel <= 6'b110111;
                3'd4:   sel <= 6'b101111;
                3'd5:   sel <= 6'b011111;   
              endcase              
        end
    end
    
 endmodule 
    
