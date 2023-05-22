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
async def controller(dut):
    # MOV R1, #7
    dut.RESET.value = 0
    dut.Op.value = 0
    dut.Func.value = 58
    dut.Rd.value = 1
    dut.inst_19_to_4_BX.value = 0x01000
    await Timer(2, units="us")

    assert dut.PCSrcD.value == 0
    assert dut.BranchD.value == 0
    assert dut.RegWriteD.value == 1
    assert dut.MemWriteD.value == 0
    assert dut.MemtoRegD.value == 0
    assert dut.AluControlD.value == 0b1101
    assert dut.AluSrcD.value == 1
    assert dut.FlagWriteD.value == 0b10
    assert dut.ImmSrcD.value == 0b00
    assert dut.RESET_OUT.value == 0


    # SUB R3, R3, R1
    dut.RESET.value = 0
    dut.Op.value = 0
    dut.Func.value = 4
    dut.Rd.value = 3
    dut.inst_19_to_4_BX.value = 0x3300
    await Timer(2, units="us")

    assert dut.PCSrcD.value == 0
    assert dut.BranchD.value == 0
    assert dut.RegWriteD.value == 1
    assert dut.MemWriteD.value == 0
    assert dut.MemtoRegD.value == 0
    assert dut.AluControlD.value == 0b0010
    assert dut.AluSrcD.value == 0
    assert dut.FlagWriteD.value == 0b11
    assert dut.RESET_OUT.value == 0

