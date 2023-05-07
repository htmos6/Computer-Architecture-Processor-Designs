module ALU #(parameter WIDTH=32)
    (
	  input [3:0] operation_select,
	  input inp_carry,
	  input [WIDTH-1:0] inp_src0,
	  input [WIDTH-1:0] inp_src1,
      output reg [WIDTH-1:0] out_alu,
	  output reg carry_out_flag,
	  output reg overflow_flag,
	  output negative_flag, zero_flag
    );

parameter AND=4'b0000,
		  EXOR=4'b0001,
		  SubtractionAB=4'b0010,
		  SubtractionBA=4'b0011,
		  Addition=4'b0100,
		  Addition_Carry=4'b0101,
		  SubtractionAB_Carry=4'b0110,
		  SubtractionBA_Carry=4'b0111,
		  Compare=4'b1010, // Extracted from ARM user manual
		  ORR=4'b1100,
		  Move=4'b1101,
		  Bit_Clear=4'b1110,
		  Move_Not=4'b1111;

// Assign the zero and negative flasg here since it is very simple
assign negative_flag = out_alu[WIDTH-1];
assign zero_flag = ~(|out_alu);
	 
always@(*) begin
	case(operation_select)
		AND:begin
			out_alu = inp_src0 & inp_src1;
			carry_out_flag = 1'b0;
			overflow_flag = 1'b0;
		end
		EXOR:begin
			out_alu = inp_src0 ^ inp_src1;
			carry_out_flag = 1'b0;
			overflow_flag = 1'b0;
		end
		SubtractionAB:begin
			out_alu = inp_src0 - inp_src1;
			carry_out_flag = ~negative_flag; // ARM uses inverted borrow for subtraction with carry
			overflow_flag = (inp_src0[WIDTH-1] & ~inp_src1[WIDTH-1] & ~out_alu[WIDTH-1]) | (~inp_src0[WIDTH-1] & inp_src1[WIDTH-1] & out_alu[WIDTH-1]);
		end
		SubtractionBA:begin
			out_alu = inp_src1 - inp_src0;
			carry_out_flag = ~negative_flag; // ARM uses inverted borrow for subtraction with carry
			overflow_flag = (inp_src1[WIDTH-1] & ~inp_src0[WIDTH-1] & ~out_alu[WIDTH-1]) | (~inp_src1[WIDTH-1] & inp_src0[WIDTH-1] & out_alu[WIDTH-1]);
		end
		Addition:begin
			{carry_out_flag,out_alu} = inp_src0 + inp_src1;
			overflow_flag = (inp_src0[WIDTH-1] & inp_src1[WIDTH-1] & ~out_alu[WIDTH-1]) | (~inp_src0[WIDTH-1] & ~inp_src1[WIDTH-1] & out_alu[WIDTH-1]);
		end
		Addition_Carry:begin
			{carry_out_flag,out_alu} = inp_src0 + inp_src1 + inp_carry;
			overflow_flag = (inp_src0[WIDTH-1] & inp_src1[WIDTH-1] & ~out_alu[WIDTH-1]) | (~inp_src0[WIDTH-1] & ~inp_src1[WIDTH-1] & out_alu[WIDTH-1]);
		end
		SubtractionAB_Carry:begin
			out_alu = inp_src0 - inp_src1 + inp_carry - 1;
			carry_out_flag = ~negative_flag; // ARM uses inverted borrow for subtraction with carry
			overflow_flag = (inp_src0[WIDTH-1] & ~inp_src1[WIDTH-1] & ~out_alu[WIDTH-1]) | (~inp_src0[WIDTH-1] & inp_src1[WIDTH-1] & out_alu[WIDTH-1]);
		end
		SubtractionBA_Carry:begin
			out_alu = inp_src1 - inp_src0 + inp_carry - 1;
			carry_out_flag = ~negative_flag; // ARM uses inverted borrow for subtraction with carry
			overflow_flag = (inp_src1[WIDTH-1] & ~inp_src0[WIDTH-1] & ~out_alu[WIDTH-1]) | (~inp_src1[WIDTH-1] & inp_src0[WIDTH-1] & out_alu[WIDTH-1]);
		end
		Compare:begin
			out_alu = inp_src0 - inp_src1;
			carry_out_flag = ~negative_flag; // ARM uses inverted borrow for subtraction with carry
			overflow_flag = (inp_src0[WIDTH-1] & ~inp_src1[WIDTH-1] & ~out_alu[WIDTH-1]) | (~inp_src0[WIDTH-1] & inp_src1[WIDTH-1] & out_alu[WIDTH-1]);
		end
		ORR:begin
			out_alu = inp_src0 | inp_src1;
			carry_out_flag = 1'b0;
			overflow_flag = 1'b0;
		end
		Move:begin
			out_alu = inp_src1;
			carry_out_flag = 1'b0;
			overflow_flag = 1'b0;
		end
		Bit_Clear:begin
			out_alu = inp_src0 ^ ~inp_src1;
			carry_out_flag = 1'b0;
			overflow_flag = 1'b0;
		end
		Move_Not:begin
			out_alu = ~inp_src1;
			carry_out_flag = 1'b0;
			overflow_flag = 1'b0;
		end
		default:begin
		out_alu = {WIDTH{1'b0}};
		carry_out_flag = 1'b0;
		overflow_flag = 1'b0;
		end
	endcase
end
	 
endmodule
