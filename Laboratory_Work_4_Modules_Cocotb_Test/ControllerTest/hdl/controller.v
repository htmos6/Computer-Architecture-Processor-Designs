module controller #(parameter W=32) 
    (   
        input [1:0] Op, // Instruction[27:26] Data processing 00, Memory 01 or Branch 10
        input [5:0] Func, // Instruction[25:20] Operation Code Add, Sub .... 
        input [3:0] Rd, // Instruction[15:12] Destination Register
        input [15:0] inst_19_to_4_BX,
        input RESET,

        output reg PCSrcD,
        output reg BranchD,
        output reg RegWriteD,
        output reg MemWriteD,
        output reg MemtoRegD,
        output reg [3:0] AluControlD,
        output reg AluSrcD,
        output reg [1:0] FlagWriteD,
        output reg [1:0] ImmSrcD,
        output reg [1:0] RegSrcD,
        output reg RESET_OUT
        // output reg AluSrc_Branch_Absolute_Mux_Sel,
        // output reg Write_Data_PC_Mux_Sel,
    );
    
    initial 
        begin 
            RESET_OUT = 1'b0;
        end
    
    always  @(*) 
        begin 
            if (Op == 2'b00) // Data processing instruction
                begin
                    if (Func[5] == 1) // Data processing with immediate
                        begin
                            if ((Func[4:1] == 4'b0100) || (Func[4:1] == 4'b0010)) // If operation is ADD or SUB operation
                                begin
                                    PCSrcD = 1'b0;
                                    BranchD = 1'b0;
                                    RegWriteD = 1'b1;
                                    MemWriteD = 1'b0;
                                    MemtoRegD = 1'b0;
                                    AluControlD = Func[4:1];
                                    AluSrcD = 1'b1;
                                    FlagWriteD = 2'b11;
                                    ImmSrcD = 2'b00;
                                    RegSrcD = 2'bx0;
                                end
                            else if((Func[4:1] == 4'b0000) || (Func[4:1] == 4'b1100) || (Func[4:1] == 4'b1101) ) // If operation is AND, ORR, MOV
                                begin
                                    PCSrcD = 1'b0;
                                    BranchD = 1'b0;
                                    RegWriteD = 1'b1;
                                    MemWriteD = 1'b0;
                                    MemtoRegD = 1'b0;
                                    AluControlD = Func[4:1];
                                    AluSrcD = 1'b1;
                                    FlagWriteD = 2'b10;
                                    ImmSrcD = 2'b00;
                                    RegSrcD = 2'bx0;
                                end
                            else if ( (Func[4:1] == 4'b1010) ) // If operation is CMP
                                begin
                                    PCSrcD = 1'b0;
                                    BranchD = 1'b0;
                                    RegWriteD = 1'b0;
                                    MemWriteD = 1'b0;
                                    MemtoRegD = 1'bx;
                                    AluControlD = Func[4:1];
                                    AluSrcD = 1'b0;
                                    FlagWriteD = 2'b11;
                                    ImmSrcD = 2'bxx;
                                    RegSrcD = 2'b10;
                                end
                        end
                    else if ( (Func[5] == 0) && (Func[4:1] != 4'b1001) && ({Func[0], inst_19_to_4_BX} != 17'h0FFF1)) // Data processing with register
                        begin
                            if ((Func[4:1] == 4'b0100) || (Func[4:1] == 4'b0010)) // If operation is ADD or SUB operation
                                begin
                                    PCSrcD = 1'b0;
                                    BranchD = 1'b0;
                                    RegWriteD = 1'b1;
                                    MemWriteD = 1'b0;
                                    MemtoRegD = 1'b0;
                                    AluControlD = Func[4:1];
                                    AluSrcD = 1'b0;
                                    FlagWriteD = 2'b11;
                                    ImmSrcD = 2'bxx;
                                    RegSrcD = 2'b00;
                                end
                            else if((Func[4:1] == 4'b0000) || (Func[4:1] == 4'b1100) || (Func[4:1] == 4'b1101) ) // If operation is AND, ORR, MOV
                                begin
                                    PCSrcD = 1'b0;
                                    BranchD = 1'b0;
                                    RegWriteD = 1'b1;
                                    MemWriteD = 1'b0;
                                    MemtoRegD = 1'b0;
                                    AluControlD = Func[4:1];
                                    AluSrcD = 1'b0;
                                    FlagWriteD = 2'b10;
                                    ImmSrcD = 2'bxx;
                                    RegSrcD = 2'b00;
                                end
                            else if ( (Func[4:1] == 4'b1010) ) // If operation is CMP
                                begin
                                    PCSrcD = 1'b0;
                                    BranchD = 1'b0;
                                    RegWriteD = 1'b0;
                                    MemWriteD = 1'b0;
                                    MemtoRegD = 1'bx;
                                    AluControlD = Func[4:1];
                                    AluSrcD = 1'b0;
                                    FlagWriteD = 2'b11;
                                    ImmSrcD = 2'bxx;
                                    RegSrcD = 2'b10;
                                end
                        end
                    else if ( (Func[5] == 0) && (Func[4:1] == 4'b1001) && ({Func[0], inst_19_to_4_BX} == 17'h0FFF1)) // BX instruction
                        begin
                            PCSrcD = 1'b1;
                            BranchD = 1'b1;
                            RegWriteD = 1'b0;
                            MemWriteD = 1'b0;
                            MemtoRegD = 1'b0;
                            AluControlD = 4'b1101;
                            AluSrcD = 0;
                            FlagWriteD = 2'b00;
                            ImmSrcD = 2'bxx;
                            RegSrcD = 2'b0x;
                        end
                end
            else if (Op == 2'b01) // Memory instruction
                begin
                    if (Func[5] == 0 && Func[0] == 1) // Func_t0 == 1 --> LDR with imm
                        begin
                            PCSrcD = 1'b0;
                            BranchD = 1'b0;
                            RegWriteD = 1'b1;
                            MemWriteD = 1'b0;
                            MemtoRegD = 1'b1;
                            AluControlD = 4'b0100;
                            AluSrcD = 1'b1;
                            FlagWriteD = 2'b00;
                            ImmSrcD = 2'b01;
                            RegSrcD = 2'bx0;
                        end
                    else if (Func[5] == 0 && Func[0] == 0) // Func_t0 == 0 --> STR with imm
                        begin
                            PCSrcD = 1'b0;
                            BranchD = 1'b0;
                            RegWriteD = 1'b0;
                            MemWriteD = 1'b1;
                            MemtoRegD = 1'bx;
                            AluControlD = 4'b0100;
                            AluSrcD = 1'b1;
                            FlagWriteD = 2'b00;
                            ImmSrcD = 2'b01;
                            RegSrcD = 2'b10;
                        end
                end
            else if (Op == 2'b10) // Branch instructiob
                begin
                    if( Func[4] == 0 ) // B instruction
                        begin
                            PCSrcD = 1'b1;
                            BranchD = 1'b1;
                            RegWriteD = 1'b0;
                            MemWriteD = 1'b0;
                            MemtoRegD = 1'b0;
                            AluControlD = 4'b0100;
                            AluSrcD = 1'b1;
                            FlagWriteD = 2'b00;
                            ImmSrcD = 2'b10;
                            RegSrcD = 2'bx1;
                        end
                    else if ( Func[4] == 1 ) // BL instruction
                        begin
                            PCSrcD = 1'b1;
                            BranchD = 1'b1;
                            RegWriteD = 1'b1;
                            MemWriteD = 1'b0;
                            MemtoRegD = 1'b0;
                            AluControlD = 4'b0100;
                            AluSrcD = 1'b1;
                            FlagWriteD = 2'b00;
                            ImmSrcD = 2'b10;
                            RegSrcD = 2'bx1;
                        end
                end            
        end
 endmodule
