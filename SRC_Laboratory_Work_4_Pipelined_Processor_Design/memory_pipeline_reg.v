module memory_pipeline_reg #(parameter W = 32)
    (
        input clk,
		input reset_synchronous,

		input PCSrcE,
		input RegWriteE,
		input MemWriteE,
		input MemtoRegE,
		input [W-1:0] AluResultE,
		input [W-1:0] WriteDataE,
		input [3:0] WA3E,

		output reg PCSrcM,
		output reg RegWriteM,
		output reg MemWriteM,
		output reg MemtoRegM,
		output reg [W-1:0] AluResultM,
		output reg [W-1:0] WriteDataM,
		output reg [3:0] WA3M
    );

    always @(posedge clk)
        begin
            if (reset_synchronous == 1) 
				begin
					PCSrcM <= 0;
					RegWriteM <= 0;
					MemWriteM <= 0;
					MemtoRegM <= 0;
					AluResultM <= 0;
					WriteDataM <= 0;
					WA3M <= 0;
				end
			else if (reset_synchronous == 0)
				begin
					PCSrcM <= PCSrcE;
					RegWriteM <= RegWriteE;
					MemWriteM <= MemWriteE;
					MemtoRegM <= MemtoRegE;
					AluResultM <= AluResultE;
					WriteDataM <= WriteDataE;
					WA3M <= WA3E;
				end
        end
endmodule
