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
// CREATED		"Mon May 08 10:25:04 2023"

module data_path_3(
	clk,
	reg_reset,
	alu_out,
	rd0,
	rd1
);


input wire	clk;
input wire	reg_reset;
output wire	[31:0] alu_out;
output wire	[31:0] rd0;
output wire	[31:0] rd1;

wire	[31:0] inst;
wire	[1:0] reg_src;
wire	SYNTHESIZED_WIRE_0;
wire	[3:0] SYNTHESIZED_WIRE_1;
wire	[3:0] SYNTHESIZED_WIRE_2;
wire	[31:0] SYNTHESIZED_WIRE_50;
wire	[31:0] SYNTHESIZED_WIRE_5;
wire	[31:0] SYNTHESIZED_WIRE_6;
wire	[31:0] SYNTHESIZED_WIRE_7;
wire	[1:0] SYNTHESIZED_WIRE_8;
wire	[31:0] SYNTHESIZED_WIRE_9;
wire	[31:0] SYNTHESIZED_WIRE_10;
wire	[31:0] SYNTHESIZED_WIRE_51;
wire	[1:0] SYNTHESIZED_WIRE_12;
wire	SYNTHESIZED_WIRE_13;
wire	SYNTHESIZED_WIRE_14;
wire	[31:0] SYNTHESIZED_WIRE_52;
wire	SYNTHESIZED_WIRE_16;
wire	SYNTHESIZED_WIRE_18;
wire	SYNTHESIZED_WIRE_20;
wire	[31:0] SYNTHESIZED_WIRE_21;
wire	SYNTHESIZED_WIRE_22;
wire	[31:0] SYNTHESIZED_WIRE_23;
wire	SYNTHESIZED_WIRE_24;
wire	[1:0] SYNTHESIZED_WIRE_25;
wire	SYNTHESIZED_WIRE_26;
wire	SYNTHESIZED_WIRE_27;
wire	SYNTHESIZED_WIRE_29;
wire	SYNTHESIZED_WIRE_30;
wire	[31:0] SYNTHESIZED_WIRE_31;
wire	[31:0] SYNTHESIZED_WIRE_53;
wire	[31:0] SYNTHESIZED_WIRE_33;
wire	[0:0] SYNTHESIZED_WIRE_35;
wire	[31:0] SYNTHESIZED_WIRE_36;
wire	[31:0] SYNTHESIZED_WIRE_37;
wire	[3:0] SYNTHESIZED_WIRE_38;
wire	SYNTHESIZED_WIRE_39;
wire	SYNTHESIZED_WIRE_40;
wire	SYNTHESIZED_WIRE_41;
wire	SYNTHESIZED_WIRE_42;
wire	[31:0] SYNTHESIZED_WIRE_54;
wire	SYNTHESIZED_WIRE_45;
wire	[3:0] SYNTHESIZED_WIRE_46;
wire	[31:0] SYNTHESIZED_WIRE_47;
wire	SYNTHESIZED_WIRE_49;

assign	alu_out = SYNTHESIZED_WIRE_51;
assign	rd0 = SYNTHESIZED_WIRE_21;
assign	rd1 = SYNTHESIZED_WIRE_23;
assign	SYNTHESIZED_WIRE_14 = 0;
assign	SYNTHESIZED_WIRE_16 = 0;
assign	SYNTHESIZED_WIRE_18 = 0;
assign	SYNTHESIZED_WIRE_20 = 0;
assign	SYNTHESIZED_WIRE_22 = 0;
assign	SYNTHESIZED_WIRE_24 = 0;
assign	SYNTHESIZED_WIRE_27 = 0;
assign	SYNTHESIZED_WIRE_29 = 0;




register_file	b2v_inst1(
	.clk(clk),
	.write_enable(SYNTHESIZED_WIRE_0),
	.reset_synchronous(reg_reset),
	.inp_read_address0(SYNTHESIZED_WIRE_1),
	.inp_read_address1(SYNTHESIZED_WIRE_2),
	.inp_write_address0(inst[15:12]),
	.inp_write_data(SYNTHESIZED_WIRE_50),
	.inp_write_data_R15(SYNTHESIZED_WIRE_50),
	.out_read_data0(SYNTHESIZED_WIRE_21),
	.out_read_data1(SYNTHESIZED_WIRE_23));
	defparam	b2v_inst1.W = 32;


multiplexer4to1	b2v_inst10(
	.inp_mux0(SYNTHESIZED_WIRE_5),
	.inp_mux1(SYNTHESIZED_WIRE_6),
	.inp_mux2(SYNTHESIZED_WIRE_7),
	
	.select(SYNTHESIZED_WIRE_8),
	.out_mux(SYNTHESIZED_WIRE_37));
	defparam	b2v_inst10.W = 32;


multiplexer4to1	b2v_inst11(
	.inp_mux0(SYNTHESIZED_WIRE_9),
	.inp_mux1(SYNTHESIZED_WIRE_10),
	.inp_mux2(SYNTHESIZED_WIRE_51),
	
	.select(SYNTHESIZED_WIRE_12),
	.out_mux(SYNTHESIZED_WIRE_50));
	defparam	b2v_inst11.W = 32;


register_synchronous_reset_write_en	b2v_inst12(
	.clk(clk),
	.write_enable(SYNTHESIZED_WIRE_13),
	.reset_synchronous(SYNTHESIZED_WIRE_14),
	.inp_reg(SYNTHESIZED_WIRE_52),
	.out_reg(inst));
	defparam	b2v_inst12.W = 32;


register_synchronous_reset	b2v_inst15(
	.clk(clk),
	.reset_synchronous(SYNTHESIZED_WIRE_16),
	.inp_reg(SYNTHESIZED_WIRE_52),
	.out_reg(SYNTHESIZED_WIRE_10));
	defparam	b2v_inst15.W = 32;


register_synchronous_reset	b2v_inst16(
	.clk(clk),
	.reset_synchronous(SYNTHESIZED_WIRE_18),
	.inp_reg(SYNTHESIZED_WIRE_51),
	.out_reg(SYNTHESIZED_WIRE_9));
	defparam	b2v_inst16.W = 32;


register_synchronous_reset	b2v_inst17(
	.clk(clk),
	.reset_synchronous(SYNTHESIZED_WIRE_20),
	.inp_reg(SYNTHESIZED_WIRE_21),
	.out_reg(SYNTHESIZED_WIRE_47));
	defparam	b2v_inst17.W = 32;


register_synchronous_reset	b2v_inst18(
	.clk(clk),
	.reset_synchronous(SYNTHESIZED_WIRE_22),
	.inp_reg(SYNTHESIZED_WIRE_23),
	.out_reg(SYNTHESIZED_WIRE_53));
	defparam	b2v_inst18.W = 32;


constant_value_generator	b2v_inst19(
	.reset_synchronous(SYNTHESIZED_WIRE_24),
	.out_reg(SYNTHESIZED_WIRE_7));
	defparam	b2v_inst19.value = 4;
	defparam	b2v_inst19.W = 32;


extend_immediate	b2v_inst2(
	.ImmSrc(SYNTHESIZED_WIRE_25),
	.instruction(inst),
	.out_ext_imm(SYNTHESIZED_WIRE_33));
	defparam	b2v_inst2.W = 32;


register_synchronous_reset_write_en	b2v_inst21(
	.clk(clk),
	.write_enable(SYNTHESIZED_WIRE_26),
	.reset_synchronous(SYNTHESIZED_WIRE_27),
	.inp_reg(SYNTHESIZED_WIRE_50),
	.out_reg(SYNTHESIZED_WIRE_54));
	defparam	b2v_inst21.W = 32;


constant_value_generator	b2v_inst22(
	.reset_synchronous(SYNTHESIZED_WIRE_29),
	.out_reg(SYNTHESIZED_WIRE_46));
	defparam	b2v_inst22.value = 15;
	defparam	b2v_inst22.W = 4;








memory	b2v_inst3(
	.clk(clk),
	.WE(SYNTHESIZED_WIRE_30),
	.ADDR(SYNTHESIZED_WIRE_31),
	.WD(SYNTHESIZED_WIRE_53),
	.RD(SYNTHESIZED_WIRE_52));
	defparam	b2v_inst3.ADDR_WIDTH = 32;
	defparam	b2v_inst3.BYTE_SIZE = 4;




combinational_shifter	b2v_inst33(
	.control(inst[6:5]),
	.inp_shifter(SYNTHESIZED_WIRE_33),
	.shamt(inst[11:7]),
	.out_shifter(SYNTHESIZED_WIRE_6));
	defparam	b2v_inst33.W = 32;


combinational_shifter	b2v_inst34(
	.control(inst[6:5]),
	.inp_shifter(SYNTHESIZED_WIRE_53),
	.shamt(inst[11:7]),
	.out_shifter(SYNTHESIZED_WIRE_5));
	defparam	b2v_inst34.W = 32;


ALU	b2v_inst4(
	.inp_carry(SYNTHESIZED_WIRE_35),
	.inp_src0(SYNTHESIZED_WIRE_36),
	.inp_src1(SYNTHESIZED_WIRE_37),
	.operation_select(SYNTHESIZED_WIRE_38),
	.carry_out_flag(SYNTHESIZED_WIRE_39),
	.overflow_flag(SYNTHESIZED_WIRE_40),
	.negative_flag(SYNTHESIZED_WIRE_41),
	.zero_flag(SYNTHESIZED_WIRE_42),
	.out_alu(SYNTHESIZED_WIRE_51));
	defparam	b2v_inst4.WIDTH = 32;


controller	b2v_inst56(
	.clk(clk),
	.carry_out_flag(SYNTHESIZED_WIRE_39),
	.overflow_flag(SYNTHESIZED_WIRE_40),
	.negative_flag(SYNTHESIZED_WIRE_41),
	.zero_flag(SYNTHESIZED_WIRE_42),
	.Cond(inst[31:28]),
	.Func(inst[25:20]),
	.inst_19_to_4_BX(inst[19:4]),
	.Op(inst[27:26]),
	.Rd(inst[15:12]),
	.PCWrite(SYNTHESIZED_WIRE_26),
	.RegWrite(SYNTHESIZED_WIRE_0),
	.MemWrite(SYNTHESIZED_WIRE_30),
	.IRWrite(SYNTHESIZED_WIRE_13),
	.AdrSrc(SYNTHESIZED_WIRE_45),
	.AluSrcA(SYNTHESIZED_WIRE_49),
	.AluControl(SYNTHESIZED_WIRE_38),
	.AluSrcB(SYNTHESIZED_WIRE_8),
	.C_flag_reg_out(SYNTHESIZED_WIRE_35),
	.ImmSrc(SYNTHESIZED_WIRE_25),
	.RegSrc(reg_src),
	.ResultSrc(SYNTHESIZED_WIRE_12));
	defparam	b2v_inst56.W = 32;


multiplexer2to1	b2v_inst6(
	.inp_mux0(SYNTHESIZED_WIRE_54),
	.inp_mux1(SYNTHESIZED_WIRE_50),
	.select(SYNTHESIZED_WIRE_45),
	.out_mux(SYNTHESIZED_WIRE_31));
	defparam	b2v_inst6.W = 32;


multiplexer2to1	b2v_inst7(
	.inp_mux0(inst[19:16]),
	.inp_mux1(SYNTHESIZED_WIRE_46),
	.select(reg_src[0]),
	.out_mux(SYNTHESIZED_WIRE_1));
	defparam	b2v_inst7.W = 4;


multiplexer2to1	b2v_inst8(
	.inp_mux0(inst[3:0]),
	.inp_mux1(inst[15:12]),
	.select(reg_src[1]),
	.out_mux(SYNTHESIZED_WIRE_2));
	defparam	b2v_inst8.W = 4;


multiplexer2to1	b2v_inst9(
	.inp_mux0(SYNTHESIZED_WIRE_47),
	.inp_mux1(SYNTHESIZED_WIRE_54),
	.select(SYNTHESIZED_WIRE_49),
	.out_mux(SYNTHESIZED_WIRE_36));
	defparam	b2v_inst9.W = 32;


endmodule
