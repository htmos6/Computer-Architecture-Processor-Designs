import cocotb
from cocotb.triggers import Timer
import random
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
async def dp_lab2(dut):
    #Generate the clock
    await cocotb.start(Clock(dut.clk, 10, 'us').start(start_high=False))
    clkedge = RisingEdge(dut.clk)

    dut.reg_reset.value = 1

    await Timer(1, units="us")
    assert dut.SYNTHESIZED_WIRE_47.value == 0
    await Timer(1, units="us")
    assert dut.SYNTHESIZED_WIRE_30.value == 4
    assert dut.inst.value == 0x04121000

    await clkedge
    assert dut.SYNTHESIZED_WIRE_1.value == 4 # PC'
    assert dut.SYNTHESIZED_WIRE_47.value == 0 # PC
    assert dut.inst.value == 0x04121000

    await clkedge
    assert dut.SYNTHESIZED_WIRE_1.value == 8 # PC'
    assert dut.SYNTHESIZED_WIRE_47.value == 4 # PC
    assert dut.inst.value == 0x04123004
    assert dut.SYNTHESIZED_WIRE_36.value == 8

    await clkedge
    assert dut.SYNTHESIZED_WIRE_42.value == 7 # PC'
    assert dut.SYNTHESIZED_WIRE_43.value == 8 # PC'




