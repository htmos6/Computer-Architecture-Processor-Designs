module controller #(parameter W=32) 
    (   
        input clk,
        input [3:0] Cond, // Instruction[31:28] EQ, NE, AL, HI .... figure 3
        input [1:0] Op, // Instruction[27:26] Data processing 00, Memory 01 or Branch 10
        input [5:0] Func, // Instruction[25:20] Operation Code Add, Sub .... 
        input [3:0] Rd, // Instruction[15:12] Destination Register
        input [15:0] inst_19_to_4_BX,
        input carry_out_flag,
        input overflow_flag,
        input negative_flag,
        input zero_flag,
        input reset,

        output reg PCWrite, 
        output reg RegWrite,
        output reg MemWrite,
        output reg IRWrite,
        output reg AdrSrc, // 1 bit
        output reg AluSrcA, // 1 bit
        output reg [1:0] AluSrcB, // 2 bit
        output reg [1:0] ImmSrc,
        output reg [1:0] ResultSrc,
        output reg [1:0] RegSrc, 
        output reg [3:0] AluControl, 


        // output reg AluSrc_Branch_Absolute_Mux_Sel,
        // output reg Write_Data_PC_Mux_Sel,
        output reg [0:0] C_flag_reg_out
    );
    
    reg [3:0] state_number;

    reg [0:0] write_enable_NZ;
    reg [0:0] write_enable_CV;

    wire [1:0] NZ_flags_reg_out;
    wire [1:0] CV_flags_reg_out;

    wire [0:0] CondEx;
    assign CondEx = ((Cond == 4'b1110) || (Cond == 4'b0000 && NZ_flags_reg_out[0] == 1'b1) || (Cond == 4'b0001 &&  NZ_flags_reg_out[0] == 1'b0));
    // assign CondEx = 1;

    register_synchronous_reset_write_en #(.W(2)) NZ_Flags_Reg (.clk(clk), .write_enable(write_enable_NZ), .reset_synchronous(0), .inp_reg( {negative_flag, zero_flag} ), .out_reg(NZ_flags_reg_out));
    register_synchronous_reset_write_en #(.W(2)) CV_Flags_Reg (.clk(clk), .write_enable(write_enable_CV), .reset_synchronous(0), .inp_reg( {carry_out_flag, overflow_flag} ), .out_reg(CV_flags_reg_out));

    initial 
        begin
            state_number = 11;
            //CondEx = 1;
        end
    

    always @(posedge clk)
        begin
            case (state_number)
                4'd0: // FETCH CYCLE --> PC IS ALREADY AT PC REGISTER
                    begin   
                        state_number <= 1;
                    end
                4'd1:  // DECODE CYCLE --> PC IS ALREADY AT PC REGISTER
                    begin
                        if (Op == 2'b00) // Data Processing instruction
                            begin
                                if (Func[5] == 1) // Data processing with immediate
                                    begin
                                        state_number <= 7;
                                    end
                                else if ( (Func[5] == 0) && (Func[4:1] != 4'b1001) && ({Func[0], inst_19_to_4_BX} != 17'h0FFF1)) // Data processing with register
                                    begin
                                        state_number <= 6;
                                    end
                                else if ( (Func[5] == 0) && (Func[4:1] == 4'b1001) && ({Func[0], inst_19_to_4_BX} == 17'h0FFF1)) // BX instruction
                                    begin
                                        state_number <= 10;
                                    end
                            end
                        else if (Op == 2'b01) // LDR or STR instruction
                            begin
                                if (Func[5] == 0 && Func[0] == 1) // Func_t0 == 1 --> LDR with imm
                                    begin
                                        state_number <= 6;
                                    end
                                else if (Func[5] == 0 && Func[0] == 0) // Func_t0 == 0 --> STR with imm
                                    begin
                                        state_number <= 6;
                                    end
                            end
                        else if (Op == 2'b10) // Branch instruction
                            begin
                                state_number <= 9;
                            end
                    end
                4'd2:
                    begin
                        if (Func[0] == 1) // LDR
                            begin
                                state_number <= 3;
                            end
                        else if (Func[0] == 0) // STR
                            begin
                                state_number <= 5;
                            end
                    end
                4'd3: // MemRead
                    begin
                        state_number <= 4;
                    end
                4'd4: // MemWB
                    begin
                        state_number <= 0;
                    end
                4'd5: // MemWrite
                    begin
                        state_number <= 0;
                    end
                4'd6: // Data processing with Register ExecuteR
                    begin   
                        state_number <= 8;
                    end
                4'd7: // Data processing with Immediate ExecuteL
                    begin
                        state_number <= 8;
                    end
                4'd8: // ALUWB
                    begin
                        state_number <= 0;
                    end
                4'd9: // Branch
                    begin
                        state_number <= 0;
                        // BRANCH SIGNAL
                    end
                4'd10: // BX
                    begin
                        state_number <= 0;
                    end
                4'd11: // BX
                    begin
                        state_number <= 0;
                    end
                default:
					state_number <= 0;
            endcase

        end


    always @(*) 
        begin
            C_flag_reg_out = CV_flags_reg_out[1];
            case (state_number)
                4'd0: // FETCH CYCLE --> PC IS ALREADY AT PC REGISTER
                    begin   
                        PCWrite <= (1'b1 && CondEx);
                        RegWrite <= (1'b0 && CondEx);
                        MemWrite <= (1'b0 && CondEx);
                        IRWrite <= 1;
                        AdrSrc  <= 0; // 1 bit
                        AluSrcA  <= 1; // 1 bit
                        AluSrcB <= 2'b10; // 2 bit
                        ImmSrc <= 2'bxx;
                        ResultSrc <= 2'b10;
                        RegSrc <= 2'b00;
                        AluControl <= 4'b0100; // Add
                        write_enable_NZ <= 0; // Do not Modify NZ flags
                        write_enable_CV <= 0; // Do not  Modify CV flags
                    end
                4'd1:  // DECODE CYCLE --> PC IS ALREADY AT PC REGISTER
                    begin
                        PCWrite <= (1'b0 && CondEx);
                        RegWrite <= (1'b0 && CondEx);
                        MemWrite <= (1'b0 && CondEx);
                        IRWrite <= 0;
                        AdrSrc  <= 1'bx; // 1 bit
                        AluSrcA  <= 1; // 1 bit
                        AluSrcB <= 2'b10; // 2 bit
                        ResultSrc <= 2'b10;
                        AluControl <= 4'b0100; // Add
                        write_enable_NZ <= 0; // Do not Modify NZ flags
                        write_enable_CV <= 0; // Do not  Modify CV flags

                        if (Op == 2'b00) // Data Processing instruction
                            begin
                                if (Func[5] == 1) // Data processing with immediate
                                    begin
                                        RegSrc <= 2'bx0;
                                        ImmSrc <= 2'b00; // imm8
                                    end
                                else if ( (Func[5] == 0) && (Func[4:1] != 4'b1001) && ({Func[0], inst_19_to_4_BX} != 17'h0FFF1)) // Data processing with register
                                    begin
                                        RegSrc <= 2'b00;
                                        ImmSrc <= 2'b00; // imm8
                                    end
                                else if ( (Func[5] == 0) && (Func[4:1] == 4'b1001) && ({Func[0], inst_19_to_4_BX} == 17'h0FFF1)) // BX instruction
                                    begin
                                        RegSrc <= 2'b0x;
                                        ImmSrc <= 2'bxx; // imm8
                                    end
                            end
                        else if (Op == 2'b01) // LDR or STR instruction
                            begin
                                if (Func[5] == 0 && Func[0] == 1) // Func_t0 == 1 --> LDR with imm
                                    begin
                                        RegSrc <= 2'bx0;
                                        ImmSrc <= 2'b01; // imm12
                                    end
                                else if (Func[5] == 0 && Func[0] == 0) // Func_t0 == 0 --> STR with imm
                                    begin
                                        RegSrc <= 2'b10;
                                        ImmSrc <= 2'b01; // imm12
                                    end
                            end
                        else if (Op == 2'b10) // Branch instruction
                            begin
                                RegSrc <= 2'bx1;
                                ImmSrc <= 2'b10; // imm24
                            end
                    end
                4'd2:
                    begin
                        AluSrcA  <= 0; // 1 bit
                        AluSrcB <= 2'b01; // 2 bit
                        AluControl <= 4'b0100; // Add
                        write_enable_NZ <= 0; // Do not Modify NZ flags
                        write_enable_CV <= 0; // Do not  Modify CV flags
                    end
                4'd3: // MemRead
                    begin
                        ResultSrc <= 2'b00;
                        AdrSrc  <= 1'b1; // 1 bit
                    end
                4'd4: // MemWB
                    begin
                        ResultSrc <= 2'b01;
                        RegWrite <= (1'b1 && CondEx);
                    end
                4'd5: // MemWrite
                    begin
                        ResultSrc <= 2'b00;
                        AdrSrc  <= 1'b1; // 1 bit
                        MemWrite <= 1'b1;
                    end
                4'd6: // Data processing with Register ExecuteR
                    begin   
                        AluSrcA  <= 0; // 1 bit
                        AluSrcB <= 2'b00; // 2 bit
                        AluControl <= Func[4:1]; 

                        if ((Func[4:1] == 4'b0100) || (Func[4:1] == 4'b0010)) // If operation is ADD or SUB operation
                            begin
                                write_enable_NZ <= ((Func[0] ? 1 : 0) && CondEx); // Modify NZ flags
                                write_enable_CV <= ((Func[0] ? 1 : 0) && CondEx); // Modify CV flags
                            end
                        else if((Func[4:1] == 4'b0000) || (Func[4:1] == 4'b1100) || (Func[4:1] == 4'b1101)) // If operation is AND, ORR, MOV
                            begin
                                write_enable_NZ <= ((Func[0] ? 1 : 0) && CondEx); // logical operations modifies NZ flags only
                                write_enable_CV <= 0; // Data operations cannot modifies CV flags 
                            end
                        else if ((Func[4:1] == 4'b1010)) // If operation is a COMPARE
                            begin
                                write_enable_NZ <= ((Func[0] ? 1 : 0) && CondEx); // Modify NZ flags
                                write_enable_CV <= ((Func[0] ? 1 : 0) && CondEx); // Modify CV flags
                            end
                    end
                4'd7: // Data processing with Immediate ExecuteL
                    begin
                        AluSrcA  <= 0; // 1 bit
                        AluSrcB <= 2'b01; // 2 bit
                        AluControl <= Func[4:1]; 

                        if ((Func[4:1] == 4'b0100) || (Func[4:1] == 4'b0010)) // If operation is ADD or SUB operation
                            begin
                                write_enable_NZ <= ((Func[0] ? 1 : 0) && CondEx); // Modify NZ flags
                                write_enable_CV <= ((Func[0] ? 1 : 0) && CondEx); // Modify CV flags
                            end
                        else if((Func[4:1] == 4'b0000) || (Func[4:1] == 4'b1100) || (Func[4:1] == 4'b1101)) // If operation is AND, ORR, MOV
                            begin
                                write_enable_NZ <= ((Func[0] ? 1 : 0) && CondEx); // logical operations modifies NZ flags only
                                write_enable_CV <= 0; // Data operations cannot modifies CV flags 
                            end
                        else if ((Func[4:1] == 4'b1010)) // If operation is a COMPARE
                            begin
                                write_enable_NZ <= ((Func[0] ? 1 : 0) && CondEx); // Modify NZ flags
                                write_enable_CV <= ((Func[0] ? 1 : 0) && CondEx); // Modify CV flags
                            end
                    end
                4'd8: // ALUWB
                    begin
                        ResultSrc <= 2'b00;
                        RegWrite <= (1'b1 && CondEx);
                    end
                4'd9: // Branch
                    begin
                        AluSrcA  <= 0; // 1 bit
                        AluSrcB <= 2'b01; // 2 bit
                        AluControl <= 4'b1101; // MOVE B
                        write_enable_NZ <= 0; // Do not Modify NZ flags
                        write_enable_CV <= 0; // Do not  Modify CV flags
                        ResultSrc <= 2'b10;
                        PCWrite <= (1'b1 && CondEx);
                        // BRANCH SIGNAL
                    end
                4'd10: // BX
                    begin
                        AluSrcB <= 2'b00; // 2 bit
                        AluControl <= 4'b1101; // MOVE B
                        ResultSrc <= 2'b10;
                        PCWrite <= (1'b1 && CondEx);
                    end
                default:
					AluSrcB <= 2'b00; // 2 bit
            endcase
            
        end    
endmodule
