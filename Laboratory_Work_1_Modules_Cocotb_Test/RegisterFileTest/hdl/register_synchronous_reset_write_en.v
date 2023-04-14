module register_synchronous_reset_write_en #(parameter W = 16) 
	(
	input clk, 
	input write_enable,
	input reset_synchronous, // Reset == 1 --> Clear Register Content @ Next Rising Edge
	input [W-1:0] inp_reg, 
	output reg [W-1:0] out_reg
	);
	
	always @(posedge clk) // Sequential Circuit
		begin
			if (reset_synchronous == 1)
				out_reg <= 0; // Reset at the next clock cycle
			else if (reset_synchronous == 0 && write_enable == 1)
				out_reg <= inp_reg; // Load output at the next clock cycle with parallel input
		end
	
endmodule

