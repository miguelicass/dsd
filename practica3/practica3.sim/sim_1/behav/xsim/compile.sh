#!/bin/bash -f
# ****************************************************************************
# Vivado (TM) v2019.2 (64-bit)
#
# Filename    : compile.sh
# Simulator   : Xilinx Vivado Simulator
# Description : Script for compiling the simulation design source files
#
# Generated by Vivado on Wed Apr 22 20:38:42 CEST 2020
# SW Build 2708876 on Wed Nov  6 21:39:14 MST 2019
#
# Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
#
# usage: compile.sh
#
# ****************************************************************************
set -Eeuo pipefail
echo "xvhdl --incr --relax -prj Manager0s1sPL_tb_vhdl.prj"
xvhdl --incr --relax -prj Manager0s1sPL_tb_vhdl.prj 2>&1 | tee -a compile.log

