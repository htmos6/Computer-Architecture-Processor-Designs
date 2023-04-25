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
        output reg PCSrc,
        output reg RegWrite,
        output reg MemWrite,
        output reg MemToReg,
        output reg AluSrc_Branch_Absolute_Mux_Sel,
        output reg Write_Data_PC_Mux_Sel,
        output reg AluSrc,
        output reg [1:0] ImmSrc,
        output reg [1:0] RegSrc,
        output reg [3:0] AluControl,
        output reg [0:0] C_flag_reg_out
    );

    reg [0:0] write_enable_NZ;
    reg [0:0] write_enable_CV;

    reg [0:0] reset_sync_NZ;
    reg [0:0] reset_sync_CV;

    wire [1:0] NZ_flags_reg_out;
    wire [1:0] CV_flags_reg_out;

    wire [0:0] CondEx;
    assign CondEx = (Cond == 4'b1110) || (Cond == 4'b0000 && NZ_flags_reg_out[0] == 1'b1) || (Cond == 4'b0001 &&  NZ_flags_reg_out[0] == 1'b0);


    register_synchronous_reset_write_en #(.W(2)) NZ_Flags_Reg (.clk(clk), .write_enable(write_enable_NZ), .reset_synchronous(0), .inp_reg( {negative_flag, zero_flag} ), .out_reg(NZ_flags_reg_out));
    register_synchronous_reset_write_en #(.W(2)) CV_Flags_Reg (.clk(clk), .write_enable(write_enable_CV), .reset_synchronous(0), .inp_reg( {carry_out_flag, overflow_flag} ), .out_reg(CV_flags_reg_out));


    always @(*) 
        begin
            C_flag_reg_out = CV_flags_reg_out[1];
            case({Op, Func[5]}) // Func[5] --> Immediate Field
                3'b000: // Data Processing Instruction with Register Shift 
                    begin
                        if( (Func[4:1] == 4'b0100) || (Func[4:1] == 4'b0010) ) // If operation is ADD or SUB operation
                            begin
                                PCSrc = (1'b0  && CondEx);
                                RegWrite = (1'b1 && CondEx); // We will write result to reg
                                MemWrite = (1'b0 && CondEx); // We will not write to memory
                                MemToReg = 1'b0; // Select input comes from ALU, not from memory. 
                                AluSrc = 1'b0; // Choose Rm from 2x1 MUX (inputs: Rm or ExtImm)
                                ImmSrc = 2'b00; // Actually it is a don't care
                                RegSrc = 2'b00; // Choose Rm for read data input 2
                                AluSrc_Branch_Absolute_Mux_Sel = 1'b1;
                                Write_Data_PC_Mux_Sel = 1'b0;
                                write_enable_NZ = ((Func[0] ? 1 : 0) && CondEx); // Modify NZ flags
                                write_enable_CV = ((Func[0] ? 1 : 0) && CondEx); // Modify CV flags
                                AluControl = Func[4:1]; 
                            end
                        else if( (Func[4:1] == 4'b0000) || (Func[4:1] == 4'b1100) || (Func[4:1] == 4'b1101) ) // If operation is AND, ORR, MOV
                            begin
                                PCSrc = (1'b0 && CondEx);
                                RegWrite = (1'b1 && CondEx); // We will write result to reg
                                MemWrite = (1'b0 && CondEx); // We will not write to memory
                                MemToReg = 1'b0; // Select input comes from ALU, not from memory. 
                                AluSrc = 1'b0; // Choose Rm from 2x1 MUX (inputs: Rm or ExtImm)
                                ImmSrc = 2'b00; // Actually it is a don't care
                                RegSrc = 2'b00; // Choose Rm for read data input 2
                                AluSrc_Branch_Absolute_Mux_Sel = 1'b1;
                                Write_Data_PC_Mux_Sel = 1'b0;
                                write_enable_NZ = ((Func[0] ? 1 : 0) && CondEx); // logical operations modifies NZ flags only
                                write_enable_CV = 0;               // Data operations cannot modifies CV flags 
                                AluControl = Func[4:1]; 
                            end
                        else if ( (Func[4:1] == 4'b1010) ) // If operation is a COMPARE
                            begin
                                PCSrc = (1'b0 && CondEx);
                                RegWrite = (1'b0 && CondEx); // We will not write result to reg
                                MemWrite = (1'b0 && CondEx); // We will not write to memory
                                MemToReg = 1'bx; // Select input comes from ALU, not from memory. 
                                AluSrc = 1'b0; // Choose Rd from 2x1 MUX (inputs: Rm or ExtImm)
                                ImmSrc = 2'bxx; // Actually it is a don't care
                                RegSrc = 2'b10; // Choose Rm for read data input 2
                                AluSrc_Branch_Absolute_Mux_Sel = 1'b1;
                                Write_Data_PC_Mux_Sel = 1'bx;
                                write_enable_NZ = ((Func[0] ? 1 : 0) && CondEx); // Modify NZ flags
                                write_enable_CV = ((Func[0] ? 1 : 0) && CondEx); // Modify CV flags
                                AluControl = Func[4:1]; 
                            end
                        else if ( (Func[4:1] == 4'b1001) && ({Func[0], inst_19_to_4_BX} == 17'h0FFF1) ) // BX instruction
                            begin
                                PCSrc = (1'b1 && CondEx);
                                RegWrite = (1'b0 && CondEx); // We will not write result to reg
                                MemWrite = (1'b0 && CondEx); // We will not write to memory
                                MemToReg = 1'b0; // Select input comes from ALU, not from memory. 
                                AluSrc = 1'b0; // Choose Rd from 2x1 MUX (inputs: Rm or ExtImm)
                                ImmSrc = 2'bxx; // Actually it is a don't care
                                RegSrc = 2'b0x; // Choose Rm for read data input 2
                                AluSrc_Branch_Absolute_Mux_Sel = 1'b0;
                                Write_Data_PC_Mux_Sel = 1'bx;
                                write_enable_NZ = 0; // Modify NZ flags
                                write_enable_CV = 0; // Modify CV flags
                                AluControl = 4'b1101; // Move B 
                            end
                    end
                3'b010: 
                    case (Func[0])
                        1'b0: // Func[0] == 0 --> Store // Store Instruction with Immediate12
                            begin
                                PCSrc = (1'b0 && CondEx);
                                RegWrite = (1'b0 && CondEx); 
                                MemWrite = (1'b1 && CondEx); 
                                MemToReg = 1'bx; 
                                AluSrc = 1'b1; 
                                ImmSrc = 2'b01; // Extend Immediate 12
                                RegSrc = 2'b10; 
                                AluSrc_Branch_Absolute_Mux_Sel = 1'b1;
                                Write_Data_PC_Mux_Sel = 1'b0;
                                write_enable_NZ = 0; // Do not Modify NZ flags
                                write_enable_CV = 0; // Do not  Modify CV flags
                                AluControl = 4'b0100; // Add
                            end
                        1'b1: // Func[0] == 1 --> Load  // Load Instruction with Immediate12
                            begin
                                PCSrc = (1'b0 && CondEx);
                                RegWrite = (1'b1 && CondEx); 
                                MemWrite = (1'b0 && CondEx); 
                                MemToReg = 1'b1; 
                                AluSrc = 1'b1; 
                                ImmSrc = 2'b01; // Extend Immediate 12
                                RegSrc = 2'bx0; 
                                AluSrc_Branch_Absolute_Mux_Sel = 1'b1;
                                Write_Data_PC_Mux_Sel = 1'b0;
                                write_enable_NZ = 0; // Do not Modify NZ flags
                                write_enable_CV = 0; // Do not  Modify CV flags
                                AluControl = 4'b0100; // Add
                            end
                    endcase
                3'b101: // Branch Instructions with Immediate24
                    case (Func[4])
                        1'b0: // Branch
                            begin
                                PCSrc = (1'b1 && CondEx);
                                RegWrite = (1'b0 && CondEx); 
                                MemWrite = (1'b0 && CondEx); 
                                MemToReg = 1'b0; 
                                AluSrc = 1'b1; 
                                ImmSrc = 2'b10; // Extend Immediate 24
                                RegSrc = 2'bx1; 
                                AluSrc_Branch_Absolute_Mux_Sel = 1'b0; // Alu srcA = 0, Alu srcB = ExtImm
                                Write_Data_PC_Mux_Sel = 1'b0;
                                write_enable_NZ = 0; // Do not Modify NZ flags
                                write_enable_CV = 0; // Do not  Modify CV flags
                                AluControl = 4'b0100; // Pc + extendImm32(extendImm24to32)
                            end
                        1'b1: // Branch with Link
                            begin
                                PCSrc = (1'b1 && CondEx); 
                                RegWrite = (1'b1 && CondEx); // Write to R14 <-- PC 
                                MemWrite = (1'b0 && CondEx); 
                                MemToReg = 1'b0;
                                AluSrc = 1'b1;
                                ImmSrc = 2'b10; // Extend Immediate 24 
                                RegSrc = 2'bx1; 
                                AluSrc_Branch_Absolute_Mux_Sel = 1'b0; // Alu srcA = 0, Alu srcB = ExtImm
                                Write_Data_PC_Mux_Sel = 1'b1; // Selects RD1 -> R15 (pc), writes to the R14
                                write_enable_NZ = 0; // Do not Modify NZ flags
                                write_enable_CV = 0; // Do not  Modify CV flags
                                AluControl = 4'b0100; // Pc + extendImm32(extendImm24to32)
                            end
                    endcase
            endcase
        end    
endmodule
