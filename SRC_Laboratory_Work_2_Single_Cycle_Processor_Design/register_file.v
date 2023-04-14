module register_file #(parameter W = 32) 
    (
    input clk, 
    input write_enable, 
    input reset_synchronous,
    input [3:0] inp_read_address0, 
    input [3:0] inp_read_address1, 
    input [3:0] inp_write_address0, 
    input [W-1:0] inp_write_data, 
    output [W-1:0] out_read_data0,
    output [W-1:0] out_read_data1 
    );	

    // wire clk = clk;
    // wire write_enable = write_enable;
    // wire reset_synchronous = reset_synchronous;

    wire [3:0] inp_dec0_wire = inp_read_address0; // 4-bit decoder0 input select address
    wire [3:0] inp_dec1_wire = inp_read_address1; // 4-bit decoder1 input select address
    wire [3:0] inp_write_wire = inp_write_address0;

    wire [15:0] out_dec0_wire; // 16-bit decoder0 output
    wire [15:0] out_dec1_wire; // 16-bit decoder1 output
    wire [15:0] out_write_wire; // 16-bit decoder1 output

    // wire [W-1:0] inp_write_data = inp_write_data;


    wire [W-1:0] out_R0;
    wire [W-1:0] out_R1;
    wire [W-1:0] out_R2;
    wire [W-1:0] out_R3;
    wire [W-1:0] out_R4;
    wire [W-1:0] out_R5;
    wire [W-1:0] out_R6;
    wire [W-1:0] out_R7;
    wire [W-1:0] out_R8;
    wire [W-1:0] out_R9;
    wire [W-1:0] out_R10;
    wire [W-1:0] out_R11;
    wire [W-1:0] out_R12;
    wire [W-1:0] out_R13;
    wire [W-1:0] out_R14;
    wire [W-1:0] out_R15;


    // wire [W-1:0] out_16to1_MUX_RD0;
    // wire [W-1:0] out_16to1_MUX_RD1;


    // decoder4to16 register_RD0_select(.inp_dec(inp_dec0_wire), .out_dec(out_dec0_wire)); // 4-bit decoder input 0 & 16-bit decoder output
    // decoder4to16 register_RD1_select(.inp_dec(inp_dec1_wire), .out_dec(out_dec1_wire)); // 4-bit decoder input 1 & 16-bit decoder output
    decoder4to16 register_WR_select(.inp_dec(inp_write_wire), .out_dec(out_write_wire)); // 4-bit decoder input 1 & 16-bit decoder output

    register_synchronous_reset_write_en #(.W(W)) R0 (.clk(clk), .write_enable(write_enable & out_write_wire[0]), .reset_synchronous(reset_synchronous), .inp_reg(inp_write_data), .out_reg(out_R0));
    register_synchronous_reset_write_en #(.W(W)) R1 (.clk(clk), .write_enable(write_enable & out_write_wire[1]), .reset_synchronous(reset_synchronous), .inp_reg(inp_write_data), .out_reg(out_R1));
    register_synchronous_reset_write_en #(.W(W)) R2 (.clk(clk), .write_enable(write_enable & out_write_wire[2]), .reset_synchronous(reset_synchronous), .inp_reg(inp_write_data), .out_reg(out_R2));
    register_synchronous_reset_write_en #(.W(W)) R3 (.clk(clk), .write_enable(write_enable & out_write_wire[3]), .reset_synchronous(reset_synchronous), .inp_reg(inp_write_data), .out_reg(out_R3));
    register_synchronous_reset_write_en #(.W(W)) R4 (.clk(clk), .write_enable(write_enable & out_write_wire[4]), .reset_synchronous(reset_synchronous), .inp_reg(inp_write_data), .out_reg(out_R4));
    register_synchronous_reset_write_en #(.W(W)) R5 (.clk(clk), .write_enable(write_enable & out_write_wire[5]), .reset_synchronous(reset_synchronous), .inp_reg(inp_write_data), .out_reg(out_R5));
    register_synchronous_reset_write_en #(.W(W)) R6 (.clk(clk), .write_enable(write_enable & out_write_wire[6]), .reset_synchronous(reset_synchronous), .inp_reg(inp_write_data), .out_reg(out_R6));
    register_synchronous_reset_write_en #(.W(W)) R7 (.clk(clk), .write_enable(write_enable & out_write_wire[7]), .reset_synchronous(reset_synchronous), .inp_reg(inp_write_data), .out_reg(out_R7));
    register_synchronous_reset_write_en #(.W(W)) R8 (.clk(clk), .write_enable(write_enable & out_write_wire[8]), .reset_synchronous(reset_synchronous), .inp_reg(inp_write_data), .out_reg(out_R8));
    register_synchronous_reset_write_en #(.W(W)) R9 (.clk(clk), .write_enable(write_enable & out_write_wire[9]), .reset_synchronous(reset_synchronous), .inp_reg(inp_write_data), .out_reg(out_R9));
    register_synchronous_reset_write_en #(.W(W)) R10 (.clk(clk), .write_enable(write_enable & out_write_wire[10]), .reset_synchronous(reset_synchronous), .inp_reg(inp_write_data), .out_reg(out_R10));
    register_synchronous_reset_write_en #(.W(W)) R11 (.clk(clk), .write_enable(write_enable & out_write_wire[11]), .reset_synchronous(reset_synchronous), .inp_reg(inp_write_data), .out_reg(out_R11));
    register_synchronous_reset_write_en #(.W(W)) R12 (.clk(clk), .write_enable(write_enable & out_write_wire[12]), .reset_synchronous(reset_synchronous), .inp_reg(inp_write_data), .out_reg(out_R12));
    register_synchronous_reset_write_en #(.W(W)) R13 (.clk(clk), .write_enable(write_enable & out_write_wire[13]), .reset_synchronous(reset_synchronous), .inp_reg(inp_write_data), .out_reg(out_R13));
    register_synchronous_reset_write_en #(.W(W)) R14 (.clk(clk), .write_enable(write_enable & out_write_wire[14]), .reset_synchronous(reset_synchronous), .inp_reg(inp_write_data), .out_reg(out_R14));
    register_synchronous_reset_write_en #(.W(W)) R15 (.clk(clk), .write_enable(write_enable & out_write_wire[15]), .reset_synchronous(reset_synchronous), .inp_reg(inp_write_data), .out_reg(out_R15));


    multiplexer16to1 #(.W(W)) read_0_select (
                                    .inp_mux0(out_R0), .inp_mux1(out_R1), .inp_mux2(out_R2), .inp_mux3(out_R3),
                                    .inp_mux4(out_R4), .inp_mux5(out_R5), .inp_mux6(out_R6), .inp_mux7(out_R7),
                                    .inp_mux8(out_R8), .inp_mux9(out_R9), .inp_mux10(out_R10), .inp_mux11(out_R11), 
                                    .inp_mux12(out_R12), .inp_mux13(out_R13), .inp_mux14(out_R14), .inp_mux15(out_R15),
                                    .select(inp_dec0_wire), 
                                    .out_mux(out_read_data0)
                                   );

    multiplexer16to1 #(.W(W)) read_1_select (
                                    .inp_mux0(out_R0), .inp_mux1(out_R1), .inp_mux2(out_R2), .inp_mux3(out_R3),
                                    .inp_mux4(out_R4), .inp_mux5(out_R5), .inp_mux6(out_R6), .inp_mux7(out_R7),
                                    .inp_mux8(out_R8), .inp_mux9(out_R9), .inp_mux10(out_R10), .inp_mux11(out_R11), 
                                    .inp_mux12(out_R12), .inp_mux13(out_R13), .inp_mux14(out_R14), .inp_mux15(out_R15),
                                    .select(inp_dec1_wire), 
                                    .out_mux(out_read_data1)
                                   );
endmodule

