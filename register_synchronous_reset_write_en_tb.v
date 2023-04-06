`timescale 1ns / 1ps // set the timescale for the simulation

module register_synchronous_reset_write_en_tb;
	parameter W = 16;
	// Declare signals for the testbench
	reg clk;
	reg write_enable;
	reg reset_synchronous;
	reg [3:0] inp_reg;
	wire [3:0] out_reg;
	
	// Instantiate the module under test
	register_synchronous_reset_write_en #(.W(W)) dut (
		.clk(clk),
		.write_enable(write_enable),
		.reset_synchronous(reset_synchronous),
		.inp_reg(inp_reg),
		.out_reg(out_reg)
	);
	
	initial begin
		// Initialize input signals
		clk = 0;
		write_enable = 0;
		reset_synchronous = 1;
		inp_reg = 4'b1010;
		
		// Wait for a few clock cycles
		#10;
		
		// Release the synchronous reset
		reset_synchronous = 0;
		
		// Wait for a few more clock cycles
		#10;
		
		// Enable write and load input data
		write_enable = 1;
		inp_reg = 4'b0110;
		
		// Wait for one clock cycle
		#1;
		
		// Disable write and check output
		write_enable = 0;
		if (out_reg !== 4'b0110)
			$display("Error: Output value is %b instead of 0110", out_reg);
		
		// Wait for a few more clock cycles
		#10;
		
		// Set the synchronous reset again
		reset_synchronous = 1;
		
		// Wait for a few more clock cycles
		#10;
		
		// Check that the output has been cleared
		if (out_reg !== 4'b0000)
			$display("Error: Output value is %b instead of 0000", out_reg);
		
		// End the simulation
		$finish;
	end
	
	always  //clock generator
	begin
		clk = 0;
		#0.5; //15 ns delay
		clk = 1;
		#0.5; //15 ns delay and go back to clock = 0 state
	end
	
endmodule
