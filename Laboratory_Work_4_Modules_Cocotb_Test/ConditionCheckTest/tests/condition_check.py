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
async def condition_check(dut):

    dut.FlagWriteE.value = 0b10

    dut.carry_out_flag.value = 1
    dut.overflow_flag.value = 0
    dut.negative_flag.value = 1
    dut.zero_flag.value = 0

    dut.FlagsE.value = 0b0101
    dut.CondE.value = 0b0000

    await Timer(2, units="us")


    assert dut.CondEx.value == 1
    assert dut.FlagsD.value == 0b1001

    dut.FlagWriteE.value = 0b11

    dut.carry_out_flag.value = 0
    dut.overflow_flag.value = 0
    dut.negative_flag.value = 1
    dut.zero_flag.value = 0

    dut.FlagsE.value = 0b0101
    dut.CondE.value = 0b0000

    await Timer(2, units="us")

    assert dut.CondEx.value == 0
    assert dut.FlagsD.value == 0b1000


