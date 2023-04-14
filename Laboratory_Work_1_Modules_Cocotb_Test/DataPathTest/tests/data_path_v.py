import random
import cocotb
import warnings
from cocotb.triggers import Timer
from cocotb.clock import Clock
from cocotb.triggers import FallingEdge
from cocotb.triggers import RisingEdge
from cocotb.triggers import Edge
from cocotb.binary import BinaryValue

@cocotb.test()
async def data_path_2_comp(dut):
    #Generate the clock
    await cocotb.start(Clock(dut.input_clk, 10, 'us').start(start_high=False))
    clkedge = RisingEdge(dut.input_clk)
    await clkedge # wait until posedge
    await Timer(1, units="us")

    #OUTPUT OF THE REGISTER IS EMPTY LOAD WITH A VALUE
    #assert dut.out_reg.value == inp_value #check if the module added the values correctly


    dut.inp_alu_carry.value = 0
    dut.task_select.value = 0

    await clkedge # wait until posedge
    await Timer(1, units="us")

    
    dut.inp_alu_carry.value = 0
    dut.task_select.value = 1

    await clkedge # wait until posedge
    await Timer(1, units="us")
    print(dut.SYNTHESIZED_WIRE_6.value)
    assert dut.SYNTHESIZED_WIRE_18.value == 0b01011101


@cocotb.test()
async def data_path_mult_10(dut):
    #Generate the clock
    await cocotb.start(Clock(dut.input_clk, 10, 'us').start(start_high=False))
    clkedge = RisingEdge(dut.input_clk)
    await clkedge # wait until posedge
    await Timer(1, units="us")

    #OUTPUT OF THE REGISTER IS EMPTY LOAD WITH A VALUE
    #assert dut.out_reg.value == inp_value #check if the module added the values correctly


    dut.inp_alu_carry.value = 0
    dut.task_select.value = 2

    await clkedge # wait until posedge
    await Timer(1, units="us")

    
    dut.inp_alu_carry.value = 0
    dut.task_select.value = 3

    await clkedge # wait until posedge
    await Timer(1, units="us")

    dut.inp_alu_carry.value = 0
    dut.task_select.value = 4

    await clkedge # wait until posedge
    await Timer(1, units="us")

    print(dut.SYNTHESIZED_WIRE_6.value)
    assert dut.SYNTHESIZED_WIRE_18.value == 0b01011110



@cocotb.test()
async def data_path_copy_4_bit(dut):
    #Generate the clock
    await cocotb.start(Clock(dut.input_clk, 10, 'us').start(start_high=False))
    clkedge = RisingEdge(dut.input_clk)
    await clkedge # wait until posedge
    await Timer(1, units="us")

    #OUTPUT OF THE REGISTER IS EMPTY LOAD WITH A VALUE
    #assert dut.out_reg.value == inp_value #check if the module added the values correctly


    dut.inp_alu_carry.value = 0
    dut.task_select.value = 5

    await clkedge # wait until posedge
    await Timer(1, units="us")

    
    dut.inp_alu_carry.value = 0
    dut.task_select.value = 6

    await clkedge # wait until posedge
    await Timer(1, units="us")

    dut.inp_alu_carry.value = 0
    dut.task_select.value = 7

    await clkedge # wait until posedge
    await Timer(1, units="us")

    print(dut.SYNTHESIZED_WIRE_6.value)
    assert dut.SYNTHESIZED_WIRE_18.value == 0b10101010

