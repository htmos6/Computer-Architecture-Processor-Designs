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
async def memory(dut):
    #Generate the clock
    await cocotb.start(Clock(dut.clk, 10, 'us').start(start_high=False))
    clkedge = RisingEdge(dut.clk)
    await clkedge # wait until posedge
    await Timer(1, units="us")

    #OUTPUT OF THE REGISTER IS EMPTY LOAD WITH A VALUE
    dut.write_enable.value = 1
    dut.inp_address.value = 250
    dut.inp_data.value = 65536
    await clkedge # wait until posedge
    await Timer(1, units="us")
    dut.write_enable.value = 1
    dut.inp_address.value = 250
    await Timer(1, units="us")
    assert dut.out_read_data.value == 65536 #check if the module added the values correctly


    #OUTPUT OF THE REGISTER IS EMPTY LOAD WITH A VALUE
    dut.write_enable.value = 1
    dut.inp_address.value = 126
    dut.inp_data.value = 256053
    dut.write_enable.value = 1
    await clkedge # wait until posedge
    await Timer(1, units="us")
    assert dut.out_read_data.value == 256053 #check if the module added the values correctly


    # TEST WHETHER SYNC-RESET WORKS OR NOT
    dut.inp_address.value = 250
    dut.write_enable.value = 0
    await Timer(1, units="us")
    assert dut.out_read_data.value == 65536 # checks that sync reset is a sequential

    
    # TEST WHETHER SYNC-RESET WORKS OR NOT
    dut.inp_address.value = 126
    dut.write_enable.value = 0
    await Timer(1, units="us")
    assert dut.out_read_data.value == 256053 # checks that sync reset is a sequential

    

    
  