module ALU #(parameter W=32)
	(
	input [W-1:0] inp_src0, 
	input [W-1:0] inp_src1, 
	input [3:0] operation_select, 
	input [0:0] inp_carry,
	output reg [W-1:0] out_alu,
	output reg [0:0] carry_out_flag,
	output reg [0:0] overflow_flag,
	output reg [0:0] negative_flag,
	output reg [0:0] zero_flag
	);
	
	reg [W-1:0] inp_src0_1complement;
	reg [W-1:0] inp_src1_1complement;
	
	reg [W-1:0] inp_src0_2complement;
	reg [W-1:0] inp_src1_2complement;
  
  
	function [0:0] out_alu_is_zero (input [W-1:0] alu_result);
		out_alu_is_zero = (alu_result == 0);
	endfunction


	function [0:0] out_alu_is_negative (input [W-1:0] alu_result);
		out_alu_is_negative = (alu_result[W-1] == 1);
	endfunction
	  
	 
	always @(*)
	begin
		inp_src0_1complement = ~inp_src0;
		inp_src1_1complement = ~inp_src1;
		
		inp_src0_2complement = ~inp_src0 + 1;
		inp_src1_2complement = ~inp_src1 + 1;
		
		case (operation_select)
			4'd0: // AND
				begin 
					out_alu = inp_src0 & inp_src1;
					carry_out_flag = 0;
					overflow_flag = 0;
					zero_flag = out_alu_is_zero(out_alu); 
					negative_flag = out_alu_is_negative(out_alu);
				end
			4'd1: // XOR
				begin 
					out_alu = inp_src0 ^ inp_src1;
					carry_out_flag = 0;
					overflow_flag = 0;
					zero_flag = out_alu_is_zero(out_alu); 
					negative_flag = out_alu_is_negative(out_alu);
				end
			4'd2: // SUBSTRACTION A-B ? 
				begin 
					
					{carry_out_flag, out_alu} = inp_src0 + inp_src1_2complement;
					overflow_flag = ((inp_src1[W-1] != inp_src0[W-1]) && (inp_src0[W-1] != out_alu[W-1]));
					zero_flag = out_alu_is_zero(out_alu); 
					negative_flag = out_alu_is_negative(out_alu);
				end
			4'd3:  // SUBSTRACTION B-A ? 
				begin 
					{carry_out_flag, out_alu} = inp_src0_2complement + inp_src1;
					overflow_flag = ((inp_src1[W-1] != inp_src0[W-1]) && (inp_src1[W-1] != out_alu[W-1]));
					zero_flag = out_alu_is_zero(out_alu); 
					negative_flag = out_alu_is_negative(out_alu);
				end
			4'd4: // ADDITION A+B
				begin 
					{carry_out_flag, out_alu}  = inp_src0 + inp_src1;
					overflow_flag = ((inp_src1[W-1] == inp_src0[W-1]) && (inp_src0[W-1] != out_alu[W-1]));
					zero_flag = out_alu_is_zero(out_alu); 
					negative_flag = out_alu_is_negative(out_alu);
				end
			4'd5: // ADDITION A+B+CARRY
				begin 
					{carry_out_flag, out_alu}  = inp_src0 + inp_src1 + inp_carry;
					overflow_flag = ((inp_src1[W-1] == inp_src0[W-1]) && (inp_src0[W-1] != out_alu[W-1]));
					zero_flag = out_alu_is_zero(out_alu); 
					negative_flag = out_alu_is_negative(out_alu);
				end
			4'd6: // SUBSTRACTION A-B+CARRY-1 ?
				begin 
					{carry_out_flag, out_alu}  = inp_src0 + inp_src1_2complement + inp_carry - 1;
					overflow_flag = ((inp_src1[W-1] != inp_src0[W-1]) && (inp_src0[W-1] != out_alu[W-1]));
					zero_flag = out_alu_is_zero(out_alu); 
					negative_flag = out_alu_is_negative(out_alu);
				end
			4'd7: // SUBSTRACTION B-A+CARRY-1 ?
				begin 
					{carry_out_flag, out_alu}  = inp_src0_2complement + inp_src1 + inp_carry - 1;
					overflow_flag = ((inp_src1[W-1] != inp_src0[W-1]) && (inp_src1[W-1] != out_alu[W-1]));
					zero_flag = out_alu_is_zero(out_alu); 
					negative_flag = out_alu_is_negative(out_alu);
				end
			4'd12: // ORR
				begin 
					out_alu = inp_src0 | inp_src1;
					carry_out_flag = 0;
					overflow_flag = 0;
					zero_flag = out_alu_is_zero(out_alu); 
					negative_flag = out_alu_is_negative(out_alu);
				end
			4'd13: // MOVE
				begin 
					out_alu = inp_src1;
					carry_out_flag = 0;
					overflow_flag = 0;
					zero_flag = out_alu_is_zero(out_alu); 
					negative_flag = out_alu_is_negative(out_alu);
				end
			4'd14: // BIT CLEAR
				begin 
					out_alu = inp_src0 & (~inp_src1);
					carry_out_flag = 0;
					overflow_flag = 0;
					zero_flag = out_alu_is_zero(out_alu); 
					negative_flag = out_alu_is_negative(out_alu);
				end
			4'd15: // MOVE NOT
				begin 
					out_alu = ~inp_src1; 
					carry_out_flag = 0;
					overflow_flag = 0;
					zero_flag = out_alu_is_zero(out_alu); 
					negative_flag = out_alu_is_negative(out_alu);
				end
		endcase
	end

endmodule
