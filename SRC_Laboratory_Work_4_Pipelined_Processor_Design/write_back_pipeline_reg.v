module write_back_pipeline_reg #(parameter W = 32)
    (
        input clk,
		input reset_synchronous,

		input PCSrcM,
		input RegWriteM,
		input MemtoRegM,
		input [W-1:0] RDM,
		input [W-1:0] AluResultM,
		input [3:0] WA3M,

		output reg PCSrcW,
		output reg RegWriteW,
		output reg MemtoRegW,
		output reg [W-1:0] RDW,
		output reg [W-1:0] AluResultW,
		output reg [3:0] WA3W
    );

    always @(posedge clk)
        begin
            if (reset_synchronous == 1) 
				begin
					PCSrcW <= 0;
					RegWriteW <= 0;
					MemtoRegW <= 0;
					RDW <= 0;
					AluResultW <= 0;
					WA3W <= 0;
				end
			else if (reset_synchronous == 0)
				begin
					PCSrcW <= PCSrcM;
					RegWriteW <= RegWriteM;
					MemtoRegW <= MemtoRegM;
					RDW <= RDM;
					AluResultW <= AluResultM;
					WA3W <= WA3M;
				end
        end
endmodule
