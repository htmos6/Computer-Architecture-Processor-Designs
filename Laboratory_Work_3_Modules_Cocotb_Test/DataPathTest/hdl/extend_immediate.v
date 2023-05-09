module extend_immediate #(parameter W = 32)
	(
	input [W-1:0] instruction,
	input [1:0] ImmSrc,
	output reg [W-1:0] out_ext_imm
	);
	
	always @(*)
		begin
			case (ImmSrc)
				2'b00: out_ext_imm = {24'b0 , instruction[7:0]};
				2'b01: out_ext_imm = {20'b0 , instruction[11:0]};
				2'b10: out_ext_imm = {{8{instruction[23]}}, instruction[23:0]};
				default: out_ext_imm = 0;
			endcase
		end
endmodule
