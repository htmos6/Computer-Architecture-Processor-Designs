# Taken from BARIS GUZEL 
# ==============================================================================
# Authors:              BARIŞ GÜZEL
#
# Cocotb Testbench:     For 12 DIFFERENT ALU OPERATION
#
# Description:
# ------------------------------------
# FOR EACH CASE BY TWO DIFFERENT INPUT IS USED TO CHECK OPERATIONS
#
# License: 
# ==============================================================================


import random
import warnings

import cocotb
from cocotb.clock import Clock
from cocotb.triggers import FallingEdge
#from cocotb.triggers import RisingEdge
from cocotb.triggers import Edge
from cocotb.binary import BinaryValue
#from cocotb.regression import TestFactory
from cocotb.triggers import Timer


################################################################################
#                           START AND CASE TEST


@cocotb.test()
async def ALU_AND_CASE(dut):
    
    print("AND case starts")
    for x in range(100):
        a=0b1011 # 11 
        b=0b1101 # 13
        
        dut.inp_src0.value=a
        dut.inp_src1.value=b
        dut.operation_select.value=0
        
        await Timer(2, units="us")
        assert dut.out_alu.value == 0b1001 # output check


#                           END AND CASE TEST
################################################################################




################################################################################
#                           START EXOR CASE TEST


@cocotb.test()
async def ALU_EXOR_CASE(dut):
   
    print("EXOR case starts")
    for x in range(100):
        a=0b1011 # 11 
        b=0b1101 # 13
        
        dut.inp_src0.value=a
        dut.inp_src1.value=b

        dut.operation_select.value=1
        
        await Timer(2, units="us")
        assert dut.out_alu.value == 0b0110 # output check


#                           END EXOR CASE TEST
################################################################################




################################################################################
#                           START SUBSTRACTION_AB CASE TEST


@cocotb.test()
async def ALU_SubtractionAB_CASE(dut):
    #Generate the clock


#Simple subtraction: Test the ability of the ALU to subtract two small positive integers.
#Input: inp_src0 = 5, inp_src1 = 3
#Expected output: 2
#Expected Negative Flag: 0
#Expected Zero Flag: 0
#Expected Overflow Flag: 0
#Expected Carry Flag: 1

    print("Simple subtraction start")
    for x in range(100):
        a=5 
        b=3  
        
        dut.inp_src0.value=a
        dut.inp_src1.value=b

        dut.operation_select.value=2
        
        await Timer(2, units="us")
        assert dut.out_alu.value.signed_integer == 2 # output check

        await Timer(2, units="us")
        assert dut.negative_flag.value==0            # negative flag check

        await Timer(2, units="us")
        assert dut.zero_flag.value==0            # zero flag check

        await Timer(2, units="us")
        assert dut.overflow_flag.value==0          # overflow flag chek

        await Timer(2, units="us")
        assert dut.carry_out_flag.value==1           # inp_carry flag check


#Overflow: Test the ability of the ALU to handle overflow when subtracting two large positive integers.
#Input: inp_src0 = 2147483647, inp_src1 = -1 (maximum value for a 32-bit signed integer)
#Expected output: -2147483648 (overflow)
#Expected Negative Flag: 1
#Expected Zero Flag: 0
#Expected Overflow Flag: 1
#Expected Carry Flag: 0

    print("Overflow start")
    for x in range(100):
        a=2147483647  
        b=-1  
        
        dut.inp_src0.value=a
        dut.inp_src1.value=b

        dut.operation_select.value=2
        
        await Timer(2, units="us")
        assert dut.out_alu.value.signed_integer == -2147483648 # output check

        await Timer(2, units="us")
        assert dut.negative_flag.value==1            # negative flag check

        await Timer(2, units="us")
        assert dut.zero_flag.value==0            # zero flag check

        await Timer(2, units="us")
        assert dut.overflow_flag.value==1          # overflow flag chek

        await Timer(2, units="us")
        assert dut.carry_out_flag.value==0           # inp_carry flag check


#Negative and positive subtraction: Test the ability of the ALU to subtract a positive integer from a negative integer.
#Input: inp_src0 = -10, inp_src1 = 5
#Expected output: -15
#Expected Negative Flag: 1
#Expected Zero Flag: 0
#Expected Overflow Flag: 0
#Expected Carry Flag: 1
    
    print("Negative and positive subtraction start")
    for x in range(100):
        a=-10  
        b=5  
        
        dut.inp_src0.value=a
        dut.inp_src1.value=b

        dut.operation_select.value=2
        
        await Timer(2, units="us")
        assert dut.out_alu.value.signed_integer == -15 # output check

        await Timer(2, units="us")
        assert dut.negative_flag.value==1            # negative flag check

        await Timer(2, units="us")
        assert dut.zero_flag.value==0            # zero flag check

        await Timer(2, units="us")
        assert dut.overflow_flag.value==0          # overflow flag chek

        await Timer(2, units="us")
        assert dut.carry_out_flag.value==1           # inp_carry flag check


#                           END SUBSTRACTION_AB CASE TEST
################################################################################



################################################################################
#                           START SUBSTRACTION_BA CASE TEST


@cocotb.test()
async def ALU_SubtractionBA_CASE(dut):
    #Generate the clock


#Simple subtraction: Test the ability of the ALU to subtract two small positive integers.
#Input: inp_src1 = 5, inp_src0 = 3
#Expected output: 2
#Expected Negative Flag: 0
#Expected Zero Flag: 0
#Expected Overflow Flag: 0
#Expected Carry Flag: 1

    print("Simple subtraction start")
    for x in range(100):
        b=5 
        a=3  
        
        dut.inp_src0.value=a
        dut.inp_src1.value=b

        dut.operation_select.value=3
        
        await Timer(2, units="us")
        assert dut.out_alu.value.signed_integer == 2 # output check

        await Timer(2, units="us")
        assert dut.negative_flag.value==0            # negative flag check

        await Timer(2, units="us")
        assert dut.zero_flag.value==0            # zero flag check

        await Timer(2, units="us")
        assert dut.overflow_flag.value==0          # overflow flag chek

        await Timer(2, units="us")
        assert dut.carry_out_flag.value==1           # inp_carry flag check


#Overflow: Test the ability of the ALU to handle overflow when subtracting two large positive integers.
#Input: inp_src1 = 2147483647, inp_src0 = -1 (maximum value for a 32-bit signed integer)
#Expected output: -2147483648 (overflow)
#Expected Negative Flag: 1
#Expected Zero Flag: 0
#Expected Overflow Flag: 1
#Expected Carry Flag: 0

    print("Overflow start")
    for x in range(100):
        b=2147483647  
        a=-1  
        
        dut.inp_src0.value=a
        dut.inp_src1.value=b

        dut.operation_select.value=3
        
        await Timer(2, units="us")
        assert dut.out_alu.value.signed_integer == -2147483648 # output check

        await Timer(2, units="us")
        assert dut.negative_flag.value==1            # negative flag check

        await Timer(2, units="us")
        assert dut.zero_flag.value==0            # zero flag check

        await Timer(2, units="us")
        assert dut.overflow_flag.value==1          # overflow flag chek

        await Timer(2, units="us")
        assert dut.carry_out_flag.value==0           # inp_carry flag check


#Negative and positive subtraction: Test the ability of the ALU to subtract a positive integer from a negative integer.
#Input: inp_src1 = -10, inp_src0 = 5
#Expected output: -15
#Expected Negative Flag: 1
#Expected Zero Flag: 0
#Expected Overflow Flag: 0
#Expected Carry Flag: 1
    
    print("Negative and positive subtraction start")
    for x in range(100):
        b=-10  
        a=5  
        
        dut.inp_src0.value=a
        dut.inp_src1.value=b

        dut.operation_select.value=3
        
        await Timer(2, units="us")
        assert dut.out_alu.value.signed_integer == -15 # output check

        await Timer(2, units="us")
        assert dut.negative_flag.value==1            # negative flag check

        await Timer(2, units="us")
        assert dut.zero_flag.value==0            # zero flag check

        await Timer(2, units="us")
        assert dut.overflow_flag.value==0          # overflow flag chek

        await Timer(2, units="us")
        assert dut.carry_out_flag.value==1           # inp_carry flag check


#                           END SUBSTRACTION_BA CASE TEST
################################################################################



################################################################################
#                           START ADDITION CASE TEST


@cocotb.test()
async def ALU_ADDITION_CASE(dut):
    #Generate the clock


#Simple addition: Test the ability of the ALU to add two small positive numbers and set flags accordingly.
#Input: inp_src0 = 5, inp_src1 = 3
#Expected output: 2
#Expected Negative Flag: 0
#Expected Zero Flag: 0
#Expected Overflow Flag: 0
#Expected Carry Flag: 1

    print("Simple start")
    for x in range(100):
        a=5 
        b=3  
        
        dut.inp_src0.value=a
        dut.inp_src1.value=b

        dut.operation_select.value=4
        
        await Timer(2, units="us")
        assert dut.out_alu.value.signed_integer == 8 # output check

        await Timer(2, units="us")
        assert dut.negative_flag.value==0            # negative flag check

        await Timer(2, units="us")
        assert dut.zero_flag.value==0            # zero flag check

        await Timer(2, units="us")
        assert dut.overflow_flag.value==0          # overflow flag chek

        await Timer(2, units="us")
        assert dut.carry_out_flag.value==0           # inp_carry flag check


#Overflow: Test the ability of the ALU to handle overflow when adding two large positive numbers and set flags accordingly.
#Input: inp_src0 = 2147483647, inp_src1 = 2 (maximum value for a 32-bit signed integer minus 1)
#Expected output: 2147483648 (overflow)
#Expected Negative Flag: 1
#Expected Zero Flag: 0
#Expected Overflow Flag: 1
#Expected Carry Flag: 1

    print("Overflow start")
    for x in range(100):
        a=2147483647  
        b=2  
        
        dut.inp_src0.value=a
        dut.inp_src1.value=b

        dut.operation_select.value=4
        
        await Timer(2, units="us")
        assert dut.out_alu.value.signed_integer == -2147483647 # output check

        await Timer(2, units="us")
        assert dut.negative_flag.value==1            # negative flag check

        await Timer(2, units="us")
        assert dut.zero_flag.value==0            # zero flag check

        await Timer(2, units="us")
        assert dut.overflow_flag.value==1          # overflow flag chek

        await Timer(2, units="us")
        assert dut.carry_out_flag.value==0           # inp_carry flag check


#Negative and positive addition: Test the ability of the ALU to add a positive number and a negative number and set flags accordingly.
#Input: inp_src0 = -10, inp_src1 = 5
#Expected output: -15
#Expected Negative Flag: 1
#Expected Zero Flag: 0
#Expected Overflow Flag: 0
#Expected Carry Flag: 0
    
    print("Negative and positive start")
    for x in range(100):
        a=-10  
        b=5  
        
        dut.inp_src0.value=a
        dut.inp_src1.value=b

        dut.operation_select.value=4
        
        await Timer(2, units="us")
        assert dut.out_alu.value.signed_integer == -5 # output check

        await Timer(2, units="us")
        assert dut.negative_flag.value==1            # negative flag check

        await Timer(2, units="us")
        assert dut.zero_flag.value==0            # zero flag check

        await Timer(2, units="us")
        assert dut.overflow_flag.value==0          # overflow flag chek

        await Timer(2, units="us")
        assert dut.carry_out_flag.value==0           # inp_carry flag check


#                           END ADDITION CASE TEST
################################################################################



################################################################################
#                           START Addition Carry CASE TEST


@cocotb.test()
async def ALU_ADDITION_CARRY_CASE(dut):
    #Generate the clock


#Simple addition: Test the ability of the ALU to add two small positive numbers and set flags accordingly.
#Input: inp_src0 = 5, inp_src1 = 3
#Expected output: 2
#Expected Negative Flag: 0
#Expected Zero Flag: 0
#Expected Overflow Flag: 0
#Expected Carry Flag: 1

    print("Simple addition with inp_carry start")
    for x in range(100):
        a=5 
        b=3
        c=1  
        
        dut.inp_src0.value=a
        dut.inp_src1.value=b
        dut.inp_carry.value=c

        dut.operation_select.value=5
        
        await Timer(2, units="us")
        assert dut.out_alu.value.signed_integer == 9 # output check

        await Timer(2, units="us")
        assert dut.negative_flag.value==0            # negative flag check

        await Timer(2, units="us")
        assert dut.zero_flag.value==0            # zero flag check

        await Timer(2, units="us")
        assert dut.overflow_flag.value==0          # overflow flag chek

        await Timer(2, units="us")
        assert dut.carry_out_flag.value==0           # inp_carry flag check


#Overflow: Test the ability of the ALU to handle overflow when adding two large positive numbers and set flags accordingly.
#Input: inp_src0 = 2147483647, inp_src1 = 2 (maximum value for a 32-bit signed integer minus 1)
#Expected output: 2147483648 (overflow)
#Expected Negative Flag: 1
#Expected Zero Flag: 0
#Expected Overflow Flag: 1
#Expected Carry Flag: 1

    print("Overflow with inp_carry start")
    for x in range(100):
        a=2147483647  
        b=2
          
        
        dut.inp_src0.value=a
        dut.inp_src1.value=b

        dut.operation_select.value=5
        
        await Timer(2, units="us")
        assert dut.out_alu.value.signed_integer == -2147483646 # output check

        await Timer(2, units="us")
        assert dut.negative_flag.value==1            # negative flag check

        await Timer(2, units="us")
        assert dut.zero_flag.value==0            # zero flag check

        await Timer(2, units="us")
        assert dut.overflow_flag.value==1          # overflow flag chek

        await Timer(2, units="us")
        assert dut.carry_out_flag.value==0           # inp_carry flag check


#Negative and positive addition: Test the ability of the ALU to add a positive number and a negative number and set flags accordingly.
#Input: inp_src0 = -10, inp_src1 = 5
#Expected output: -15
#Expected Negative Flag: 1
#Expected Zero Flag: 0
#Expected Overflow Flag: 0
#Expected Carry Flag: 0
    
    print("Negative and positive addition with inp_carry start")
    for x in range(100):
        a=-10  
        b=5  
        
        dut.inp_src0.value=a
        dut.inp_src1.value=b

        dut.operation_select.value=5
        
        await Timer(2, units="us")
        assert dut.out_alu.value.signed_integer == -4 # output check

        await Timer(2, units="us")
        assert dut.negative_flag.value==1            # negative flag check

        await Timer(2, units="us")
        assert dut.zero_flag.value==0            # zero flag check

        await Timer(2, units="us")
        assert dut.overflow_flag.value==0          # overflow flag chek

        await Timer(2, units="us")
        assert dut.carry_out_flag.value==0           # inp_carry flag check


#                           END Addition Carry CASE TEST
################################################################################



################################################################################
#                           START SUBSTRACTION_AB Carry CASE TEST


@cocotb.test()
async def ALU_SubtractionAB_Carry_CASE(dut):
    #Generate the clock


#Simple subtraction: Test the ability of the ALU to subtract two small positive integers.
#Input: inp_src0 = 5, inp_src1 = 3
#Expected output: 2
#Expected Negative Flag: 0
#Expected Zero Flag: 0
#Expected Overflow Flag: 0
#Expected Carry Flag: 1

    print("Simple subtraction Carry start")
    for x in range(100):
        a=5 
        b=3
        c=0  
        
        dut.inp_src0.value=a
        dut.inp_src1.value=b
        dut.inp_carry.value=c

        dut.operation_select.value=6
        
        await Timer(2, units="us")
        assert dut.out_alu.value.signed_integer == 1 # output check

        await Timer(2, units="us")
        assert dut.negative_flag.value==0            # negative flag check

        await Timer(2, units="us")
        assert dut.zero_flag.value==0            # zero flag check

        await Timer(2, units="us")
        assert dut.overflow_flag.value==0          # overflow flag chek

        await Timer(2, units="us")
        assert dut.carry_out_flag.value==1           # inp_carry flag check


#Overflow: Test the ability of the ALU to handle overflow when subtracting two large positive integers.
#Input: inp_src0 = 2147483647, inp_src1 = -1 (maximum value for a 32-bit signed integer)
#Expected output: -2147483648 (overflow)
#Expected Negative Flag: 1
#Expected Zero Flag: 0
#Expected Overflow Flag: 1
#Expected Carry Flag: 0

    print("Overflow with inp_carry start")
    for x in range(100):
        a=2147483647  
        b=-1  
        
        dut.inp_src0.value=a
        dut.inp_src1.value=b
        dut.inp_carry.value =1

        dut.operation_select.value=6
        
        await Timer(2, units="us")
        assert dut.out_alu.value.signed_integer == -2147483648 # output check

        await Timer(2, units="us")
        assert dut.negative_flag.value==1            # negative flag check

        await Timer(2, units="us")
        assert dut.zero_flag.value==0            # zero flag check

        await Timer(2, units="us")
        assert dut.overflow_flag.value==1          # overflow flag chek

        await Timer(2, units="us")
        assert dut.carry_out_flag.value==0           # inp_carry flag check


#Negative and positive subtraction: Test the ability of the ALU to subtract a positive integer from a negative integer.
#Input: inp_src0 = -10, inp_src1 = 5
#Expected output: -15
#Expected Negative Flag: 1
#Expected Zero Flag: 0
#Expected Overflow Flag: 0
#Expected Carry Flag: 1
    
    print("Negative and positive subtraction with inp_carry start")
    for x in range(100):
        a=-10  
        b=5  
        
        dut.inp_src0.value=a
        dut.inp_src1.value=b

        dut.operation_select.value=6
        
        await Timer(2, units="us")
        assert dut.out_alu.value.signed_integer == -15 # output check

        await Timer(2, units="us")
        assert dut.negative_flag.value==1            # negative flag check

        await Timer(2, units="us")
        assert dut.zero_flag.value==0            # zero flag check

        await Timer(2, units="us")
        assert dut.overflow_flag.value==0          # overflow flag chek

        await Timer(2, units="us")
        assert dut.carry_out_flag.value==1           # inp_carry flag check


#                           END SUBSTRACTION_AB CASE TEST
################################################################################



################################################################################
#                           START SUBSTRACTION_BA with inp_carry CASE TEST


@cocotb.test()
async def ALU_SubtractionBA_carry_CASE(dut):
    #Generate the clock


#Simple subtraction: Test the ability of the ALU to subtract two small positive integers.
#Input: inp_src1 = 5, inp_src0 = 3
#Expected output: 2
#Expected Negative Flag: 0
#Expected Zero Flag: 0
#Expected Overflow Flag: 0
#Expected Carry Flag: 1

    print("Simple subtraction with inp_carry start")
    for x in range(100):
        b=5 
        a=3  
        
        dut.inp_src0.value=a
        dut.inp_src1.value=b
        dut.inp_carry.value = 1

        dut.operation_select.value=7
        
        await Timer(2, units="us")
        assert dut.out_alu.value.signed_integer == 2 # output check

        await Timer(2, units="us")
        assert dut.negative_flag.value==0            # negative flag check

        await Timer(2, units="us")
        assert dut.zero_flag.value==0            # zero flag check

        await Timer(2, units="us")
        assert dut.overflow_flag.value==0          # overflow flag chek

        await Timer(2, units="us")
        assert dut.carry_out_flag.value==1           # inp_carry flag check


#Overflow: Test the ability of the ALU to handle overflow when subtracting two large positive integers.
#Input: inp_src1 = 2147483647, inp_src0 = -1 (maximum value for a 32-bit signed integer)
#Expected output: -2147483648 (overflow)
#Expected Negative Flag: 1
#Expected Zero Flag: 0
#Expected Overflow Flag: 1
#Expected Carry Flag: 0

    print("Overflow with inp_carry start")
    for x in range(100):
        b=2147483647  
        a=-1  
        
        dut.inp_src0.value=a
        dut.inp_src1.value=b

        dut.operation_select.value=7
        
        await Timer(2, units="us")
        assert dut.out_alu.value.signed_integer == -2147483648 # output check

        await Timer(2, units="us")
        assert dut.negative_flag.value==1            # negative flag check

        await Timer(2, units="us")
        assert dut.zero_flag.value==0            # zero flag check

        await Timer(2, units="us")
        assert dut.overflow_flag.value==1          # overflow flag chek

        await Timer(2, units="us")
        assert dut.carry_out_flag.value==0           # inp_carry flag check


#Negative and positive subtraction: Test the ability of the ALU to subtract a positive integer from a negative integer.
#Input: inp_src1 = -10, inp_src0 = 5
#Expected output: -15
#Expected Negative Flag: 1
#Expected Zero Flag: 0
#Expected Overflow Flag: 0
#Expected Carry Flag: 1
    
    print("Negative and positive subtraction start")
    for x in range(100):
        b=-10  
        a=5  
        
        dut.inp_src0.value=a
        dut.inp_src1.value=b

        dut.operation_select.value=7
        
        await Timer(2, units="us")
        assert dut.out_alu.value.signed_integer == -15 # output check

        await Timer(2, units="us")
        assert dut.negative_flag.value==1            # negative flag check

        await Timer(2, units="us")
        assert dut.zero_flag.value==0            # zero flag check

        await Timer(2, units="us")
        assert dut.overflow_flag.value==0          # overflow flag chek

        await Timer(2, units="us")
        assert dut.carry_out_flag.value==1           # inp_carry flag check


#                           END SUBSTRACTION_BA inp_carry CASE TEST
################################################################################



################################################################################
#                           START ORR CASE TEST


@cocotb.test()
async def ALU_ORR_CASE(dut):
    
    print("ORR case starts")
    for x in range(100):
        a=0b1011 # 11 
        b=0b1101 # 13
        
        dut.inp_src0.value=a
        dut.inp_src1.value=b
        dut.operation_select.value=12
        
        await Timer(2, units="us")
        assert dut.out_alu.value == 0b1111 # output check


#                           END ORR CASE TEST
################################################################################



################################################################################
#                           START MOVE CASE TEST


@cocotb.test()
async def ALU_Move_CASE(dut):
    
    print("Move case starts")
    for x in range(100):
        a=0b1011 # 11 
        b=0b1101 # 13
        
        dut.inp_src0.value=a
        dut.inp_src1.value=b
        dut.operation_select.value=13

        await Timer(2, units="us")
        assert dut.out_alu.value == 0b1101 # output check
        

#                           END Move CASE TEST
################################################################################



################################################################################
#                           START BIT CLEAR CASE TEST


@cocotb.test()
async def ALU_Bit_clear_CASE(dut):
    
    print("Bit Clear case starts")
    for x in range(100):
        a=0b1011 # 11 
        b=0b1101 # 13
        
        dut.inp_src0.value=a
        dut.inp_src1.value=b
        dut.operation_select.value=14

        await Timer(2, units="us")
        assert dut.out_alu.value == 0b0010 # output check
        

#                           END BIT CLEAR CASE TEST
################################################################################



################################################################################
#                           START MOVE NOT CASE TEST


@cocotb.test()
async def ALU_Move_not_CASE(dut):
    
    print("Move NOT case starts")
    for x in range(100):
        a=0b1011 # 11 
        b=5
        
        dut.inp_src0.value=a
        dut.inp_src1.value=b
        dut.operation_select.value=15

        await Timer(2, units="us")
        assert dut.out_alu.value.signed_integer == -6 # output check
        

#                           END Move NOT CASE TEST
################################################################################