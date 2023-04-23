module instruction_memory #(parameter byte_W = 4, Addr_W = 8)
	(
		input [Addr_W-1:0] inp_address, 
		output reg [8*byte_W-1:0] out_instruction_data
	);

	reg [7:0] memory_arr [300:0]; // little endian 2^32-1 is the array size 
	reg [4:0] i;
	
	initial 
		begin
			i = 0;
			memory_arr[0] = 8'h00;
			memory_arr[1] = 8'h10;
			memory_arr[2] = 8'h12;
			memory_arr[3] = 8'hE4;

			memory_arr[4] = 8'h04;
			memory_arr[5] = 8'h30;
			memory_arr[6] = 8'h12;
			memory_arr[7] = 8'hE4;

			memory_arr[8] = 8'h01;
			memory_arr[9] = 8'h21;
			memory_arr[10] = 8'h83;
			memory_arr[11] = 8'hE0;

			memory_arr[12] = 8'h00;
			memory_arr[13] = 8'h00;
			memory_arr[14] = 8'h00;
			memory_arr[15] = 8'h18;
		end
	
	always @(*) // Combinational Logic
		begin
			for (i = 0; i < byte_W; i = i+1)
				begin
					out_instruction_data[i*8 +: 8] = memory_arr[inp_address+i];
				end
		end
		
endmodule
