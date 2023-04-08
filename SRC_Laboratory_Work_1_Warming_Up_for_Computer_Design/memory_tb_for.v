`timescale 1 ns / 1 ps  //all run instances are taken as in nanoseconds, simulation precision is 1 ps

module memory_tb_for ();

	parameter W = 4;
	parameter Addr_W = 8;

	reg clk;
	reg [Addr_W-1:0] inp_address;
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
			 #10 write_enable = 1; inp_address = 8'h0; inp_data = 32'h01;
			 #10 write_enable = 1; inp_address = 8'h4; inp_data = 32'h23;
			 #10 write_enable = 1; inp_address = 8'h8; inp_data = 32'h45;
			 #10 write_enable = 1; inp_address = 8'h12; inp_data = 32'h67;
			 // Read data from memory
			 #10 write_enable = 0; inp_address = 8'h0;
			 #10 write_enable = 0; inp_address = 8'h4;
			 #10 write_enable = 0; inp_address = 8'h8;
			 #10 write_enable = 0; inp_address = 8'h12;
			 #10 $finish;
			 
		end
endmodule
