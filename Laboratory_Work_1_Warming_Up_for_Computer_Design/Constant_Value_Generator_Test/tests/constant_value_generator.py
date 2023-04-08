import cocotb
from cocotb.triggers import Timer

@cocotb.test()
async def constant_value_generator_test(dut):
    # Reset the dut
    dut.value.value <= 0
    await Timer(1, units='us')

    # Check that the output is equal to the initial value
    assert dut.outVal.value == 0

    # Set the value parameter to a non-zero value
    dut.value.value = 5


