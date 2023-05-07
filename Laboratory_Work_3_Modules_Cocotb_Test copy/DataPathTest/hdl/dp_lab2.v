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
// CREATED		"Mon Apr 24 01:50:25 2023"

module dp_lab2(
	clk,
	reg_reset
);


input wire	clk;
input wire	reg_reset;

wire	[31:0] inst;
wire	[1:0] RegSrc;
wire	SYNTHESIZED_WIRE_0;
wire	[31:0] SYNTHESIZED_WIRE_1;
wire	[0:31] SYNTHESIZED_WIRE_2;
wire	[31:0] SYNTHESIZED_WIRE_44;
wire	SYNTHESIZED_WIRE_4;
wire	[31:0] SYNTHESIZED_WIRE_5;
wire	[31:0] SYNTHESIZED_WIRE_6;
wire	SYNTHESIZED_WIRE_7;
wire	[0:0] SYNTHESIZED_WIRE_8;
wire	[31:0] SYNTHESIZED_WIRE_9;
wire	[31:0] SYNTHESIZED_WIRE_10;
wire	[3:0] SYNTHESIZED_WIRE_11;
wire	SYNTHESIZED_WIRE_12;
wire	[31:0] SYNTHESIZED_WIRE_45;
wire	[31:0] SYNTHESIZED_WIRE_46;
wire	[31:0] SYNTHESIZED_WIRE_16;
wire	SYNTHESIZED_WIRE_17;
wire	SYNTHESIZED_WIRE_18;
wire	[31:0] SYNTHESIZED_WIRE_47;
wire	SYNTHESIZED_WIRE_21;
wire	[31:0] SYNTHESIZED_WIRE_22;
wire	[31:0] SYNTHESIZED_WIRE_48;
wire	SYNTHESIZED_WIRE_24;
wire	[31:0] SYNTHESIZED_WIRE_49;
wire	[31:0] SYNTHESIZED_WIRE_27;
wire	SYNTHESIZED_WIRE_28;
wire	SYNTHESIZED_WIRE_29;
wire	SYNTHESIZED_WIRE_30;
wire	SYNTHESIZED_WIRE_31;
wire	SYNTHESIZED_WIRE_32;
wire	[1:0] SYNTHESIZED_WIRE_34;
wire	SYNTHESIZED_WIRE_35;
wire	[3:0] SYNTHESIZED_WIRE_36;
wire	[3:0] SYNTHESIZED_WIRE_37;
wire	[31:0] SYNTHESIZED_WIRE_38;
wire	[31:0] SYNTHESIZED_WIRE_39;
wire	SYNTHESIZED_WIRE_42;
wire	[3:0] SYNTHESIZED_WIRE_43;

assign	SYNTHESIZED_WIRE_0 = 0;
assign	SYNTHESIZED_WIRE_2 = 0;
assign	SYNTHESIZED_WIRE_18 = 0;
assign	SYNTHESIZED_WIRE_24 = 0;
assign	SYNTHESIZED_WIRE_28 = 0;




program_counter	b2v_inst1(
	.clk(clk),
	.reset_synchronous(SYNTHESIZED_WIRE_0),
	.inp_reg(SYNTHESIZED_WIRE_1),
	.out_reg(SYNTHESIZED_WIRE_49));
	defparam	b2v_inst1.W = 32;


multiplexer2to1	b2v_inst10(
	.inp_mux0(inst[3:0]),
	.inp_mux1(inst[15:12]),
	.select(RegSrc[1]),
	.out_mux(SYNTHESIZED_WIRE_37));
	defparam	b2v_inst10.W = 4;


multiplexer2to1	b2v_inst12(
	.inp_mux0(SYNTHESIZED_WIRE_2),
	.inp_mux1(SYNTHESIZED_WIRE_44),
	.select(SYNTHESIZED_WIRE_4),
	.out_mux(SYNTHESIZED_WIRE_9));
	defparam	b2v_inst12.W = 32;



multiplexer2to1	b2v_inst14(
	.inp_mux0(SYNTHESIZED_WIRE_5),
	.inp_mux1(SYNTHESIZED_WIRE_6),
	.select(SYNTHESIZED_WIRE_7),
	.out_mux(SYNTHESIZED_WIRE_10));
	defparam	b2v_inst14.W = 32;


ALU	b2v_inst15(
	.inp_carry(SYNTHESIZED_WIRE_8),
	.inp_src0(SYNTHESIZED_WIRE_9),
	.inp_src1(SYNTHESIZED_WIRE_10),
	.operation_select(SYNTHESIZED_WIRE_11),
	.carry_out_flag(SYNTHESIZED_WIRE_29),
	.overflow_flag(SYNTHESIZED_WIRE_30),
	.negative_flag(SYNTHESIZED_WIRE_31),
	.zero_flag(SYNTHESIZED_WIRE_32),
	.out_alu(SYNTHESIZED_WIRE_45));
	defparam	b2v_inst15.WIDTH = 32;


data_memory	b2v_inst16(
	.clk(clk),
	.write_enable(SYNTHESIZED_WIRE_12),
	.inp_address(SYNTHESIZED_WIRE_45),
	.inp_data(SYNTHESIZED_WIRE_46),
	.out_read_data(SYNTHESIZED_WIRE_16));
	defparam	b2v_inst16.Addr_W = 32;
	defparam	b2v_inst16.byte_W = 4;


multiplexer2to1	b2v_inst17(
	.inp_mux0(SYNTHESIZED_WIRE_45),
	.inp_mux1(SYNTHESIZED_WIRE_16),
	.select(SYNTHESIZED_WIRE_17),
	.out_mux(SYNTHESIZED_WIRE_47));
	defparam	b2v_inst17.W = 32;


constant_value_generator	b2v_inst18(
	.reset_synchronous(SYNTHESIZED_WIRE_18),
	.out_reg(SYNTHESIZED_WIRE_27));
	defparam	b2v_inst18.value = 4;
	defparam	b2v_inst18.W = 32;


multiplexer2to1	b2v_inst19(
	.inp_mux0(SYNTHESIZED_WIRE_47),
	.inp_mux1(SYNTHESIZED_WIRE_44),
	.select(SYNTHESIZED_WIRE_21),
	.out_mux(SYNTHESIZED_WIRE_38));
	defparam	b2v_inst19.W = 32;


adder	b2v_inst2(
	.inp_adder_data_0(SYNTHESIZED_WIRE_22),
	.inp_adder_data_1(SYNTHESIZED_WIRE_48),
	.out_adder(SYNTHESIZED_WIRE_39));
	defparam	b2v_inst2.W = 32;




constant_value_generator	b2v_inst23(
	.reset_synchronous(SYNTHESIZED_WIRE_24),
	.out_reg(SYNTHESIZED_WIRE_43));
	defparam	b2v_inst23.value = 15;
	defparam	b2v_inst23.W = 4;



instruction_memory	b2v_inst29(
	.inp_address(SYNTHESIZED_WIRE_49),
	.out_instruction_data(inst));
	defparam	b2v_inst29.Addr_W = 32;
	defparam	b2v_inst29.byte_W = 4;


adder	b2v_inst3(
	.inp_adder_data_0(SYNTHESIZED_WIRE_49),
	.inp_adder_data_1(SYNTHESIZED_WIRE_27),
	.out_adder(SYNTHESIZED_WIRE_48));
	defparam	b2v_inst3.W = 32;


constant_value_generator	b2v_inst30(
	.reset_synchronous(SYNTHESIZED_WIRE_28),
	.out_reg(SYNTHESIZED_WIRE_22));
	defparam	b2v_inst30.value = 4;
	defparam	b2v_inst30.W = 32;


controller	b2v_inst35(
	.clk(clk),
	.carry_out_flag(SYNTHESIZED_WIRE_29),
	.overflow_flag(SYNTHESIZED_WIRE_30),
	.negative_flag(SYNTHESIZED_WIRE_31),
	.zero_flag(SYNTHESIZED_WIRE_32),
	.Cond(inst[31:28]),
	.Func(inst[25:20]),
	.inst_19_to_4_BX(inst[19:4]),
	.Op(inst[27:26]),
	.Rd(inst[15:12]),
	.PCSrc(SYNTHESIZED_WIRE_42),
	.RegWrite(SYNTHESIZED_WIRE_35),
	.MemWrite(SYNTHESIZED_WIRE_12),
	.MemToReg(SYNTHESIZED_WIRE_17),
	.AluSrc_Branch_Absolute_Mux_Sel(SYNTHESIZED_WIRE_4),
	.Write_Data_PC_Mux_Sel(SYNTHESIZED_WIRE_21),
	.AluSrc(SYNTHESIZED_WIRE_7),
	.AluControl(SYNTHESIZED_WIRE_11),
	.C_flag_reg_out(SYNTHESIZED_WIRE_8),
	.ImmSrc(SYNTHESIZED_WIRE_34),
	.RegSrc(RegSrc));
	defparam	b2v_inst35.W = 32;


combinational_shifter	b2v_inst36(
	.control(inst[6:5]),
	.inp_shifter(SYNTHESIZED_WIRE_46),
	.shamt(inst[11:7]),
	.out_shifter(SYNTHESIZED_WIRE_5));
	defparam	b2v_inst36.W = 32;



extend_immediate	b2v_inst6(
	.ImmSrc(SYNTHESIZED_WIRE_34),
	.instruction(inst),
	.out_ext_imm(SYNTHESIZED_WIRE_6));
	defparam	b2v_inst6.W = 32;


register_file	b2v_inst7(
	.clk(clk),
	.write_enable(SYNTHESIZED_WIRE_35),
	.reset_synchronous(reg_reset),
	.inp_read_address0(SYNTHESIZED_WIRE_36),
	.inp_read_address1(SYNTHESIZED_WIRE_37),
	.inp_write_address0(inst[15:12]),
	.inp_write_data(SYNTHESIZED_WIRE_38),
	.inp_write_data_R15(SYNTHESIZED_WIRE_39),
	.out_read_data0(SYNTHESIZED_WIRE_44),
	.out_read_data1(SYNTHESIZED_WIRE_46));
	defparam	b2v_inst7.W = 32;


multiplexer2to1	b2v_inst8(
	.inp_mux0(SYNTHESIZED_WIRE_48),
	.inp_mux1(SYNTHESIZED_WIRE_47),
	.select(SYNTHESIZED_WIRE_42),
	.out_mux(SYNTHESIZED_WIRE_1));
	defparam	b2v_inst8.W = 32;


multiplexer2to1	b2v_inst9(
	.inp_mux0(inst[19:16]),
	.inp_mux1(SYNTHESIZED_WIRE_43),
	.select(RegSrc[0]),
	.out_mux(SYNTHESIZED_WIRE_36));
	defparam	b2v_inst9.W = 4;


endmodule
