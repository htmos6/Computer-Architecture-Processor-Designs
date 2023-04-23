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
async def register_file(dut):
    #Generate the clock
    await cocotb.start(Clock(dut.clk, 10, 'us').start(start_high=False))
    clkedge = RisingEdge(dut.clk)
    await clkedge # wait until posedge
    await Timer(1, units="us")
    
    # assert dut.out_reg.value == inp_value #check if the module added the values correctly
    
    dut.reset_synchronous = 0

    lst_values = list()
    
    # Sequential Write operation
    for i in range(15):
        inp_val = random.randint(1, 500)
        lst_values.append(inp_val)
        
        dut.write_enable.value = 1
        dut.inp_write_address0.value = i
        dut.inp_write_data.value = inp_val
        await clkedge # wait until posedge
        await Timer(1, units="us")

        dut.inp_read_address0.value = i
        dut.inp_read_address1.value = i
        await Timer(1, units="us")

        assert dut.out_read_data0.value == inp_val
        assert dut.out_read_data1.value == inp_val

    # Combinational read
    for i in range(14):
        dut.inp_read_address0.value = i
        dut.inp_read_address1.value = i+1
        await Timer(1, units="us")

        assert dut.out_read_data0.value == lst_values[i]
        assert dut.out_read_data1.value == lst_values[i+1]

    # Write Enable Test
    dut.write_enable.value = 0
    dut.inp_write_address0.value = 12
    dut.inp_write_data.value = 346
    await clkedge # wait until posedge
    await Timer(1, units="us")

    dut.inp_read_address0.value = 12
    dut.inp_read_address1.value = 12
    await Timer(1, units="us")

    assert dut.out_read_data0.value != 346
    assert dut.out_read_data1.value != 346

    assert dut.out_read_data0.value == lst_values[12]
    assert dut.out_read_data1.value == lst_values[12]

    # Sync Reset Test
    dut.reset_synchronous.value = 1
    await clkedge # wait until posedge
    for i in range(15):
        dut.inp_read_address0.value = i
        dut.inp_read_address1.value = i
        await Timer(1, units="us")

        assert dut.out_read_data0.value == 0
        assert dut.out_read_data1.value == 0