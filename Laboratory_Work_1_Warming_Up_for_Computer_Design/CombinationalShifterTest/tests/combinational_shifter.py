import cocotb
from cocotb.triggers import Timer
import random

@cocotb.test()
async def combinational_shifter(dut):

    ### LOGIC LEFT SHIFT TEST START
    dut.inp_shifter.value = 0b0101
    dut.shamt.value = 1
    dut.control.value = 0

    await Timer(1, units="us")
    assert dut.out_shifter.value == 0b1010



    dut.inp_shifter.value = 0b0101
    dut.shamt.value = 2
    dut.control.value = 0

    await Timer(1, units="us")
    assert dut.out_shifter.value == 0b0100
     


    dut.inp_shifter.value = 0b0101
    dut.shamt.value = 3
    dut.control.value = 0

    await Timer(1, units="us")
    assert dut.out_shifter.value == 0b1000



    dut.inp_shifter.value = 0b0001
    dut.shamt.value = 4
    dut.control.value = 0

    await Timer(1, units="us")
    assert dut.out_shifter.value == 0b0000
    ### LOGIC LEFT SHIFT TEST END



    ### LOGIC RIGHT SHIFT TEST START
    dut.inp_shifter.value = 0b0101
    dut.shamt.value = 1
    dut.control.value = 1

    await Timer(1, units="us")
    assert dut.out_shifter.value == 0b0010



    dut.inp_shifter.value = 0b0101
    dut.shamt.value = 2
    dut.control.value = 1

    await Timer(1, units="us")
    assert dut.out_shifter.value == 0b0001
     


    dut.inp_shifter.value = 0b0101
    dut.shamt.value = 3
    dut.control.value = 1

    await Timer(1, units="us")
    assert dut.out_shifter.value == 0b0000



    dut.inp_shifter.value = 0b0001
    dut.shamt.value = 4
    dut.control.value = 1

    await Timer(1, units="us")
    assert dut.out_shifter.value == 0b0000
    ### LOGIC RIGHT SHIFT TEST END


    ### ARITHMETIC RIGHT SHIFT TEST START
    dut.inp_shifter.value = 0b1101
    dut.shamt.value = 1
    dut.control.value = 2

    await Timer(1, units="us")
    assert dut.out_shifter.value.signed_integer == 0b1110



    dut.inp_shifter.value = 0b1010
    dut.shamt.value = 2
    dut.control.value = 3

    await Timer(1, units="us")
    assert dut.out_shifter.value.signed_integer == 0b1101
     


    dut.inp_shifter.value = 0b0101
    dut.shamt.value = 3
    dut.control.value = 4

    await Timer(1, units="us")
    assert dut.out_shifter.value.signed_integer == 0b1010



    dut.inp_shifter.value = 0b0001
    dut.shamt.value = 4
    dut.control.value = 1

    await Timer(1, units="us")
    assert dut.out_shifter.value.signed_integer == 0b0000
    ### ARITHMETIC RIGHT SHIFT TEST END






