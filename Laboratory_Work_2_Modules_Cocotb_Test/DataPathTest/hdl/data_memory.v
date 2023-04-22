module data_memory #(parameter byte_W = 4, Addr_W = 8)
	(
		input clk, 
		input [Addr_W-1:0] inp_address, 
		input [8*byte_W-1:0] inp_data,
		input write_enable, 
		output reg [8*byte_W-1:0] out_read_data
	);

	reg [7:0] memory_arr [300:0]; // little endian 2^32-1 is the array size 
	reg [4:0] i;
	
	initial 
		begin
			i = 0;
			memory_arr[0] = 8'h07;
			memory_arr[1] = 8'h00;
			memory_arr[2] = 8'h00;
			memory_arr[3] = 8'h00;

			memory_arr[4] = 8'h08;
			memory_arr[5] = 8'h00;
			memory_arr[6] = 8'h00;
			memory_arr[7] = 8'h00;
		end

	always @(posedge clk) // Sequential Logic
		begin
			if (write_enable)
				begin
					for (i = 0; i < byte_W; i = i+1)
						begin
							memory_arr[inp_address+i] = inp_data[i*8 +: 8];
						end
				end
		end
	
	
	always @(*) // Combinational Logic
		begin
			for (i = 0; i < byte_W; i = i+1)
				begin
					out_read_data[i*8 +: 8] = memory_arr[inp_address+i];
				end
		end
		
endmodule
