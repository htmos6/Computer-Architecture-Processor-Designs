# Copyright (c) 2016 Technische Universitaet Dresden, Germany
# Chair for VLSI-Design, Diagnostic and Architecture
# Author: Martin Zabel
# All rights reserved.

CWD=$(shell pwd)

SIM ?= icarus
TOPLEVEL_LANG ?=verilog


VERILOG_SOURCES =$(CWD)/../hdl/*.v


TOPLEVEL = decoder2to4 # module name
MODULE := decoder2to4 # python test file nme
COCOTB_HDL_TIMEUNIT=1us
COCOTB_HDL_TIMEPRECISION=1us

# include cocotb's make rules to take care of the simulator setup
include $(shell cocotb-config --makefiles)/Makefile.sim
