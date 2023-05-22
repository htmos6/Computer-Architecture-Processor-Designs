module multiplexer4to1 #(parameter W = 32)
  (	
	input [W-1:0] inp_mux0, 
	input [W-1:0] inp_mux1, 
	input [W-1:0] inp_mux2, 
	input [W-1:0] inp_mux3, 
	input [1:0] select, 
	output reg [W-1:0] out_mux
  );

	always @(*)
	begin
		case (select)
			2'b00: out_mux = inp_mux0;
			2'b01: out_mux = inp_mux1;
			2'b10: out_mux = inp_mux2;
			2'b11: out_mux = inp_mux3;
			default: out_mux = 0;
		endcase
	end

endmodule
