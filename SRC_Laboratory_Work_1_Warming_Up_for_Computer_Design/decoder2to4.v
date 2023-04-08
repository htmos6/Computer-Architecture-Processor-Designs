module decoder2to4(input [1:0] inp_dec, output reg [3:0] out_dec);
	
	always @(*) 
	begin
		case(inp_dec)
			2'b00: out_dec = 4'b0001;
			2'b01: out_dec = 4'b0010;
			2'b10: out_dec = 4'b0100;
			2'b11: out_dec = 4'b1000;
		endcase
	end

endmodule
