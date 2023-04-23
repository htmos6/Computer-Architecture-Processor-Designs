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
    await cocotb.start(Clock(dut.clk, 20, 'us').start(start_high=False))
    clkedge = RisingEdge(dut.clk)

    """
    await Timer(1, units="us")
    assert dut.SYNTHESIZED_WIRE_47.value == 0 # PC
    assert dut.SYNTHESIZED_WIRE_30.value == 4 # CONSTANT VALUE GENERATOR
    await Timer(1, units="us")
    assert dut.inst.value == 0xE4121000


    await clkedge # ADD R1, [R2, #0]
    """
    dut.reg_reset.value = 0

    await Timer(1, units="us") # lDR R1, [R2, #0]
    assert dut.SYNTHESIZED_WIRE_1.value == 4 # PC'
    assert dut.SYNTHESIZED_WIRE_47.value == 0 # PC
    assert dut.inst.value == 0xE4121000
    await Timer(2, units="us")
    assert dut.SYNTHESIZED_WIRE_44.value == 0 # Data memory input address
    await Timer(1, units="us")
    assert dut.SYNTHESIZED_WIRE_15.value == 7 # Data memory read out
    await Timer(1, units="us")
    assert dut.SYNTHESIZED_WIRE_36.value == 7 # WRITE data 0
    assert dut.SYNTHESIZED_WIRE_33.value == 1 # Write enable

    

    await clkedge # lDR R3, [R2, #4]
    await Timer(1, units="us")
    assert dut.SYNTHESIZED_WIRE_1.value == 8 # PC'
    assert dut.SYNTHESIZED_WIRE_47.value == 4 # PC
    assert dut.inst.value == 0xE4123004
    await Timer(2, units="us")
    assert dut.SYNTHESIZED_WIRE_44.value == 4 # Data memory input address
    await Timer(1, units="us")
    assert dut.SYNTHESIZED_WIRE_15.value == 5 # Data memory read out
    await Timer(1, units="us")
    assert dut.SYNTHESIZED_WIRE_36.value == 5 # WRITE data 0

    await clkedge # ADD R2, R3, R1
    await Timer(1, units="us")
    assert dut.SYNTHESIZED_WIRE_1.value == 12 # PC'
    assert dut.SYNTHESIZED_WIRE_47.value == 8 # PC
    assert dut.inst.value == 0xE0832101
    await Timer(2, units="us")
    #assert dut.inst[15:12].value == 2 # WRITE Address 0
    assert dut.SYNTHESIZED_WIRE_34.value == 3 # READ 0 Reg File
    assert dut.SYNTHESIZED_WIRE_35.value == 1 # READ 1 Reg File

    await Timer(1, units="us")

    assert dut.SYNTHESIZED_WIRE_42.value == 5 # READ 0 Reg File
    assert dut.SYNTHESIZED_WIRE_43.value == 7 # READ 1 Reg File
    await Timer(1, units="us")
    assert dut.SYNTHESIZED_WIRE_36.value == 12 # WRITE Data




