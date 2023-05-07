module multiplexer2to1 #(parameter W = 32)
  (
	input [W-1:0] inp_mux0, 
	input [W-1:0] inp_mux1, 
	input [0:0] select, 
	output reg [W-1:0] out_mux
  );
	
	always @(*) 
	begin
		case (select)
			1'b0: out_mux = inp_mux0;
			1'b1: out_mux = inp_mux1;
		endcase
	end
	
endmodule
