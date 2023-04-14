import cocotb
from cocotb.triggers import Timer

@cocotb.test()
async def multiplexer2to1(dut):

    dut.inp_mux0.value = 8
    dut.inp_mux1.value = 5

    dut.select.value = 0
    await Timer(1, units="us")
    # Check that the output is equal to the initial value
    assert dut.out_mux.value == 8


    dut.select.value = 1
    await Timer(1, units="us")
    # Set the value parameter to a non-zero value
    assert dut.out_mux.value == 5


