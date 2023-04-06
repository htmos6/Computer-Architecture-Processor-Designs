module #(parameter W=4, value=0) constant_value_generator(output outVal);
	output reg [W-1:0] outVal;
	
	always(*) begin 
		outVal <= value;	
	end
	
endmodule 