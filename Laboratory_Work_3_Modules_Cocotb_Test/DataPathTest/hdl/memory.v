module memory#(BYTE_SIZE=4, ADDR_WIDTH=32)(
input clk,WE,
input [ADDR_WIDTH-1:0] ADDR,
input [(BYTE_SIZE*8)-1:0] WD,
output [(BYTE_SIZE*8)-1:0] RD 
);

reg [7:0] mem [23:0];

initial begin
//mem[0]<=8'h01;
//mem[1]<=8'h02;
//mem[2]<=8'h03;
//mem[3]<=8'h04;
$readmemh("C:/Users/Legion/Desktop/Quartus/EE446-LABORATORY/Computer-Architecture-Verilog/Laboratory_Work_3_Modules_Cocotb_Test/DataPathTest/hdl/mem_data.txt",mem);
end
genvar i;
generate
	for (i = 0; i < BYTE_SIZE; i = i + 1) begin: read_generate
		assign RD[8*i+:8] = mem[ADDR+i];
	end
endgenerate	
integer k;

always @(posedge clk) begin
    if(WE == 1'b1) begin	
        for (k = 0; k < BYTE_SIZE; k = k + 1) begin
            mem[ADDR+k] <= WD[8*k+:8];
        end
    end
end

endmodule

/*
dut.reg_reset.value = 0
await Timer(1, units="us") # lDR R1, [R2, #0]
*/