module constant_value_generator #(parameter W = 32, value=5) 
	( 
	input reset_synchronous, // Reset == 1 --> Clear Register Content @ Next Rising Edge
	output reg [W-1:0] out_reg
	);
	
	always @(*) // Sequential Circuit
		begin
			if (reset_synchronous == 1)
				out_reg <= 0; // Reset at the next clock cycle
			else if (reset_synchronous == 0)
				out_reg <= value; // Load output at the next clock cycle with parallel input
		end
endmodule
