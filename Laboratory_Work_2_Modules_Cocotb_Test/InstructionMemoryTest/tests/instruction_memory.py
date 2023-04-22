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
async def instruction_memory(dut):
    await Timer(1, units="us")
    dut.inp_address.value = 0
    await Timer(1, units="us")
    assert dut.out_instruction_data.value == 0x04121000

    dut.inp_address.value = 4
    await Timer(1, units="us")
    assert dut.out_instruction_data.value == 0x04123004

