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

			/* 
			ADD R2, R3, R1
			memory_arr[8] = 8'h01;
			memory_arr[9] = 8'h20;
			memory_arr[10] = 8'h83;
			memory_arr[11] = 8'hE0;
			*/

			// SUB R3, R3, R1 
			memory_arr[8] = 8'h01;
			memory_arr[9] = 8'h30;
			memory_arr[10] = 8'h43;
			memory_arr[11] = 8'hE0;

			// LDR R7, [R2, #8]
			memory_arr[12] = 8'h08;
			memory_arr[13] = 8'h70;
			memory_arr[14] = 8'h12;
			memory_arr[15] = 8'hE4;


			// ADD R3, R3, R7
			memory_arr[16] = 8'h07;
			memory_arr[17] = 8'h30;
			memory_arr[18] = 8'h83;
			memory_arr[19] = 8'hE0;



			// LDR R2, [R2, #12]
			memory_arr[20] = 8'h0C;
			memory_arr[21] = 8'h20;
			memory_arr[22] = 8'h12;
			memory_arr[23] = 8'hE4;


			// LDR R7, [R2, #0]
			memory_arr[24] = 8'h00;
			memory_arr[25] = 8'h70;
			memory_arr[26] = 8'h12;
			memory_arr[27] = 8'hE4;


			// ADD R2, R2, R7
			memory_arr[28] = 8'h07;
			memory_arr[29] = 8'h20;
			memory_arr[30] = 8'h82;
			memory_arr[31] = 8'hE0;


			// LDR R4, [R2, #0]
			memory_arr[32] = 8'h00;
			memory_arr[33] = 8'h40;
			memory_arr[34] = 8'h12;
			memory_arr[35] = 8'hE4;


			// ADD R2, R2, R7
			memory_arr[36] = 8'h07;
			memory_arr[37] = 8'h20;
			memory_arr[38] = 8'h82;
			memory_arr[39] = 8'hE0;


			// LDR R8, [R9, #8]
			memory_arr[40] = 8'h08;
			memory_arr[41] = 8'h80;
			memory_arr[42] = 8'h19;
			memory_arr[43] = 8'hE4;


			// R6, [R2, #0] 
			memory_arr[44] = 8'h00;
			memory_arr[45] = 8'h60;
			memory_arr[46] = 8'h12;
			memory_arr[47] = 8'hE4;


			// ADD R5, R5, R6
			memory_arr[48] = 8'h06;
			memory_arr[49] = 8'h50;
			memory_arr[50] = 8'h85;
			memory_arr[51] = 8'hE0;

			// ADD R2, R2, R7
			memory_arr[52] = 8'h07;
			memory_arr[53] = 8'h20;
			memory_arr[54] = 8'h82;
			memory_arr[55] = 8'hE0;

			// SUBS R4, R4, R8
			memory_arr[56] = 8'h08;
			memory_arr[57] = 8'h40;
			memory_arr[58] = 8'h54;
			memory_arr[59] = 8'hE0;

			// BNE loop
			memory_arr[60] = 8'h2C;
			memory_arr[61] = 8'h00;
			memory_arr[62] = 8'h00;
			memory_arr[63] = 8'h1A;

			// STR R5, [R2, #0]
			memory_arr[64] = 8'h00;
			memory_arr[65] = 8'h50;
			memory_arr[66] = 8'h02;
			memory_arr[67] = 8'hE4;

		end
	
	always @(*) // Combinational Logic
		begin
			for (i = 0; i < byte_W; i = i+1)
				begin
					out_instruction_data[i*8 +: 8] = memory_arr[inp_address+i];
				end
		end
		
endmodule
