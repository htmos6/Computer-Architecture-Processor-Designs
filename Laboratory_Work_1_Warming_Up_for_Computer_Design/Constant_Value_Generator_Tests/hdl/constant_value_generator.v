module constant_value_generator #(parameter W=4, value=5) (output reg [W-1:0] outVal);

	always@(*) begin 
		outVal = value;	
	end
	
endmodule 