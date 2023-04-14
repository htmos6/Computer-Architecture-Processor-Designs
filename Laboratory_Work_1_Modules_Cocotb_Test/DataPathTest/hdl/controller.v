module controller #(parameter W = 8) (task_select, MUX0_SELECT, MUX1_SELECT, MUX0_INP1, ALU_OPERATION_SELECT, MUX1_INP1, shamt, write_enable, reset_synchronous, combinational_shifter_control, comp2_mux2_inp_1, op2_mux2_select);
    input [3:0] task_select;

    reg [2:0] state_number;

    output reg [0:0] MUX0_SELECT;
    output reg [0:0] MUX1_SELECT;
    
    output reg [W-1:0] MUX0_INP1;

    output reg [3:0] ALU_OPERATION_SELECT;
    output reg [W-1:0] MUX1_INP1;

    output reg [4:0] shamt;
    output reg write_enable;
    output reg reset_synchronous;
	 
	 output reg [1:0] combinational_shifter_control;
	 output reg [W-1:0] comp2_mux2_inp_1 = 1;
	 output reg [0:0] op2_mux2_select;


 

    initial begin
			state_number = 0;
			MUX0_INP1 = 0; 
	 end
	 
	 always @(*)
		begin 
			case (task_select)
				4'd0: 
					begin
						MUX0_SELECT <= 1;
						MUX1_SELECT <= 1;
						MUX0_INP1 <= 0;
						ALU_OPERATION_SELECT <= 4'd15;
						MUX1_INP1 <= 8'b10100011;
						shamt <= 0;
						write_enable <= 1;
						reset_synchronous <= 0;
						combinational_shifter_control <= 0;
						op2_mux2_select = 1;
					end
				4'd1:
					begin
						MUX0_SELECT <= 0;
						MUX1_SELECT <= 0;
						MUX0_INP1 <= 0 ;
						ALU_OPERATION_SELECT <= 4'd4;
						MUX1_INP1 <= 8'b10100011;
						shamt <= 0;
						write_enable <= 1;
						reset_synchronous <= 0;
						combinational_shifter_control <= 2'b00 ;
						op2_mux2_select <= 0;
					end
				4'd2: 
					begin
						MUX0_SELECT <= 1;
						MUX1_SELECT <= 1;
						MUX0_INP1 <= 0 ;
						ALU_OPERATION_SELECT <= 4'd13;
						MUX1_INP1 <= 8'b10100011;
						shamt <= 0;
						write_enable <= 1;
						reset_synchronous <= 0;
						combinational_shifter_control <= 2'b00 ;
						op2_mux2_select <= 1;					
					end
				4'd3: 
					begin
						MUX0_SELECT <= 0;
						MUX1_SELECT <= 0;
						MUX0_INP1 <= 0 ;
						ALU_OPERATION_SELECT <= 4'd4;
						MUX1_INP1 <= 8'b10100011;
						shamt <= 5'd3;
						write_enable <= 1;
						reset_synchronous <= 0;
						combinational_shifter_control <= 2'b00 ;
						op2_mux2_select <= 1;					
					end
				4'd4: 
					begin
						MUX0_SELECT <= 0;
						MUX1_SELECT <= 1;
						MUX0_INP1 <= 0 ;
						ALU_OPERATION_SELECT <= 4'd4;
						MUX1_INP1 <= 8'b10100011;
						shamt <= 0;
						write_enable <= 1;
						reset_synchronous <= 0;
						combinational_shifter_control <= 2'b00 ;
						op2_mux2_select <= 1;					
					end
				4'd5:
					begin
						MUX0_SELECT <= 1;
						MUX1_SELECT <= 1;
						MUX0_INP1 <= 0 ;
						ALU_OPERATION_SELECT <= 4'd13;
						MUX1_INP1 <= 8'b10100011;
						shamt <= 0;
						write_enable <= 1;
						reset_synchronous <= 0;
						combinational_shifter_control <= 2'b00;
						op2_mux2_select <= 1;					
					end
				4'd6: 
					begin
						MUX0_SELECT <= 1;
						MUX1_SELECT <= 0;
						MUX0_INP1 <= 0 ;
						ALU_OPERATION_SELECT <= 4'd13;
						MUX1_INP1 <= 8'b10100011;
						shamt <= 5'd4;
						write_enable <= 1;
						reset_synchronous <= 0;
						combinational_shifter_control <= 2'b01;
						op2_mux2_select <= 1;					
					end
				4'd7: 
					begin
						MUX0_SELECT <= 0;
						MUX1_SELECT <= 0;
						MUX0_INP1 <= 0 ;
						ALU_OPERATION_SELECT <= 4'd4;
						MUX1_INP1 <= 8'b10100011;
						shamt <= 5'd4;
						write_enable <= 1;
						reset_synchronous <= 0;
						combinational_shifter_control <= 2'b00 ;
						op2_mux2_select <= 1;					
					end
			endcase
		end



endmodule
