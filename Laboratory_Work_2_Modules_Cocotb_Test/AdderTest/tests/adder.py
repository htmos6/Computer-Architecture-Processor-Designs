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
async def adder(dut):
    #Generate the clock
    dut.inp_adder_data.value = 0x64039842
    await Timer(1, units="us")
    assert dut.out_adder.value == 0x64039846

    dut.inp_adder_data.value = 0xAE39CFEA
    await Timer(1, units="us")
    assert dut.out_adder.value == 0xAE39CFEE