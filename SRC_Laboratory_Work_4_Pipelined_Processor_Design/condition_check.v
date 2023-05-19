module condition_check #(parameter W=32) 
    (   
		  input [1:0] FlagWriteE,
      input carry_out_flag,
      input overflow_flag,
      input negative_flag,
      input zero_flag,
      input [3:0] FlagsE, // Flags comes from pipeline
      
      input [3:0] CondE, // Instruction's [31:28] bits

      output wire CondEx,
      output [3:0] FlagsD
    );

    wire [1:0] NZ_flags_reg_out;
    wire [1:0] CV_flags_reg_out;

    reg carry_out_flag_out;
    reg overflow_flag_out;
    reg negative_flag_out;
    reg zero_flag_out;

    assign CondEx = ((CondE == 4'b1110) || (CondE == 4'b0000 && NZ_flags_reg_out[0] == 1'b1) || (CondE == 4'b0001 &&  NZ_flags_reg_out[0] == 1'b0));
    assign FlagsD = {negative_flag_out, zero_flag_out, carry_out_flag_out, overflow_flag_out};
    

    always @(*)
      begin
        if (FlagWriteE[1] == 1) // NZ flags
          begin
            negative_flag_out = negative_flag;
            zero_flag_out = zero_flag;
          end
        else if (FlagWriteE[1] == 0) // CV flags
          begin 
            negative_flag_out = FlagsE[3];
            zero_flag_out = FlagsE[2];
          end
        if (FlagWriteE[0] == 1)
          begin
            carry_out_flag_out = carry_out_flag;
            overflow_flag_out = overflow_flag;
          end
        else if (FlagWriteE[0] == 0)
          begin 
            carry_out_flag_out = FlagsE[1];
            overflow_flag_out = FlagsE[0];
          end
      end
endmodule
