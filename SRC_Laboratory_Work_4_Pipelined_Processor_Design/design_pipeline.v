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
// CREATED		"Mon May 22 02:25:22 2023"

module design_pipeline(
	RESET_CONTROLLER,
	clk,
	pc_reset
);


input wire	RESET_CONTROLLER;
input wire	clk;
input wire	pc_reset;

wire	CondEx;
wire	[31:0] instruction;
wire	[31:0] rd2e;
wire	[1:0] RegSrcD;
wire	[31:0] SYNTHESIZED_WIRE_0;
wire	[1:0] SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_71;
wire	SYNTHESIZED_WIRE_72;
wire	SYNTHESIZED_WIRE_4;
wire	SYNTHESIZED_WIRE_5;
wire	SYNTHESIZED_WIRE_6;
wire	SYNTHESIZED_WIRE_7;
wire	[31:0] SYNTHESIZED_WIRE_8;
wire	[3:0] SYNTHESIZED_WIRE_9;
wire	[31:0] SYNTHESIZED_WIRE_10;
wire	[31:0] SYNTHESIZED_WIRE_11;
wire	[3:0] SYNTHESIZED_WIRE_12;
wire	[31:0] SYNTHESIZED_WIRE_13;
wire	SYNTHESIZED_WIRE_14;
wire	SYNTHESIZED_WIRE_15;
wire	[31:0] SYNTHESIZED_WIRE_73;
wire	[31:0] SYNTHESIZED_WIRE_17;
wire	SYNTHESIZED_WIRE_19;
wire	SYNTHESIZED_WIRE_20;
wire	SYNTHESIZED_WIRE_21;
wire	[31:0] SYNTHESIZED_WIRE_23;
wire	[3:0] SYNTHESIZED_WIRE_24;
wire	[31:0] SYNTHESIZED_WIRE_25;
wire	[31:0] SYNTHESIZED_WIRE_26;
wire	SYNTHESIZED_WIRE_27;
wire	[31:0] SYNTHESIZED_WIRE_29;
wire	SYNTHESIZED_WIRE_30;
wire	SYNTHESIZED_WIRE_31;
wire	SYNTHESIZED_WIRE_32;
wire	SYNTHESIZED_WIRE_33;
wire	SYNTHESIZED_WIRE_34;
wire	SYNTHESIZED_WIRE_35;
wire	SYNTHESIZED_WIRE_36;
wire	[3:0] SYNTHESIZED_WIRE_37;
wire	[31:0] SYNTHESIZED_WIRE_38;
wire	[3:0] SYNTHESIZED_WIRE_39;
wire	[1:0] SYNTHESIZED_WIRE_40;
wire	[31:0] SYNTHESIZED_WIRE_41;
wire	[31:0] SYNTHESIZED_WIRE_42;
wire	SYNTHESIZED_WIRE_43;
wire	SYNTHESIZED_WIRE_44;
wire	SYNTHESIZED_WIRE_45;
wire	SYNTHESIZED_WIRE_46;
wire	[3:0] SYNTHESIZED_WIRE_47;
wire	[3:0] SYNTHESIZED_WIRE_48;
wire	[1:0] SYNTHESIZED_WIRE_49;
wire	SYNTHESIZED_WIRE_50;
wire	SYNTHESIZED_WIRE_51;
wire	SYNTHESIZED_WIRE_52;
wire	SYNTHESIZED_WIRE_53;
wire	SYNTHESIZED_WIRE_54;
wire	SYNTHESIZED_WIRE_55;
wire	[31:0] SYNTHESIZED_WIRE_74;
wire	[31:0] SYNTHESIZED_WIRE_58;
wire	[31:0] SYNTHESIZED_WIRE_75;
wire	[31:0] SYNTHESIZED_WIRE_76;
wire	SYNTHESIZED_WIRE_61;
wire	SYNTHESIZED_WIRE_62;
wire	[3:0] SYNTHESIZED_WIRE_63;
wire	SYNTHESIZED_WIRE_64;
wire	[3:0] SYNTHESIZED_WIRE_66;
wire	[3:0] SYNTHESIZED_WIRE_67;
wire	[3:0] SYNTHESIZED_WIRE_68;

assign	SYNTHESIZED_WIRE_71 = 0;
assign	SYNTHESIZED_WIRE_72 = 0;
assign	SYNTHESIZED_WIRE_30 = 0;
assign	SYNTHESIZED_WIRE_62 = 0;




controller	b2v_inst(
	.RESET(RESET_CONTROLLER),
	.Func(instruction[25:20]),
	.inst_19_to_4_BX(instruction[19:4]),
	.Op(instruction[27:26]),
	.Rd(instruction[15:12]),
	.PCSrcD(SYNTHESIZED_WIRE_31),
	.BranchD(SYNTHESIZED_WIRE_32),
	.RegWriteD(SYNTHESIZED_WIRE_33),
	.MemWriteD(SYNTHESIZED_WIRE_34),
	.MemtoRegD(SYNTHESIZED_WIRE_35),
	.AluSrcD(SYNTHESIZED_WIRE_36),
	
	.AluControlD(SYNTHESIZED_WIRE_37),
	.FlagWriteD(SYNTHESIZED_WIRE_40),
	.ImmSrcD(SYNTHESIZED_WIRE_1),
	.RegSrcD(RegSrcD));
	defparam	b2v_inst.W = 32;


fetch_pipeline_reg	b2v_inst1(
	.clk(clk),
	.reset_synchronous(pc_reset),
	.pc_prev(SYNTHESIZED_WIRE_0),
	.pc_fetch(SYNTHESIZED_WIRE_74));
	defparam	b2v_inst1.W = 32;


extend_immediate	b2v_inst10(
	.ImmSrc(SYNTHESIZED_WIRE_1),
	.instruction(instruction),
	.out_ext_imm(SYNTHESIZED_WIRE_38));
	defparam	b2v_inst10.W = 32;


constant_value_generator	b2v_inst11(
	.reset_synchronous(SYNTHESIZED_WIRE_71),
	.out_reg(SYNTHESIZED_WIRE_63));
	defparam	b2v_inst11.value = 15;
	defparam	b2v_inst11.W = 4;


memory_pipeline_reg	b2v_inst13(
	.clk(clk),
	.reset_synchronous(SYNTHESIZED_WIRE_72),
	.PCSrcE(SYNTHESIZED_WIRE_4),
	.RegWriteE(SYNTHESIZED_WIRE_5),
	.MemWriteE(SYNTHESIZED_WIRE_6),
	.MemtoRegE(SYNTHESIZED_WIRE_7),
	.AluResultE(SYNTHESIZED_WIRE_8),
	.WA3E(SYNTHESIZED_WIRE_9),
	.WriteDataE(rd2e),
	.PCSrcM(SYNTHESIZED_WIRE_19),
	.RegWriteM(SYNTHESIZED_WIRE_20),
	.MemWriteM(SYNTHESIZED_WIRE_15),
	.MemtoRegM(SYNTHESIZED_WIRE_21),
	.AluResultM(SYNTHESIZED_WIRE_73),
	.WA3M(SYNTHESIZED_WIRE_24),
	.WriteDataM(SYNTHESIZED_WIRE_17));
	defparam	b2v_inst13.W = 32;


ALU	b2v_inst14(
	
	.inp_src0(SYNTHESIZED_WIRE_10),
	.inp_src1(SYNTHESIZED_WIRE_11),
	.operation_select(SYNTHESIZED_WIRE_12),
	.carry_out_flag(SYNTHESIZED_WIRE_43),
	.overflow_flag(SYNTHESIZED_WIRE_44),
	.negative_flag(SYNTHESIZED_WIRE_45),
	.zero_flag(SYNTHESIZED_WIRE_46),
	.out_alu(SYNTHESIZED_WIRE_8));
	defparam	b2v_inst14.WIDTH = 32;


multiplexer2to1	b2v_inst15(
	.inp_mux0(rd2e),
	.inp_mux1(SYNTHESIZED_WIRE_13),
	.select(SYNTHESIZED_WIRE_14),
	.out_mux(SYNTHESIZED_WIRE_11));
	defparam	b2v_inst15.W = 32;


memory	b2v_inst16(
	.clk(clk),
	.WE(SYNTHESIZED_WIRE_15),
	.ADDR(SYNTHESIZED_WIRE_73),
	.WD(SYNTHESIZED_WIRE_17),
	.RD(SYNTHESIZED_WIRE_23));
	defparam	b2v_inst16.ADDR_WIDTH = 32;
	defparam	b2v_inst16.BYTE_SIZE = 4;


write_back_pipeline_reg	b2v_inst17(
	.clk(clk),
	.reset_synchronous(SYNTHESIZED_WIRE_72),
	.PCSrcM(SYNTHESIZED_WIRE_19),
	.RegWriteM(SYNTHESIZED_WIRE_20),
	.MemtoRegM(SYNTHESIZED_WIRE_21),
	.AluResultM(SYNTHESIZED_WIRE_73),
	.RDM(SYNTHESIZED_WIRE_23),
	.WA3M(SYNTHESIZED_WIRE_24),
	.PCSrcW(SYNTHESIZED_WIRE_61),
	.RegWriteW(SYNTHESIZED_WIRE_64),
	.MemtoRegW(SYNTHESIZED_WIRE_27),
	.AluResultW(SYNTHESIZED_WIRE_25),
	.RDW(SYNTHESIZED_WIRE_26),
	.WA3W(SYNTHESIZED_WIRE_68));
	defparam	b2v_inst17.W = 32;


multiplexer2to1	b2v_inst18(
	.inp_mux0(SYNTHESIZED_WIRE_25),
	.inp_mux1(SYNTHESIZED_WIRE_26),
	.select(SYNTHESIZED_WIRE_27),
	.out_mux(SYNTHESIZED_WIRE_76));
	defparam	b2v_inst18.W = 32;


decode_pipeline_reg	b2v_inst2(
	.clk(clk),
	.reset_synchronous(SYNTHESIZED_WIRE_71),
	.inst_fetch(SYNTHESIZED_WIRE_29),
	.inst_decode(instruction));
	defparam	b2v_inst2.W = 32;


execute_pipeline_reg	b2v_inst22(
	.clk(clk),
	.reset_synchronous(SYNTHESIZED_WIRE_30),
	.PCSrcD(SYNTHESIZED_WIRE_31),
	.BranchD(SYNTHESIZED_WIRE_32),
	.RegWriteD(SYNTHESIZED_WIRE_33),
	.MemWriteD(SYNTHESIZED_WIRE_34),
	.MemtoRegD(SYNTHESIZED_WIRE_35),
	.AluSrcD(SYNTHESIZED_WIRE_36),
	.AluControlD(SYNTHESIZED_WIRE_37),
	.CondD(instruction[31:28]),
	.ExtendImmD(SYNTHESIZED_WIRE_38),
	.FlagsD(SYNTHESIZED_WIRE_39),
	.FlagWriteD(SYNTHESIZED_WIRE_40),
	.RD1D(SYNTHESIZED_WIRE_41),
	.RD2D(SYNTHESIZED_WIRE_42),
	.WA3D(instruction[15:12]),
	.PCSrcE(SYNTHESIZED_WIRE_50),
	.BranchE(SYNTHESIZED_WIRE_51),
	.RegWriteE(SYNTHESIZED_WIRE_52),
	.MemWriteE(SYNTHESIZED_WIRE_53),
	.MemtoRegE(SYNTHESIZED_WIRE_7),
	.AluSrcE(SYNTHESIZED_WIRE_14),
	.AluControlE(SYNTHESIZED_WIRE_12),
	.CondE(SYNTHESIZED_WIRE_47),
	.ExtendImmE(SYNTHESIZED_WIRE_13),
	.FlagsE(SYNTHESIZED_WIRE_48),
	.FlagWriteE(SYNTHESIZED_WIRE_49),
	.RD1E(SYNTHESIZED_WIRE_10),
	.RD2E(rd2e),
	.WA3E(SYNTHESIZED_WIRE_9));
	defparam	b2v_inst22.W = 32;


condition_check	b2v_inst23(
	.carry_out_flag(SYNTHESIZED_WIRE_43),
	.overflow_flag(SYNTHESIZED_WIRE_44),
	.negative_flag(SYNTHESIZED_WIRE_45),
	.zero_flag(SYNTHESIZED_WIRE_46),
	.CondE(SYNTHESIZED_WIRE_47),
	.FlagsE(SYNTHESIZED_WIRE_48),
	.FlagWriteE(SYNTHESIZED_WIRE_49),
	.CondEx(CondEx),
	.FlagsD(SYNTHESIZED_WIRE_39));
	defparam	b2v_inst23.W = 32;

assign	SYNTHESIZED_WIRE_55 = CondEx & SYNTHESIZED_WIRE_50;

assign	SYNTHESIZED_WIRE_54 = CondEx & SYNTHESIZED_WIRE_51;

assign	SYNTHESIZED_WIRE_5 = CondEx & SYNTHESIZED_WIRE_52;

assign	SYNTHESIZED_WIRE_6 = CondEx & SYNTHESIZED_WIRE_53;

assign	SYNTHESIZED_WIRE_4 = SYNTHESIZED_WIRE_54 | SYNTHESIZED_WIRE_55;



instruction_memory	b2v_inst3(
	.ADDR(SYNTHESIZED_WIRE_74),
	.RD(SYNTHESIZED_WIRE_29));
	defparam	b2v_inst3.ADDR_WIDTH = 32;
	defparam	b2v_inst3.BYTE_SIZE = 4;





adder	b2v_inst4(
	.inp_adder_data_0(SYNTHESIZED_WIRE_74),
	.inp_adder_data_1(SYNTHESIZED_WIRE_58),
	.out_adder(SYNTHESIZED_WIRE_75));
	defparam	b2v_inst4.W = 32;


multiplexer2to1	b2v_inst5(
	.inp_mux0(SYNTHESIZED_WIRE_75),
	.inp_mux1(SYNTHESIZED_WIRE_76),
	.select(SYNTHESIZED_WIRE_61),
	.out_mux(SYNTHESIZED_WIRE_0));
	defparam	b2v_inst5.W = 32;


constant_value_generator	b2v_inst6(
	.reset_synchronous(SYNTHESIZED_WIRE_62),
	.out_reg(SYNTHESIZED_WIRE_58));
	defparam	b2v_inst6.value = 4;
	defparam	b2v_inst6.W = 32;


multiplexer2to1	b2v_inst7(
	.inp_mux0(instruction[19:16]),
	.inp_mux1(SYNTHESIZED_WIRE_63),
	.select(RegSrcD[0]),
	.out_mux(SYNTHESIZED_WIRE_66));
	defparam	b2v_inst7.W = 4;


multiplexer2to1	b2v_inst8(
	.inp_mux0(instruction[3:0]),
	.inp_mux1(instruction[15:12]),
	.select(RegSrcD[1]),
	.out_mux(SYNTHESIZED_WIRE_67));
	defparam	b2v_inst8.W = 4;


register_file	b2v_inst9(
	.clk(clk),
	.write_enable(SYNTHESIZED_WIRE_64),
	.reset_synchronous(SYNTHESIZED_WIRE_71),
	.inp_read_address0(SYNTHESIZED_WIRE_66),
	.inp_read_address1(SYNTHESIZED_WIRE_67),
	.inp_write_address0(SYNTHESIZED_WIRE_68),
	.inp_write_data(SYNTHESIZED_WIRE_76),
	.inp_write_data_R15(SYNTHESIZED_WIRE_75),
	.out_read_data0(SYNTHESIZED_WIRE_41),
	.out_read_data1(SYNTHESIZED_WIRE_42));
	defparam	b2v_inst9.W = 32;


endmodule
