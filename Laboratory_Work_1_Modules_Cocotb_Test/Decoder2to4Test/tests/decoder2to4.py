import cocotb
from cocotb.triggers import Timer

@cocotb.test()
async def constant_value_generator_test(dut):
    # Reset the dut
    dut.inp_dec.value = 0b00
    # wait for synchronization
    await Timer(1, units='us')
    # Check that the output is equal to the initial value
    assert dut.out_dec.value == 1

    # Reset the dut
    dut.inp_dec.value = 0b01
    # wait for synchronization
    await Timer(1, units='us')
    # Check that the output is equal to the initial value
    assert dut.out_dec.value == 2

    # Reset the dut
    dut.inp_dec.value = 0b10
    # wait for synchronization
    await Timer(1, units='us')
    # Check that the output is equal to the initial value
    assert dut.out_dec.value == 4
    
    # Reset the dut
    dut.inp_dec.value = 0b11
    # wait for synchronization
    await Timer(1, units='us')
    # Check that the output is equal to the initial value
    assert dut.out_dec.value == 8


