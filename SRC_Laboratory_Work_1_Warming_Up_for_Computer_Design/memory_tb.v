`timescale 1 ns / 1 ps  //all run instances are taken as in nanoseconds, simulation precision is 1 ps

module memory_tb ();

	parameter W = 1;
	parameter Addr_W = 8;

	reg clk;
	reg [Addr_W:0] inp_address;
	reg [8*W-1:0] inp_data;
	reg write_enable;
	wire [8*W-1:0] out_read_data;

	
	
	memory #(.W(W), .Addr_W(Addr_W)) DUT(.clk(clk), 
													 .inp_address(inp_address),
													 .inp_data(inp_data),
													 .write_enable(write_enable),
													 .out_read_data(out_read_data)
													 );

	initial 
		begin
			inp_address <= 0;
			inp_data <= 0;
			write_enable <= 1;
		end
	
	always  //clock generator
		begin
			clk = 0;
			#0.5; //15 ns delay
			clk = 1;
			#0.5; //15 ns delay and go back to clock = 0 state
		end
	
	initial 
		begin
			 // Write data to memory
			 #100 write_enable = 1; inp_address = 8'h00; inp_data = 8'h01;
			 #100 write_enable = 1; inp_address = 8'h01; inp_data = 8'h23;
			 #100 write_enable = 1; inp_address = 8'h02; inp_data = 8'h45;
			 #100 write_enable = 1; inp_address = 8'h03; inp_data = 8'h67;
			 // Read data from memory
			 #100 write_enable = 0; inp_address = 8'h00;
			 #100 write_enable = 0; inp_address = 8'h01;
			 #100 write_enable = 0; inp_address = 8'h02;
			 #100 write_enable = 0; inp_address = 8'h03;
			 #100 $finish;
		end
endmodule


