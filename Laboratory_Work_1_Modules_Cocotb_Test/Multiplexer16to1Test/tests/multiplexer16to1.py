import cocotb
from cocotb.triggers import Timer
import random

@cocotb.test()
async def multiplexer16to1(dut):

    for i in range(132):
        lst = [
               random.randint(0, 100000),
               random.randint(0, 100000),
               random.randint(0, 100000),
               random.randint(0, 100000),
               random.randint(0, 100000),
               random.randint(0, 100000),
               random.randint(0, 100000),
               random.randint(0, 100000),
               random.randint(0, 100000),
               random.randint(0, 100000),
               random.randint(0, 100000),
               random.randint(0, 100000),
               random.randint(0, 100000),
               random.randint(0, 100000),
               random.randint(0, 100000),
               random.randint(0, 100000)
               ]
        
        dut.inp_mux0.value = lst[0]
        dut.inp_mux1.value = lst[1]
        dut.inp_mux2.value = lst[2]
        dut.inp_mux3.value = lst[3]
        dut.inp_mux4.value = lst[4]
        dut.inp_mux5.value = lst[5]
        dut.inp_mux6.value = lst[6]
        dut.inp_mux7.value = lst[7]
        dut.inp_mux8.value = lst[8]
        dut.inp_mux9.value = lst[9]
        dut.inp_mux10.value = lst[10]
        dut.inp_mux11.value = lst[11]
        dut.inp_mux12.value = lst[12]
        dut.inp_mux13.value = lst[13]
        dut.inp_mux14.value = lst[14]
        dut.inp_mux15.value = lst[15]

        sel = random.randint(0, 15)
        dut.select.value = sel

        await Timer(1, units="us")
        assert dut.out_mux.value == lst[sel]









