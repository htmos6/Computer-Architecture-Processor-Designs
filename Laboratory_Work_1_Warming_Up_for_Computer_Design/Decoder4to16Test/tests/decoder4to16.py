import cocotb
from cocotb.triggers import Timer

@cocotb.test()
async def decoder4to16(dut):

    dut.inp_dec.value = 0b0000
    # wait for synchronization
    await Timer(1, units='us')
    # Check that the output is equal to the initial value
    assert dut.out_dec.value == 0b0000000000000001

    dut.inp_dec.value = 0b0001
    # wait for synchronization
    await Timer(1, units='us')
    # Check that the output is equal to the initial value
    assert dut.out_dec.value == 0b0000000000000010

    dut.inp_dec.value = 0b0010
    # wait for synchronization
    await Timer(1, units='us')
    # Check that the output is equal to the initial value
    assert dut.out_dec.value == 0b0000000000000100
    
    dut.inp_dec.value = 0b0011
    # wait for synchronization
    await Timer(1, units='us')
    # Check that the output is equal to the initial value
    assert dut.out_dec.value == 0b0000000000001000

    dut.inp_dec.value = 0b0100
    # wait for synchronization
    await Timer(1, units='us')
    # Check that the output is equal to the initial value
    assert dut.out_dec.value == 0b0000000000010000

    dut.inp_dec.value = 0b0101
    # wait for synchronization
    await Timer(1, units='us')
    # Check that the output is equal to the initial value
    assert dut.out_dec.value == 0b0000000000100000

    dut.inp_dec.value = 0b0110
    # wait for synchronization
    await Timer(1, units='us')
    # Check that the output is equal to the initial value
    assert dut.out_dec.value == 0b0000000001000000

    dut.inp_dec.value = 0b0111
    # wait for synchronization
    await Timer(1, units='us')
    # Check that the output is equal to the initial value
    assert dut.out_dec.value == 0b0000000010000000

    dut.inp_dec.value = 0b1000
    # wait for synchronization
    await Timer(1, units='us')
    # Check that the output is equal to the initial value
    assert dut.out_dec.value == 0b0000000100000000

    dut.inp_dec.value = 0b1001
    # wait for synchronization
    await Timer(1, units='us')
    # Check that the output is equal to the initial value
    assert dut.out_dec.value == 0b0000001000000000

    dut.inp_dec.value = 0b1010
    # wait for synchronization
    await Timer(1, units='us')
    # Check that the output is equal to the initial value
    assert dut.out_dec.value == 0b0000010000000000

    dut.inp_dec.value = 0b1011
    # wait for synchronization
    await Timer(1, units='us')
    # Check that the output is equal to the initial value
    assert dut.out_dec.value == 0b0000100000000000

    dut.inp_dec.value = 0b1100
    # wait for synchronization
    await Timer(1, units='us')
    # Check that the output is equal to the initial value
    assert dut.out_dec.value == 0b0001000000000000
    
    dut.inp_dec.value = 0b1101
    # wait for synchronization
    await Timer(1, units='us')
    # Check that the output is equal to the initial value
    assert dut.out_dec.value == 0b0010000000000000

    dut.inp_dec.value = 0b1110
    # wait for synchronization
    await Timer(1, units='us')
    # Check that the output is equal to the initial value
    assert dut.out_dec.value == 0b0100000000000000

    dut.inp_dec.value = 0b1111    # wait for synchronization
    await Timer(1, units='us')
    # Check that the output is equal to the initial value
    assert dut.out_dec.value == 0b1000000000000000
    

