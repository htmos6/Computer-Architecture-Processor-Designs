import cocotb
from cocotb.triggers import Timer
import random

@cocotb.test()
async def constant_value_generator_test(dut):

    for i in range(255):
        a = random.randint(0, 100000)
        b = random.randint(0, 100000)
        c = random.randint(0, 100000)
        d = random.randint(0, 100000)
        lst = [a, b, c, d]

        dut.inp_mux0.value = a
        dut.inp_mux1.value = b
        dut.inp_mux2.value = c
        dut.inp_mux3.value = d

        sel = random.randint(0, 3)
        dut.select.value = sel

        await Timer(1, units="us")
        # Check that the output is equal to the initial value
        assert dut.out_mux.value == lst[sel]

