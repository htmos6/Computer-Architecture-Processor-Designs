module multiplexer16to1 #(parameter W = 24)
	(
	 input [W-1:0] inp_mux0, 
	 input [W-1:0] inp_mux1, 
	 input [W-1:0] inp_mux2, 
	 input [W-1:0] inp_mux3, 
	 input [W-1:0] inp_mux4, 
	 input [W-1:0] inp_mux5, 
	 input [W-1:0] inp_mux6, 
	 input [W-1:0] inp_mux7, 
	 input [W-1:0] inp_mux8, 
	 input [W-1:0] inp_mux9, 
	 input [W-1:0] inp_mux10, 
	 input [W-1:0] inp_mux11, 
	 input [W-1:0] inp_mux12, 
	 input [W-1:0] inp_mux13,
	 input [W-1:0] inp_mux14,
	 input [W-1:0] inp_mux15,  			
	 input [3:0] select, 
	 output reg [W-1:0] out_mux
	);
														 
	always @(*)
	begin
		case (select)
			4'd0: out_mux = inp_mux0;
			4'd1: out_mux = inp_mux1;
			4'd2: out_mux = inp_mux2;
			4'd3: out_mux = inp_mux3;
			4'd4: out_mux = inp_mux4;
			4'd5: out_mux = inp_mux5;
			4'd6: out_mux = inp_mux6;
			4'd7: out_mux = inp_mux7;
			4'd8: out_mux = inp_mux8;
			4'd9: out_mux = inp_mux9;
			4'd10: out_mux = inp_mux10;
			4'd11: out_mux = inp_mux11;
			4'd12: out_mux = inp_mux12;
			4'd13: out_mux = inp_mux13;
			4'd14: out_mux = inp_mux14; 
			4'd15: out_mux = inp_mux15;
		endcase
	end
	
endmodule
