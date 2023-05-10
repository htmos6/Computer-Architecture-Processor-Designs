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
    await cocotb.start(Clock(dut.clk, 10, 'us').start(start_high=False))
    clkedge = RisingEdge(dut.clk)

    """
    await Timer(1, units="us")
    assert dut.SYNTHESIZED_WIRE_47.value == 0 # PC
    assert dut.SYNTHESIZED_WIRE_30.value == 4 # CONSTANT VALUE GENERATOR
    await Timer(1, units="us")
    assert dut.inst.value == 0xE4121000


    await clkedge # ADD R1, [R2, #0]
    """
    dut.reset_controller.value = 0
    dut.reg_reset.value = 0
    
    await clkedge
    await Timer(2, units="us") # MOV R1, #5
    assert dut.SYNTHESIZED_WIRE_52.value == 0 # PC
    assert dut.SYNTHESIZED_WIRE_51.value == 0xE3A01007 # inst
    assert dut.SYNTHESIZED_WIRE_13.value == 1 # IRWrite
    assert dut.SYNTHESIZED_WIRE_47.value == 1 # srcA mux
    assert dut.SYNTHESIZED_WIRE_8.value == 2 # srcb mux
    assert dut.SYNTHESIZED_WIRE_50.value == 4 # pc'
    assert dut.SYNTHESIZED_WIRE_50.value == 4 # alu result
    assert dut.SYNTHESIZED_WIRE_12.value == 2 # alu result
    assert dut.SYNTHESIZED_WIRE_26.value == 1 # pcwrite

    assert dut.SYNTHESIZED_WIRE_40.value == 0 # c
    assert dut.SYNTHESIZED_WIRE_41.value == 0 # o
    assert dut.SYNTHESIZED_WIRE_42.value == 0 # n
    assert dut.SYNTHESIZED_WIRE_43.value == 0 # z




    await clkedge
    await Timer(2, units="us")  # MOV R1, #5 
    assert dut.SYNTHESIZED_WIRE_13.value == 0 # IRWrite
    assert dut.inst.value == 0xE3A01007
    assert dut.SYNTHESIZED_WIRE_52.value == 4  # PC
    assert dut.SYNTHESIZED_WIRE_6.value == 7  # ext immediate
    assert dut.SYNTHESIZED_WIRE_6.value == 7  # 4to1 mux inp01
    assert dut.SYNTHESIZED_WIRE_35.value == 4 # alu 4to1 mux out, alu srcB
    assert dut.SYNTHESIZED_WIRE_50.value == 8 # alu out
    
    await clkedge # execute1
    await Timer(2, units="us")  # MOV R1, #5
    assert dut.SYNTHESIZED_WIRE_48.value == 7 # alu out

    assert dut.SYNTHESIZED_WIRE_35.value == 7 # alu 4to1 mux out, alu srcB
    assert dut.SYNTHESIZED_WIRE_50.value == 7 # alu out

    await clkedge # Write data at the input of the reg file. When this clock hits, data written to the register
    # it is at state 0 now
    await Timer(2, units="us")  # MOV R1, #5
    assert dut.SYNTHESIZED_WIRE_0.value == 1
    assert dut.SYNTHESIZED_WIRE_48.value == 7 # 4to1 mux out write data


    await clkedge
    await Timer(2, units="us")  # MOV R1, #5
    assert dut.SYNTHESIZED_WIRE_51.value == 0xE3A030FF # PC'

    #state 0
    assert dut.SYNTHESIZED_WIRE_52.value == 4 # PC
    assert dut.SYNTHESIZED_WIRE_51.value == 0xE3A030FF # inst
    assert dut.SYNTHESIZED_WIRE_13.value == 1 # IRWrite
    assert dut.SYNTHESIZED_WIRE_47.value == 1 # srcA mux
    assert dut.SYNTHESIZED_WIRE_8.value == 2 # srcb mux
    assert dut.SYNTHESIZED_WIRE_50.value == 8 # pc'
    assert dut.SYNTHESIZED_WIRE_50.value == 8 # alu result
    assert dut.SYNTHESIZED_WIRE_12.value == 2 # alu result
    assert dut.SYNTHESIZED_WIRE_26.value == 1 # pcwrite

    assert dut.SYNTHESIZED_WIRE_40.value == 0 # c
    assert dut.SYNTHESIZED_WIRE_41.value == 0 # o
    assert dut.SYNTHESIZED_WIRE_42.value == 0 # n
    assert dut.SYNTHESIZED_WIRE_43.value == 0 # z

    await clkedge
    await Timer(2, units="us")  # MOV R1, #5

    assert dut.SYNTHESIZED_WIRE_13.value == 0 # IRWrite
    assert dut.inst.value == 0xE3A030FF
    assert dut.SYNTHESIZED_WIRE_52.value == 8  # PC'
    assert dut.SYNTHESIZED_WIRE_6.value == 0xFF  # ext immediate
    assert dut.SYNTHESIZED_WIRE_6.value == 0xFF  # 4to1 mux inp01
    assert dut.SYNTHESIZED_WIRE_35.value == 4 # alu 4to1 mux out, alu srcB
    assert dut.SYNTHESIZED_WIRE_50.value == 12 # alu out

    await clkedge # execute1
    await Timer(2, units="us")  # MOV R1, #5
    assert dut.SYNTHESIZED_WIRE_48.value == 0xFF # alu out

    assert dut.SYNTHESIZED_WIRE_35.value == 0xFF # alu 4to1 mux out, alu srcB
    assert dut.SYNTHESIZED_WIRE_50.value == 0xFF # alu out

    await clkedge # Write data at the input of the reg file. When this clock hits, data written to the register
    # it is at state 0 now cycle 8 
    await Timer(2, units="us")  # MOV R1, #5
    assert dut.SYNTHESIZED_WIRE_0.value == 1
    assert dut.SYNTHESIZED_WIRE_48.value == 0xFF # 4to1 mux out write data


    


    await clkedge
    await Timer(2, units="us")  # MOV R7, #5
    assert dut.SYNTHESIZED_WIRE_51.value == 0xE3A07001 # PC'

    #state 0
    assert dut.SYNTHESIZED_WIRE_52.value == 8 # PC
    assert dut.SYNTHESIZED_WIRE_51.value == 0xE3A07001 # inst
    assert dut.SYNTHESIZED_WIRE_13.value == 1 # IRWrite
    assert dut.SYNTHESIZED_WIRE_47.value == 1 # srcA mux
    assert dut.SYNTHESIZED_WIRE_8.value == 2 # srcb mux
    assert dut.SYNTHESIZED_WIRE_50.value == 12 # pc'
    assert dut.SYNTHESIZED_WIRE_50.value == 12 # alu result
    assert dut.SYNTHESIZED_WIRE_12.value == 2 # alu result
    assert dut.SYNTHESIZED_WIRE_26.value == 1 # pcwrite

    assert dut.SYNTHESIZED_WIRE_40.value == 0 # c
    assert dut.SYNTHESIZED_WIRE_41.value == 0 # o
    assert dut.SYNTHESIZED_WIRE_42.value == 0 # n
    assert dut.SYNTHESIZED_WIRE_43.value == 0 # z

    await clkedge
    await Timer(2, units="us")  # MOV R1, #5

    assert dut.SYNTHESIZED_WIRE_13.value == 0 # IRWrite
    assert dut.inst.value == 0xE3A07001
    assert dut.SYNTHESIZED_WIRE_52.value == 12  # PC'
    assert dut.SYNTHESIZED_WIRE_6.value == 1  # ext immediate
    assert dut.SYNTHESIZED_WIRE_6.value == 1  # 4to1 mux inp01
    assert dut.SYNTHESIZED_WIRE_35.value == 4 # alu 4to1 mux out, alu srcB
    assert dut.SYNTHESIZED_WIRE_50.value == 16 # alu out

    await clkedge # execute1
    await Timer(2, units="us")  # MOV R1, #5
    assert dut.SYNTHESIZED_WIRE_48.value == 1 # alu out

    assert dut.SYNTHESIZED_WIRE_35.value == 1 # alu 4to1 mux out, alu srcB
    assert dut.SYNTHESIZED_WIRE_50.value == 1 # alu out

    await clkedge # Write data at the input of the reg file. When this clock hits, data written to the register
    # it is at state 0 now cycle 12
    await Timer(2, units="us")  # MOV R1, #5
    assert dut.SYNTHESIZED_WIRE_0.value == 1
    assert dut.SYNTHESIZED_WIRE_48.value == 1 # 4to1 mux out write data

    await clkedge


    await clkedge #13
    await Timer(2, units="us")  # MOV R1, #5
    assert dut.SYNTHESIZED_WIRE_51.value == 0xE0833007 # PC'
    assert dut.SYNTHESIZED_WIRE_1.value == 3 #read0
    assert dut.SYNTHESIZED_WIRE_2.value == 7 # read1
    await Timer(2, units="us")  # MOV R1, #5
    assert dut.SYNTHESIZED_WIRE_21.value == 0xFF #read0
    assert dut.SYNTHESIZED_WIRE_23.value == 1 # read1

    await clkedge
    await clkedge
    await clkedge


    await clkedge # Fetch of add
    await Timer(2, units="us")  # MOV R1, #5
    assert dut.SYNTHESIZED_WIRE_51.value == 0xE0433001 # PC'
    assert dut.SYNTHESIZED_WIRE_1.value == 3 #read0
    assert dut.SYNTHESIZED_WIRE_2.value == 7 # read1
    await Timer(2, units="us")  # MOV R1, #5
    assert dut.SYNTHESIZED_WIRE_21.value == 0xFE #read0
    assert dut.SYNTHESIZED_WIRE_23.value == 1 # read1

    await clkedge
    await clkedge



    await clkedge
    await clkedge
    await clkedge #16
    await clkedge
    await Timer(2, units="us")  # MOV R1, #5
    assert dut.SYNTHESIZED_WIRE_48.value == 0xF9 # Write data for regisetr file 2's complement of R7
    await clkedge
    await Timer(2, units="us")  # MOV R1, #5
    assert dut.SYNTHESIZED_WIRE_48.value == 0xF9 # Write data for regisetr file 2's complement of R7
    await clkedge
    await Timer(2, units="us")  # MOV R1, #5
    assert dut.SYNTHESIZED_WIRE_48.value == 0xF9 # Write data for regisetr file 2's complement of R7
    await clkedge # 20

    



  




    










    





