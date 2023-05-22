module decode_pipeline_reg #(parameter W = 32)
    (
        input clk,
        input reset_synchronous,
        input [W-1:0] inst_fetch,
        output reg [W-1:0] inst_decode
    );

    always @(posedge clk)
        begin
            if (reset_synchronous == 1) 
			    inst_decode <= 0;
			else if (reset_synchronous == 0)
				inst_decode <= inst_fetch;
        end
endmodule