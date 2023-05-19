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
    #Generate the clock
    await cocotb.start(Clock(dut.clk, 10, 'us').start(start_high=False))
    clkedge = RisingEdge(dut.clk)

    dut.Cond.value = 14
    dut.Op.value = 0
    dut.Func.value = 58
    dut.Rd.value = 1
    dut.inst_19_to_4_BX.value = 0x0100
    dut.carry_out_flag.value = 0
    dut.overflow_flag.value = 0
    dut.negative_flag.value = 0
    dut.zero_flag.value = 0
    dut.reset.value = 0

    await clkedge 
    await Timer(2, units="us")
    """
    assert dut.PCWrite.value == 0
    assert dut.RegWrite.value == 1
    assert dut.MemWrite.value == 0
    assert dut.MemToReg.value == 0
    assert dut.AluSrc_Branch_Absolute_Mux_Sel.value == 1
    assert dut.Write_Data_PC_Mux_Sel.value == 0
    assert dut.AluSrc.value == 0
    assert dut.ImmSrc.value == 0
    assert dut.RegSrc.value == 0
    assert dut.AluControl.value == 0b0100
    """
    

    
    assert dut.PCWrite.value == 1
    assert dut.RegWrite.value == 0
    assert dut.MemWrite.value == 0
    assert dut.IRWrite.value == 1
    assert dut.AdrSrc.value == 0
    assert dut.AluSrcA.value == 1
    assert dut.AluSrcB.value == 2
    assert dut.ResultSrc.value == 2
    assert dut.AluControl.value == 4


    await clkedge 
    await Timer(2, units="us")

