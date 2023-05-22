module fetch_pipeline_reg #(parameter W = 32)
    (
        input clk,
        input reset_synchronous,
        input [W-1:0] pc_prev,
        output reg [W-1:0] pc_fetch
    );

    always @(posedge clk)
        begin
            if (reset_synchronous == 1) 
				pc_fetch <= 0;
			else if (reset_synchronous == 0)
				pc_fetch <= pc_prev;
        end
endmodule
