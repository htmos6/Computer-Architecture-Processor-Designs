module execute_pipeline_reg #(parameter W = 32)
    (
        input clk,
		input reset_synchronous,

        input PCSrcD,
		input BranchD,
		input RegWriteD,
		input MemWriteD,
		input MemtoRegD,
		input [3:0] AluControlD,
		input AluSrcD,
		input [1:0] FlagWriteD,
		input [3:0] CondD,
		input [3:0] FlagsD,
		input [W-1:0] ExtendImmD,
		input [W-1:0] RD1D,
		input [W-1:0] RD2D,
		input [3:0] WA3D,

		output reg PCSrcE,
		output reg BranchE,
		output reg RegWriteE,
		output reg MemWriteE,
		output reg MemtoRegE,
		output reg [3:0] AluControlE,
		output reg AluSrcE,
		output reg [1:0] FlagWriteE,
		output reg [3:0] CondE,
		output reg [3:0] FlagsE,
		output reg [W-1:0] ExtendImmE,
		output reg [W-1:0] RD1E,
		output reg [W-1:0] RD2E,
		output reg [3:0] WA3E
    );

    always @(posedge clk)
        begin
            if (reset_synchronous == 1) 
				begin
					PCSrcE <= 0;
					BranchE <= 0;
					RegWriteE <= 0;
					MemWriteE <= 0;
					MemtoRegE <= 0;
					AluControlE <= 0;
					AluSrcE <= 0;
					FlagWriteE <= 0;
					CondE <= 0;
					FlagsE <= 0;
					ExtendImmE <= 0;
					RD1E <= 0;
					RD2E <= 0;
					WA3E <= 0;
				end
			else if (reset_synchronous == 0)
				begin
					PCSrcE <= PCSrcD;
					BranchE <= BranchD;
					RegWriteE <= RegWriteD;
					MemWriteE <= MemWriteD;
					MemtoRegE <= MemtoRegD;
					AluControlE <= AluControlD;
					AluSrcE <= AluSrcD;
					FlagWriteE <= FlagWriteD;
					CondE <= CondD;
					FlagsE <= FlagsD;
					ExtendImmE <= ExtendImmD;
					RD1E <= RD1D;
					RD2E <= RD2D;
					WA3E <= WA3D;
				end
        end
endmodule
