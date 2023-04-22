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
async def constant_value_generator(dut):
    await Timer(1, units="us")

    #OUTPUT OF THE REGISTER IS EMPTY LOAD WITH A VALUE
    dut.reset_synchronous.value = 0
    await Timer(1, units="us")
    assert dut.out_reg.value == 5 #check if the module added the values correctly

