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
async def register_synchronous_reset(dut):
    #Generate the clock
    await cocotb.start(Clock(dut.clk, 10, 'us').start(start_high=False))
    clkedge = FallingEdge(dut.clk)
    await clkedge # wait until posedge

    #OUTPUT OF THE REGISTER IS EMPTY LOAD WITH A VALUE
    dut.reset_synchronous.value = 0
    inp_value = 10
    dut.inp_reg.value = inp_value
    dut.write_enable = 1
    await clkedge # wait until posedge
    assert dut.out_reg.value == inp_value #check if the module added the values correctly


    # TEST WHETHER SYNC-RESET WORKS OR NOT
    dut.reset_synchronous.value = 1
    await Timer(1, units="us")
    assert dut.out_reg.value != 0 # checks that sync reset is not a combinational
    await clkedge # wait until posedge
    assert dut.out_reg.value == 0 # checks that sync reset is a sequential

    
    # CHECK THAT OUTPUT IS UPDATED AT NEXT POSEDGE
    dut.reset_synchronous.value = 0
    inp_value = 7
    dut.inp_reg.value = inp_value
    dut.write_enable = 1
    await Timer(1, units="us")
    assert dut.out_reg.value != inp_value # check
    await clkedge # wait until posedge
    assert dut.out_reg.value == 7 # check if the module added the values correctly


    # CHECK THAT OUTPUT IS UPDATED AT NEXT POSEDGE
    dut.reset_synchronous.value = 0
    inp_value = 12
    dut.inp_reg.value = inp_value
    dut.write_enable = 0
    await Timer(1, units="us")
    assert dut.out_reg.value != inp_value # check
    await clkedge # wait until posedge
    assert dut.out_reg.value == 7 # check if the module added the values correctly


    inp_value_new = 8
    dut.inp_reg.value = inp_value_new
    dut.write_enable = 1
    await Timer(1, units="us")
    assert dut.out_reg.value != inp_value_new #check
    assert dut.out_reg.value == 7#check
    await clkedge # wait until posedge
    assert dut.out_reg.value == inp_value_new #check if the module added the values correctly