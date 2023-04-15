import cocotb
from cocotb.triggers import Timer
import random

@cocotb.test()
async def extend_immediate(dut):
    #Generate the clock
    dut.instruction.value = 0x64039842
    dut.ImmSrc.value = 0b00
    await Timer(1, units="us")
    assert dut.out_ext_imm.value == 0x00000042

    dut.instruction.value = 0x640398E2
    dut.ImmSrc.value = 0b00
    await Timer(1, units="us")
    assert dut.out_ext_imm.value == 0x000000E2


    dut.instruction.value = 0x64039842
    dut.ImmSrc.value = 0b01
    await Timer(1, units="us")
    assert dut.out_ext_imm.value == 0x00000842

    dut.instruction.value = 0x640398E2
    dut.ImmSrc.value = 0b01
    await Timer(1, units="us")
    assert dut.out_ext_imm.value == 0x000008E2


    dut.instruction.value = 0x64839842
    dut.ImmSrc.value = 0b10
    await Timer(1, units="us")
    assert dut.out_ext_imm.value == 0xFF839842

    dut.instruction.value = 0x64E398E2
    dut.ImmSrc.value = 0b10
    await Timer(1, units="us")
    assert dut.out_ext_imm.value == 0xFFE398E2

    dut.instruction.value = 0x64439842
    dut.ImmSrc.value = 0b10
    await Timer(1, units="us")
    assert dut.out_ext_imm.value == 0x00439842

    






