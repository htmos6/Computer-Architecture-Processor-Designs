`timescale 1ns / 1ps

module test_register_file;

  // Parameters
  localparam W = 16;
  localparam ADDR_BITS = 4;
  localparam NUM_REGS = 16;

  // Inputs
  reg clk = 0;
  reg write_enable = 0;
  reg reset_synchronous = 0;
  reg [ADDR_BITS-1:0] inp_read_address0;
  reg [ADDR_BITS-1:0] inp_read_address1;
  reg [ADDR_BITS-1:0] inp_write_address0;
  reg [W-1:0] inp_write_data;

  // Outputs
  wire [W-1:0] out_read_data0;
  wire [W-1:0] out_read_data1;

  // Instantiate the DUT
  register_file #(.W(W)) dut (
    .clk(clk),
    .write_enable(write_enable),
    .reset_synchronous(reset_synchronous),
    .inp_read_address0(inp_read_address0),
    .inp_read_address1(inp_read_address1),
    .inp_write_address0(inp_write_address0),
    .inp_write_data(inp_write_data),
    .out_read_data0(out_read_data0),
    .out_read_data1(out_read_data1)
  );

  // Clock generation
  always #5 clk = ~clk;

  // Testbench
  integer i;
  initial begin
    // Reset
    reset_synchronous = 1;
    #10;
    reset_synchronous = 0;
    #10;

    // Write some values to the registers
    write_enable = 1;
    inp_write_address0 = 0;
    inp_write_data = 16'h1234;
	 inp_read_address0 = 0;

	 #10;
    inp_write_address0 = 1;
    inp_write_data = 16'h5678;
	 inp_read_address0 =  1;

    #10;
    write_enable = 0;

    // Write some more values to the registers
    write_enable = 1;
    inp_write_address0 = 2;
    inp_write_data = 16'habcd;
    #10;
    inp_write_address0 = 3;
    inp_write_data = 16'h9876;
    #10;
    write_enable = 0;
	 
	 
	 // Write data to memory
	 #10 write_enable = 1; inp_write_address0 = 4'h0; inp_read_address0 = 8'h0; inp_write_data = 16'h1;
	 #10 write_enable = 1; inp_write_address0 = 4'h3; inp_read_address0 = 8'h3; inp_write_data = 16'h2;
	 #10 write_enable = 1; inp_write_address0 = 4'h6; inp_read_address0 = 8'h6; inp_write_data = 16'h4;
	 #10 write_enable = 1; inp_write_address0 = 4'h9; inp_read_address0 = 8'h9; inp_write_data = 16'h7;
	 // Read data from memory
	 #10 write_enable = 0; inp_read_address0 = 8'h0;
	 #10 write_enable = 0; inp_read_address0 = 8'h3;
	 #10 write_enable = 0; inp_read_address0 = 8'h6;
	 #10 write_enable = 0; inp_read_address0 = 8'h9;
	 #10 $finish;
  end

endmodule
