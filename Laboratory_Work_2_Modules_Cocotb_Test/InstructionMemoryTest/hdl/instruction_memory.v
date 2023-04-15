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
		end
	
	always @(*) // Combinational Logic
		begin
			for (i = 0; i < byte_W; i = i+1)
				begin
					out_instruction_data[i*8 +: 8] = memory_arr[inp_address+i];
				end
		end
		
endmodule
