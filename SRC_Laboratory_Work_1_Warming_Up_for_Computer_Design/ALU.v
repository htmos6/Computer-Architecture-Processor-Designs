module ALU #(parameter W=4)
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
  
  
	function [0:0] out_alu_is_zero (input [W-1:0] alu_result);
		out_alu_is_zero = (alu_result == 0);
	endfunction


	function [0:0] out_alu_is_negative (input [W-1:0] alu_result);
		out_alu_is_negative = (alu_result[W-1] == 1);
	endfunction
	  
	 
  	function [0:0] out_alu_overflow_check (input [W-1:0] inp_src0, input [W-1:0] inp_src1, input [W-1:0] alu_result, input [3:0] operation_select);
		// overflow flag
		if (operation_select == 4'b0100 || operation_select == 4'b0101) // Overflow can only happen when adding two numbers of the same sign and getting a different sign.
			out_alu_overflow_check = ((inp_src0[W-1] == inp_src1[W-1]) && (inp_src0[W-1] != alu_result[W-1])) ;
		else if (operation_select == 4'b0010 || operation_select == 4'b0011 || operation_select == 4'b0110 || operation_select == 4'b0111) // (A − B) or (B - A) or (A − B + carry - 1) or (B - A + carry - 1)   
			out_alu_overflow_check = ((inp_src0[W-1] != inp_src1[W-1]) && (inp_src1[W-1] == alu_result[W-1]));
		else 
			out_alu_overflow_check = 1'b0;
	endfunction
	
	
	
	always @(*)
	begin
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
			4'd2: // SUBSTRACTION A-B
				begin 
					{carry_out_flag, out_alu} = inp_src0 - inp_src1;
					overflow_flag = out_alu_overflow_check(inp_src0, inp_src1, out_alu, operation_select);
					zero_flag = out_alu_is_zero(out_alu); 
					negative_flag = out_alu_is_negative(out_alu);
				end
			4'd3:  // SUBSTRACTION B-A
				begin 
					{carry_out_flag, out_alu} = inp_src1 - inp_src0;
					overflow_flag = out_alu_overflow_check(inp_src1, inp_src0, out_alu, operation_select);
					zero_flag = out_alu_is_zero(out_alu); 
					negative_flag = out_alu_is_negative(out_alu);
				end
			4'd4: // ADDITION A+B
				begin 
					{carry_out_flag, out_alu}  = inp_src0 + inp_src1;
					overflow_flag = out_alu_overflow_check(inp_src0, inp_src1, out_alu, operation_select);
					zero_flag = out_alu_is_zero(out_alu); 
					negative_flag = out_alu_is_negative(out_alu);
				end
			4'd5: // ADDITION A+B+CARRY
				begin 
					{carry_out_flag, out_alu}  = inp_src0 + inp_src1 + inp_carry;
					overflow_flag = out_alu_overflow_check(inp_src0, inp_src1, out_alu, operation_select);
					zero_flag = out_alu_is_zero(out_alu); 
					negative_flag = out_alu_is_negative(out_alu);
				end
			4'd6: // SUBSTRACTION A-B+CARRY-1
				begin 
					{carry_out_flag, out_alu}  = inp_src0 - inp_src1 + inp_carry - 1;
					overflow_flag = out_alu_overflow_check(inp_src0, inp_src1, out_alu, operation_select);
					zero_flag = out_alu_is_zero(out_alu); 
					negative_flag = out_alu_is_negative(out_alu);
				end
			4'd7: // SUBSTRACTION B-A+CARRY-1
				begin 
					{carry_out_flag, out_alu}  = inp_src1 - inp_src0 + inp_carry - 1;
					overflow_flag = out_alu_overflow_check(inp_src1, inp_src0, out_alu, operation_select);
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
