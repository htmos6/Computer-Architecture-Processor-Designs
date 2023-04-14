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
    assert dut.out_shifter.value == 10



    dut.inp_shifter.value = 0b0101
    dut.shamt.value = 2
    dut.control.value = 0

    await Timer(1, units="us")
    assert dut.out_shifter.value == 20
     


    dut.inp_shifter.value = 0b0101
    dut.shamt.value = 3
    dut.control.value = 0

    await Timer(1, units="us")
    assert dut.out_shifter.value == 40



    dut.inp_shifter.value = 0b0001
    dut.shamt.value = 4
    dut.control.value = 0

    await Timer(1, units="us")
    assert dut.out_shifter.value == 16
    ### LOGIC LEFT SHIFT TEST END



    ### LOGIC RIGHT SHIFT TEST START
    dut.inp_shifter.value = 0b0101
    dut.shamt.value = 1
    dut.control.value = 1

    await Timer(1, units="us")
    assert dut.out_shifter.value == 2



    dut.inp_shifter.value = 0b0101
    dut.shamt.value = 2
    dut.control.value = 1

    await Timer(1, units="us")
    assert dut.out_shifter.value == 1
     


    dut.inp_shifter.value = 0b0101
    dut.shamt.value = 3
    dut.control.value = 1

    await Timer(1, units="us")
    assert dut.out_shifter.value == 0



    dut.inp_shifter.value = 0b0001
    dut.shamt.value = 4
    dut.control.value = 1

    await Timer(1, units="us")
    assert dut.out_shifter.value == 0
    ### LOGIC RIGHT SHIFT TEST END


    ### ARITHMETIC RIGHT SHIFT TEST START
    dut.inp_shifter.value = -6
    dut.shamt.value = 1
    dut.control.value = 2

    await Timer(1, units="us")
    assert dut.out_shifter.value.signed_integer == -3 # 1110



    dut.inp_shifter.value = -15
    dut.shamt.value = 2
    dut.control.value = 2

    await Timer(1, units="us")
    assert dut.out_shifter.value.signed_integer == -4 # 1110
     


    dut.inp_shifter.value = 0b0101
    dut.shamt.value = 3
    dut.control.value = 2

    await Timer(1, units="us")
    assert dut.out_shifter.value.signed_integer == 0



    dut.inp_shifter.value = 0b0001
    dut.shamt.value = 4
    dut.control.value = 2

    await Timer(1, units="us")
    assert dut.out_shifter.value.signed_integer == 0b0000
    ### ARITHMETIC RIGHT SHIFT TEST END


    ### ROTATE RIGHT SHIFT TEST START

    dut.inp_shifter.value = -6
    dut.shamt.value = 1
    dut.control.value = 3

    await Timer(1, units="us")
    assert dut.out_shifter.value.signed_integer == 125 # 1110


    dut.inp_shifter.value = -15 # 11110001
    dut.shamt.value = 2
    dut.control.value = 3

    await Timer(1, units="us")
    assert dut.out_shifter.value.signed_integer == 124# 01111100


    dut.inp_shifter.value = 0b0101
    dut.shamt.value = 3
    dut.control.value = 3

    await Timer(1, units="us")
    assert dut.out_shifter.value.signed_integer == -96



    dut.inp_shifter.value = 0b0001
    dut.shamt.value = 4
    dut.control.value = 3

    await Timer(1, units="us")
    assert dut.out_shifter.value.signed_integer == 16
    ### ARITHMETIC RIGHT SHIFT TEST END




