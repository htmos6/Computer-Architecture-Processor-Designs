module program_counter #(parameter W = 32)
	(
	input clk, 
	input reset_synchronous, // Reset == 1 --> Clear Register Content @ Next Rising Edge
	input [W-1:0] inp_reg, 
	output reg [W-1:0] out_reg
	);

	initial 
		begin
			out_reg <= 0; // Reset at the next clock cycle
		end

	always @(posedge clk) 
		begin
			if (reset_synchronous == 1) // Clear output @ next edge
				out_reg <= 0; // Reset at the next clock cycle
			else if (reset_synchronous == 0)
				out_reg <= inp_reg; // Load output at the next clock cycle with parallel input
		end
endmodule
	