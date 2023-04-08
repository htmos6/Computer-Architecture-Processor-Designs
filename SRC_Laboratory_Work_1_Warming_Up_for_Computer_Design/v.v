module v(input [4:0] a, input clk, output reg [4:0] c, output reg [4:0] d, output reg [4:0] f);
	integer i = 0;
	
	initial 
		begin
			d = 0;
		end
	
	always @(posedge clk)
		begin
			for (i = 0 ; i < 4; i = i+1) 
				begin
					d = d+1;
				end
		end
endmodule
