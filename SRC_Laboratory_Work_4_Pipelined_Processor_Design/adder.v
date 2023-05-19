module adder #(parameter W = 32)
	(
	input [W-1:0] inp_adder_data_0,
	input [W-1:0] inp_adder_data_1,
	output reg [W-1:0] out_adder
	);

	always @(*)
		begin
			out_adder = inp_adder_data_0 + inp_adder_data_1;		
		end
endmodule
 
