module controller #(parameter W=32) 
    (   
        input clk,
        input [3:0] Cond, // Instruction[31:28]
        input [1:0] Op, // Instruction[27:26]
        input [5:0] Func, // Instruction[25:20]
        input [3:0] Rd, // Instruction[15:12]
        output PCSrc,
        output RegWrite,
        output MemWrite,
        output MemToReg,
        output AluSrc,
        output [1:0] ImmSrc,
        output [1:0] RegSrc,
        output [1:0] AluControl
    );












    








endmodule
