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

    await Timer(1, units="us") # lDR R1, [R2, #0]
    assert dut.SYNTHESIZED_WIRE_1.value == 4 # PC'
    assert dut.SYNTHESIZED_WIRE_49.value == 0 # PC
    assert dut.inst.value == 0xE4121000
    await Timer(2, units="us")
    assert dut.SYNTHESIZED_WIRE_45.value == 0 # Data memory input address
    await Timer(1, units="us")
    assert dut.SYNTHESIZED_WIRE_16.value == 7 # Data memory read out
    await Timer(1, units="us")
    assert dut.SYNTHESIZED_WIRE_38.value == 7 # WRITE data 0
    assert dut.SYNTHESIZED_WIRE_34.value == 1 # Write enable

    

    await clkedge # lDR R3, [R2, #4]
    await Timer(1, units="us")
    assert dut.SYNTHESIZED_WIRE_1.value == 8 # PC'
    assert dut.SYNTHESIZED_WIRE_49.value == 4 # PC
    assert dut.inst.value == 0xE4123004
    await Timer(2, units="us")
    assert dut.SYNTHESIZED_WIRE_45.value == 4 # Data memory input address
    await Timer(1, units="us")
    assert dut.SYNTHESIZED_WIRE_16.value == 0xFFFF # Data memory read out
    await Timer(1, units="us")
    assert dut.SYNTHESIZED_WIRE_38.value == 0xFFFF # WRITE data 0

    """
    await clkedge # ADD R2, R3, R1
    await Timer(1, units="us")
    assert dut.SYNTHESIZED_WIRE_1.value == 12 # PC'
    assert dut.SYNTHESIZED_WIRE_49.value == 8 # PC
    assert dut.inst.value == 0xE0832001
    await Timer(2, units="us")
    #assert dut.inst[15:12].value == 2 # WRITE Address 0
    assert dut.SYNTHESIZED_WIRE_36.value == 3 # READ 0 Reg File address
    assert dut.SYNTHESIZED_WIRE_37.value == 1 # READ 1 Reg File address

    await Timer(1, units="us")

    assert dut.SYNTHESIZED_WIRE_44.value == 5 # READ 0 Reg File
    assert dut.SYNTHESIZED_WIRE_46.value == 7 # READ 1 Reg File
    await Timer(2, units="us")
    assert dut.SYNTHESIZED_WIRE_46.value == 7 # comb shift input
    assert dut.SYNTHESIZED_WIRE_5.value == 7 # comb shift input
    """

    await clkedge # SUB R3, R3, R1 
    await Timer(1, units="us")
    assert dut.SYNTHESIZED_WIRE_1.value == 12 # PC'
    assert dut.SYNTHESIZED_WIRE_49.value == 8 # PC
    assert dut.inst.value == 0xE0433001
    await Timer(2, units="us")
    #assert dut.inst[15:12].value == 2 # WRITE Address 0
    assert dut.SYNTHESIZED_WIRE_36.value == 3 # READ 0 Reg File address
    assert dut.SYNTHESIZED_WIRE_37.value == 1 # READ 1 Reg File address

    await Timer(1, units="us")

    assert dut.SYNTHESIZED_WIRE_44.value == 0xFFFF # READ 0 Reg File
    assert dut.SYNTHESIZED_WIRE_46.value == 7 # READ 1 Reg File
    await Timer(2, units="us")
    assert dut.SYNTHESIZED_WIRE_45.value == 0xFFF8 # READ 1 Reg File

    await clkedge # LDR R7, [R2, #8]
    await Timer(2, units="us")
    assert dut.SYNTHESIZED_WIRE_45.value == 8 # Data memory read out
    assert dut.SYNTHESIZED_WIRE_38.value == 1

    await clkedge # ADD R3, R3, R7
    await Timer(2, units="us")
    assert dut.SYNTHESIZED_WIRE_44.value == 0xFFF8 # READ 0 Reg File
    assert dut.SYNTHESIZED_WIRE_46.value == 1 # READ 1 Reg File
    
    assert dut.SYNTHESIZED_WIRE_38.value == 0xFFF9


    await clkedge # lDR R2, [R2, #12]
    await Timer(1, units="us")
    assert dut.inst.value == 0xE412200C
    await Timer(2, units="us")
    assert dut.SYNTHESIZED_WIRE_45.value == 12 # Data memory input address
    await Timer(1, units="us")
    assert dut.SYNTHESIZED_WIRE_16.value == 16 # Data memory read out
    await Timer(1, units="us")
    assert dut.SYNTHESIZED_WIRE_38.value == 16 # WRITE data 0


    await clkedge # lDR R2, [R2, #12]
    await Timer(1, units="us")
    assert dut.inst.value == 0xE4127000
    await Timer(2, units="us")
    assert dut.SYNTHESIZED_WIRE_45.value == 16 # Data memory input address
    await Timer(1, units="us")
    assert dut.SYNTHESIZED_WIRE_16.value == 4 # Data memory read out
    await Timer(1, units="us")
    assert dut.SYNTHESIZED_WIRE_38.value == 4 # WRITE data 0


    await clkedge # ADD R2, R2, R7
    await Timer(2, units="us")
    assert dut.SYNTHESIZED_WIRE_44.value == 16 # READ 0 Reg File
    assert dut.SYNTHESIZED_WIRE_46.value == 4 # READ 1 Reg File
    assert dut.SYNTHESIZED_WIRE_38.value == 20 # WRITE data 0


    await clkedge # lDR R4, [R2, #0]
    await Timer(1, units="us")
    assert dut.inst.value == 0xE4124000
    await Timer(2, units="us")
    assert dut.SYNTHESIZED_WIRE_45.value == 20 # Data memory input address
    await Timer(1, units="us")
    assert dut.SYNTHESIZED_WIRE_16.value == 3 # Data memory read out
    await Timer(1, units="us")
    assert dut.SYNTHESIZED_WIRE_38.value == 3 # WRITE data 0

    
    await clkedge # ADD R2, R2, R7
    await Timer(2, units="us")
    assert dut.SYNTHESIZED_WIRE_44.value == 20 # READ 0 Reg File
    assert dut.SYNTHESIZED_WIRE_46.value == 4 # READ 1 Reg File
    assert dut.SYNTHESIZED_WIRE_38.value == 24 # WRITE data 0

        
    await clkedge # lDR R8, [R9, #8]
    await Timer(1, units="us")
    assert dut.inst.value == 0xE4198008
    await Timer(2, units="us")
    assert dut.SYNTHESIZED_WIRE_45.value == 8 # Data memory input address
    await Timer(1, units="us")
    assert dut.SYNTHESIZED_WIRE_16.value == 1 # Data memory read out
    await Timer(1, units="us")
    assert dut.SYNTHESIZED_WIRE_38.value == 1 # WRITE data 0

    ######### LOOP 
    await clkedge # lDR R6, [R2, #0]
    await Timer(1, units="us")
    assert dut.inst.value == 0xE4126000
    await Timer(2, units="us")
    assert dut.SYNTHESIZED_WIRE_45.value == 24 # Data memory input address
    await Timer(1, units="us")
    assert dut.SYNTHESIZED_WIRE_16.value == 5 # Data memory read out
    await Timer(1, units="us")
    assert dut.SYNTHESIZED_WIRE_38.value == 5 # WRITE data 0


    await clkedge # ADD R5, R5, R6
    await Timer(2, units="us")
    assert dut.SYNTHESIZED_WIRE_44.value == 0 # READ 0 Reg File
    assert dut.SYNTHESIZED_WIRE_46.value == 5 # READ 1 Reg File
    assert dut.SYNTHESIZED_WIRE_38.value == 5 # WRITE data 0


    await clkedge # ADD R2, R2, R7
    await Timer(2, units="us")
    assert dut.SYNTHESIZED_WIRE_44.value == 24 # READ 0 Reg File
    assert dut.SYNTHESIZED_WIRE_46.value == 4 # READ 1 Reg File
    assert dut.SYNTHESIZED_WIRE_38.value == 28 # WRITE data 0


    await clkedge # SUBS R4, R4, R8
    await Timer(2, units="us")
    assert dut.SYNTHESIZED_WIRE_44.value == 3 # READ 0 Reg File
    assert dut.SYNTHESIZED_WIRE_46.value == 1 # READ 1 Reg File
    assert dut.SYNTHESIZED_WIRE_38.value == 2 # WRITE data 0

    # bne
    await clkedge # lDR R6, [R2, #0]


    ######### LOOP 
    await clkedge # lDR R6, [R2, #0]
    await Timer(1, units="us")
    assert dut.inst.value == 0xE4126000
    await Timer(2, units="us")
    assert dut.SYNTHESIZED_WIRE_45.value == 28 # Data memory input address
    await Timer(1, units="us")
    assert dut.SYNTHESIZED_WIRE_16.value == 7 # Data memory read out
    await Timer(1, units="us")
    assert dut.SYNTHESIZED_WIRE_38.value == 7 # WRITE data 0


    await clkedge # ADD R5, R5, R6
    await Timer(2, units="us")
    assert dut.SYNTHESIZED_WIRE_44.value == 5 # READ 0 Reg File
    assert dut.SYNTHESIZED_WIRE_46.value == 7 # READ 1 Reg File
    assert dut.SYNTHESIZED_WIRE_38.value == 12 # WRITE data 0


    await clkedge # ADD R2, R2, R7
    await Timer(2, units="us")
    assert dut.SYNTHESIZED_WIRE_44.value == 28 # READ 0 Reg File
    assert dut.SYNTHESIZED_WIRE_46.value == 4 # READ 1 Reg File
    assert dut.SYNTHESIZED_WIRE_38.value == 32 # WRITE data 0


    await clkedge # SUBS R4, R4, R8
    await Timer(2, units="us")
    assert dut.SYNTHESIZED_WIRE_44.value == 2 # READ 0 Reg File
    assert dut.SYNTHESIZED_WIRE_46.value == 1 # READ 1 Reg File
    assert dut.SYNTHESIZED_WIRE_38.value == 1 # WRITE data 0
    

    # bne
    await clkedge # lDR R6, [R2, #0]


    ######### LOOP 
    await clkedge # lDR R6, [R2, #0]
    await Timer(1, units="us")
    assert dut.inst.value == 0xE4126000
    await Timer(2, units="us")
    assert dut.SYNTHESIZED_WIRE_45.value == 32 # Data memory input address
    await Timer(1, units="us")
    assert dut.SYNTHESIZED_WIRE_16.value == 9 # Data memory read out
    await Timer(1, units="us")
    assert dut.SYNTHESIZED_WIRE_38.value == 9 # WRITE data 0


    await clkedge # ADD R5, R5, R6
    await Timer(2, units="us")
    assert dut.SYNTHESIZED_WIRE_44.value == 12 # READ 0 Reg File
    assert dut.SYNTHESIZED_WIRE_46.value == 9 # READ 1 Reg File
    assert dut.SYNTHESIZED_WIRE_38.value == 21 # WRITE data 0


    await clkedge # ADD R2, R2, R7
    await Timer(2, units="us")
    assert dut.SYNTHESIZED_WIRE_44.value == 32 # READ 0 Reg File
    assert dut.SYNTHESIZED_WIRE_46.value == 4 # READ 1 Reg File
    assert dut.SYNTHESIZED_WIRE_38.value == 36 # WRITE data 0


    await clkedge # SUBS R4, R4, R8
    await Timer(2, units="us")
    assert dut.SYNTHESIZED_WIRE_44.value == 1 # READ 0 Reg File
    assert dut.SYNTHESIZED_WIRE_46.value == 1 # READ 1 Reg File
    assert dut.SYNTHESIZED_WIRE_38.value == 0 # WRITE data 0
    await Timer(2, units="us")
    assert dut.SYNTHESIZED_WIRE_32.value == 1 # ZERO FLAG is Settled
    assert dut.SYNTHESIZED_WIRE_42.value == 0


    # bne
    await clkedge # BNE loop
    await Timer(1, units="us")
    assert dut.SYNTHESIZED_WIRE_1.value == 64 # PC'
    assert dut.SYNTHESIZED_WIRE_49.value == 60 # PC
    assert dut.inst.value == 0x1A00002C
    assert dut.SYNTHESIZED_WIRE_47.value == 44 # MUX 1
    assert dut.SYNTHESIZED_WIRE_48.value == 64 # MUX 0
    assert dut.SYNTHESIZED_WIRE_42.value == 0


    await clkedge # STR R5, [R2, 0]
    await Timer(2, units="us")
    assert dut.SYNTHESIZED_WIRE_45.value == 36 # DATA MEM INP ADDR
    assert dut.SYNTHESIZED_WIRE_46.value == 21 # DATA MEM WRITE DATA





    










    





