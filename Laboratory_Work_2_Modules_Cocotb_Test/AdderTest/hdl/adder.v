module adder #(parameter W = 32)
	(
	input [W-1:0] inp_adder_data,
	output reg [W-1:0] out_adder
	);

	always @(*)
		begin
			out_adder = inp_adder_data + 32'd4;		
		end
endmodule
 
