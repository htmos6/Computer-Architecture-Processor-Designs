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
async def data_path_3(dut):
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
    await Timer(1, units="us") # MOV R1, #5
    assert dut.SYNTHESIZED_WIRE_54.value == 0 # PC
    await Timer(1, units="us") # MOV R1, #5
    assert dut.SYNTHESIZED_WIRE_52.value == 0xE3A01007 # PC'
    assert dut.SYNTHESIZED_WIRE_13.value == 1 # IRWrite
    assert dut.SYNTHESIZED_WIRE_50.value == 4



    await clkedge
    await Timer(2, units="us")  # MOV R1, #5 
    assert dut.SYNTHESIZED_WIRE_13.value == 0 # IRWrite
    assert dut.inst.value == 0xE3A01007
    assert dut.SYNTHESIZED_WIRE_54.value == 4  # PC'
    assert dut.SYNTHESIZED_WIRE_33.value == 7  # ext immediate
    assert dut.SYNTHESIZED_WIRE_6.value == 7  # 4to1 mux inp01
    assert dut.SYNTHESIZED_WIRE_37.value == 4 # alu 4to1 mux out, alu srcB
    assert dut.SYNTHESIZED_WIRE_51.value == 8 # alu out
    
    await clkedge # execute1
    await Timer(2, units="us")  # MOV R1, #5
    assert dut.SYNTHESIZED_WIRE_51.value == 7 # alu out
    assert dut.SYNTHESIZED_WIRE_50.value == 7 # 4to1 mux out result src
    assert dut.SYNTHESIZED_WIRE_50.value == 7 # 4to1 mux out write data
    assert dut.SYNTHESIZED_WIRE_37.value == 7 # alu 4to1 mux out, alu srcB
    assert dut.SYNTHESIZED_WIRE_51.value == 7 # alu out

    await clkedge # Write data at the input of the reg file. When this clock hits, data written to the register
    # it is at state 0 now

    await clkedge
    await Timer(2, units="us")  # MOV R1, #5
    assert dut.SYNTHESIZED_WIRE_52.value == 0xE3A030FF # PC'

    await clkedge
    await clkedge
    await clkedge
    await clkedge
    await clkedge
    await clkedge
    await clkedge
    await clkedge
    await clkedge
    await clkedge
    await clkedge
    await clkedge
    await clkedge #16
    await clkedge
    await clkedge
    await clkedge
    await clkedge # 20
    assert dut.SYNTHESIZED_WIRE_50.value == 0xF9 # Write data for regisetr file 2's complement of R7

    



  




    










    





