module combinational_shifter #(parameter W = 8)(input signed [W-1:0] inp_shifter, input [4:0] shamt, input [1:0] control, output reg [W-1:0] out_shifter);
	
	reg [W-1:0] temp_shift;
	reg [W-1:0] temp_R_shift;
	reg [W-1:0] temp_L_shift;
	
	always @(*)
		begin
			case (control) 
				2'b00: out_shifter = (inp_shifter << shamt); // Logic shift left
				2'b01: out_shifter = (inp_shifter >> shamt); // Logic shift right
				2'b10: out_shifter = (inp_shifter >>> shamt);// Arithmetic shift right signed
				2'b11: 
					begin 
						temp_shift = 0;
						temp_R_shift = inp_shifter >> shamt;
						temp_L_shift = inp_shifter << (W-shamt);
						temp_shift = temp_R_shift + temp_L_shift;
						out_shifter = (inp_shifter >> shamt) + (inp_shifter << (W-shamt));
					end
			endcase
		end
endmodule
               