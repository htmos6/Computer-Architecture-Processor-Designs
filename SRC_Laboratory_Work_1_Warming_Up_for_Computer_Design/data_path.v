// Copyright (C) 1991-2013 Altera Corporation
// Your use of Altera Corporation's design tools, logic functions 
// and other software and tools, and its AMPP partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Altera Program License 
// Subscription Agreement, Altera MegaCore Function License 
// Agreement, or other applicable license agreement, including, 
// without limitation, that your use is for the sole purpose of 
// programming logic devices manufactured by Altera and sold by 
// Altera or its authorized distributors.  Please refer to the 
// applicable agreement for further details.

// PROGRAM		"Quartus II 64-Bit"
// VERSION		"Version 13.1.0 Build 162 10/23/2013 SJ Web Edition"
// CREATED		"Mon Apr 10 04:09:57 2023"

module data_path(
	input_clk,
	inp_alu_carry,
	task_select
);


input wire	input_clk;
input wire	inp_alu_carry;
input wire	[3:0] task_select;

wire	[1:0] SYNTHESIZED_WIRE_0;
wire	[7:0] SYNTHESIZED_WIRE_18;
wire	[4:0] SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_3;
wire	SYNTHESIZED_WIRE_4;
wire	[7:0] SYNTHESIZED_WIRE_5;
wire	[7:0] SYNTHESIZED_WIRE_6;
wire	[7:0] SYNTHESIZED_WIRE_7;
wire	[0:0] SYNTHESIZED_WIRE_8;
wire	[7:0] SYNTHESIZED_WIRE_10;
wire	[0:0] SYNTHESIZED_WIRE_11;
wire	[7:0] SYNTHESIZED_WIRE_12;
wire	[7:0] SYNTHESIZED_WIRE_13;
wire	[3:0] SYNTHESIZED_WIRE_14;
wire	[7:0] SYNTHESIZED_WIRE_15;
wire	[7:0] SYNTHESIZED_WIRE_16;
wire	[0:0] SYNTHESIZED_WIRE_17;





combinational_shifter	b2v_inst(
	.control(SYNTHESIZED_WIRE_0),
	.inp_shifter(SYNTHESIZED_WIRE_18),
	.shamt(SYNTHESIZED_WIRE_2),
	.out_shifter(SYNTHESIZED_WIRE_7));
	defparam	b2v_inst.W = 8;


register_synchronous_reset_write_en	b2v_inst1(
	.clk(input_clk),
	.write_enable(SYNTHESIZED_WIRE_3),
	.reset_synchronous(SYNTHESIZED_WIRE_4),
	.inp_reg(SYNTHESIZED_WIRE_5),
	.out_reg(SYNTHESIZED_WIRE_18));
	defparam	b2v_inst1.W = 8;


multiplexer2to1	b2v_inst13(
	.inp_mux0(SYNTHESIZED_WIRE_6),
	.inp_mux1(SYNTHESIZED_WIRE_7),
	.select(SYNTHESIZED_WIRE_8),
	.out_mux(SYNTHESIZED_WIRE_15));
	defparam	b2v_inst13.W = 8;


controller	b2v_inst16(
	.task_select(task_select),
	.write_enable(SYNTHESIZED_WIRE_3),
	.reset_synchronous(SYNTHESIZED_WIRE_4),
	.ALU_OPERATION_SELECT(SYNTHESIZED_WIRE_14),
	.combinational_shifter_control(SYNTHESIZED_WIRE_0),
	.comp2_mux2_inp_1(SYNTHESIZED_WIRE_6),
	.MUX0_INP1(SYNTHESIZED_WIRE_10),
	.MUX0_SELECT(SYNTHESIZED_WIRE_11),
	.MUX1_INP1(SYNTHESIZED_WIRE_16),
	.MUX1_SELECT(SYNTHESIZED_WIRE_17),
	.op2_mux2_select(SYNTHESIZED_WIRE_8),
	.shamt(SYNTHESIZED_WIRE_2));
	defparam	b2v_inst16.W = 8;


multiplexer2to1	b2v_inst2(
	.inp_mux0(SYNTHESIZED_WIRE_18),
	.inp_mux1(SYNTHESIZED_WIRE_10),
	.select(SYNTHESIZED_WIRE_11),
	.out_mux(SYNTHESIZED_WIRE_12));
	defparam	b2v_inst2.W = 8;


ALU	b2v_inst3(
	.inp_carry(inp_alu_carry),
	.inp_src0(SYNTHESIZED_WIRE_12),
	.inp_src1(SYNTHESIZED_WIRE_13),
	.operation_select(SYNTHESIZED_WIRE_14),
	
	
	.out_alu(SYNTHESIZED_WIRE_5)
	
	);
	defparam	b2v_inst3.W = 8;


multiplexer2to1	b2v_inst4(
	.inp_mux0(SYNTHESIZED_WIRE_15),
	.inp_mux1(SYNTHESIZED_WIRE_16),
	.select(SYNTHESIZED_WIRE_17),
	.out_mux(SYNTHESIZED_WIRE_13));
	defparam	b2v_inst4.W = 8;


endmodule
