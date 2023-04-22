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
// CREATED		"Sat Apr 22 21:16:30 2023"

module dp_lab2(
	clk
);


input wire	clk;

wire	[31:0] inst;
wire	[1:0] RegSrc;
wire	SYNTHESIZED_WIRE_0;
wire	[31:0] SYNTHESIZED_WIRE_1;
wire	[0:31] SYNTHESIZED_WIRE_2;
wire	[31:0] SYNTHESIZED_WIRE_40;
wire	SYNTHESIZED_WIRE_4;
wire	[31:0] SYNTHESIZED_WIRE_41;
wire	[31:0] SYNTHESIZED_WIRE_6;
wire	SYNTHESIZED_WIRE_7;
wire	[31:0] SYNTHESIZED_WIRE_8;
wire	[31:0] SYNTHESIZED_WIRE_9;
wire	[3:0] SYNTHESIZED_WIRE_10;
wire	SYNTHESIZED_WIRE_11;
wire	[31:0] SYNTHESIZED_WIRE_42;
wire	[31:0] SYNTHESIZED_WIRE_15;
wire	SYNTHESIZED_WIRE_16;
wire	[31:0] SYNTHESIZED_WIRE_43;
wire	SYNTHESIZED_WIRE_19;
wire	[31:0] SYNTHESIZED_WIRE_20;
wire	[31:0] SYNTHESIZED_WIRE_44;
wire	SYNTHESIZED_WIRE_22;
wire	SYNTHESIZED_WIRE_23;
wire	SYNTHESIZED_WIRE_24;
wire	SYNTHESIZED_WIRE_25;
wire	[31:0] SYNTHESIZED_WIRE_45;
wire	[31:0] SYNTHESIZED_WIRE_28;
wire	[1:0] SYNTHESIZED_WIRE_29;
wire	SYNTHESIZED_WIRE_30;
wire	SYNTHESIZED_WIRE_31;
wire	[3:0] SYNTHESIZED_WIRE_32;
wire	[3:0] SYNTHESIZED_WIRE_33;
wire	[31:0] SYNTHESIZED_WIRE_34;
wire	[31:0] SYNTHESIZED_WIRE_35;
wire	SYNTHESIZED_WIRE_38;
wire	[3:0] SYNTHESIZED_WIRE_39;

assign	SYNTHESIZED_WIRE_0 = 0;
assign	SYNTHESIZED_WIRE_2 = 0;
assign	SYNTHESIZED_WIRE_31 = 0;




program_counter	b2v_inst1(
	.clk(clk),
	.reset_synchronous(SYNTHESIZED_WIRE_0),
	.inp_reg(SYNTHESIZED_WIRE_1),
	.out_reg(SYNTHESIZED_WIRE_45));
	defparam	b2v_inst1.W = 32;


multiplexer2to1	b2v_inst10(
	.inp_mux0(inst[3:0]),
	.inp_mux1(inst[15:12]),
	.select(RegSrc[1]),
	.out_mux(SYNTHESIZED_WIRE_33));
	defparam	b2v_inst10.W = 4;


constant_value_generator	b2v_inst11(
	.outVal(SYNTHESIZED_WIRE_39));
	defparam	b2v_inst11.value = 15;
	defparam	b2v_inst11.W = 4;


multiplexer2to1	b2v_inst12(
	.inp_mux0(SYNTHESIZED_WIRE_2),
	.inp_mux1(SYNTHESIZED_WIRE_40),
	.select(SYNTHESIZED_WIRE_4),
	.out_mux(SYNTHESIZED_WIRE_8));
	defparam	b2v_inst12.W = 32;



multiplexer2to1	b2v_inst14(
	.inp_mux0(SYNTHESIZED_WIRE_41),
	.inp_mux1(SYNTHESIZED_WIRE_6),
	.select(SYNTHESIZED_WIRE_7),
	.out_mux(SYNTHESIZED_WIRE_9));
	defparam	b2v_inst14.W = 32;


ALU	b2v_inst15(
	
	.inp_src0(SYNTHESIZED_WIRE_8),
	.inp_src1(SYNTHESIZED_WIRE_9),
	.operation_select(SYNTHESIZED_WIRE_10),
	.carry_out_flag(SYNTHESIZED_WIRE_22),
	.overflow_flag(SYNTHESIZED_WIRE_23),
	.negative_flag(SYNTHESIZED_WIRE_24),
	.zero_flag(SYNTHESIZED_WIRE_25),
	.out_alu(SYNTHESIZED_WIRE_42));
	defparam	b2v_inst15.WIDTH = 32;


data_memory	b2v_inst16(
	.clk(clk),
	.write_enable(SYNTHESIZED_WIRE_11),
	.inp_address(SYNTHESIZED_WIRE_42),
	.inp_data(SYNTHESIZED_WIRE_41),
	.out_read_data(SYNTHESIZED_WIRE_15));
	defparam	b2v_inst16.Addr_W = 32;
	defparam	b2v_inst16.byte_W = 4;


multiplexer2to1	b2v_inst17(
	.inp_mux0(SYNTHESIZED_WIRE_42),
	.inp_mux1(SYNTHESIZED_WIRE_15),
	.select(SYNTHESIZED_WIRE_16),
	.out_mux(SYNTHESIZED_WIRE_43));
	defparam	b2v_inst17.W = 32;


multiplexer2to1	b2v_inst19(
	.inp_mux0(SYNTHESIZED_WIRE_43),
	.inp_mux1(SYNTHESIZED_WIRE_40),
	.select(SYNTHESIZED_WIRE_19),
	.out_mux(SYNTHESIZED_WIRE_34));
	defparam	b2v_inst19.W = 32;


adder	b2v_inst2(
	.inp_adder_data_0(SYNTHESIZED_WIRE_20),
	.inp_adder_data_1(SYNTHESIZED_WIRE_44),
	.out_adder(SYNTHESIZED_WIRE_35));
	defparam	b2v_inst2.W = 32;


controller	b2v_inst20(
	.clk(clk),
	.carry_out_flag(SYNTHESIZED_WIRE_22),
	.overflow_flag(SYNTHESIZED_WIRE_23),
	.negative_flag(SYNTHESIZED_WIRE_24),
	.zero_flag(SYNTHESIZED_WIRE_25),
	.Cond(inst[31:28]),
	.Func(inst[25:20]),
	.inst_19_to_4_BX(inst[19:4]),
	.Op(inst[27:26]),
	.Rd(inst[15:12]),
	.PCSrc(SYNTHESIZED_WIRE_38),
	.RegWrite(SYNTHESIZED_WIRE_30),
	.MemWrite(SYNTHESIZED_WIRE_11),
	.MemToReg(SYNTHESIZED_WIRE_16),
	.AluSrc_Branch_Absolute_Mux_Sel(SYNTHESIZED_WIRE_4),
	.Write_Data_PC_Mux_Sel(SYNTHESIZED_WIRE_19),
	.AluSrc(SYNTHESIZED_WIRE_7),
	.AluControl(SYNTHESIZED_WIRE_10),
	.ImmSrc(SYNTHESIZED_WIRE_29),
	.RegSrc(RegSrc));
	defparam	b2v_inst20.W = 32;




instruction_memory	b2v_inst29(
	.inp_address(SYNTHESIZED_WIRE_45),
	.out_instruction_data(inst));
	defparam	b2v_inst29.Addr_W = 32;
	defparam	b2v_inst29.byte_W = 4;


adder	b2v_inst3(
	.inp_adder_data_0(SYNTHESIZED_WIRE_45),
	.inp_adder_data_1(SYNTHESIZED_WIRE_28),
	.out_adder(SYNTHESIZED_WIRE_44));
	defparam	b2v_inst3.W = 32;


constant_value_generator	b2v_inst4(
	.outVal(SYNTHESIZED_WIRE_28));
	defparam	b2v_inst4.value = 4;
	defparam	b2v_inst4.W = 32;


constant_value_generator	b2v_inst5(
	.outVal(SYNTHESIZED_WIRE_20));
	defparam	b2v_inst5.value = 4;
	defparam	b2v_inst5.W = 32;


extend_immediate	b2v_inst6(
	.ImmSrc(SYNTHESIZED_WIRE_29),
	.instruction(inst),
	.out_ext_imm(SYNTHESIZED_WIRE_6));
	defparam	b2v_inst6.W = 32;


register_file	b2v_inst7(
	.clk(clk),
	.write_enable(SYNTHESIZED_WIRE_30),
	.reset_synchronous(SYNTHESIZED_WIRE_31),
	.inp_read_address0(SYNTHESIZED_WIRE_32),
	.inp_read_address1(SYNTHESIZED_WIRE_33),
	.inp_write_address0(inst[15:12]),
	.inp_write_data(SYNTHESIZED_WIRE_34),
	.inp_write_data_R15(SYNTHESIZED_WIRE_35),
	.out_read_data0(SYNTHESIZED_WIRE_40),
	.out_read_data1(SYNTHESIZED_WIRE_41));
	defparam	b2v_inst7.W = 32;


multiplexer2to1	b2v_inst8(
	.inp_mux0(SYNTHESIZED_WIRE_44),
	.inp_mux1(SYNTHESIZED_WIRE_43),
	.select(SYNTHESIZED_WIRE_38),
	.out_mux(SYNTHESIZED_WIRE_1));
	defparam	b2v_inst8.W = 32;


multiplexer2to1	b2v_inst9(
	.inp_mux0(inst[19:16]),
	.inp_mux1(SYNTHESIZED_WIRE_39),
	.select(RegSrc[0]),
	.out_mux(SYNTHESIZED_WIRE_32));
	defparam	b2v_inst9.W = 4;


endmodule
