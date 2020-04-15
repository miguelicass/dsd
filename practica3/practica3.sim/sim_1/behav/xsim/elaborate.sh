#!/bin/bash -f
# ****************************************************************************
# Vivado (TM) v2019.2 (64-bit)
#
# Filename    : elaborate.sh
# Simulator   : Xilinx Vivado Simulator
# Description : Script for elaborating the compiled design
#
# Generated by Vivado on Thu Apr 16 00:30:56 CEST 2020
# SW Build 2708876 on Wed Nov  6 21:39:14 MST 2019
#
# Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
#
# usage: elaborate.sh
#
# ****************************************************************************
set -Eeuo pipefail
echo "xelab -wto a6e3e66649f24220946b7caffc621aec --incr --debug typical --relax --mt 8 -L xil_defaultlib -L secureip --snapshot Manager0s1sROM_tb_behav xil_defaultlib.Manager0s1sROM_tb -log elaborate.log"
xelab -wto a6e3e66649f24220946b7caffc621aec --incr --debug typical --relax --mt 8 -L xil_defaultlib -L secureip --snapshot Manager0s1sROM_tb_behav xil_defaultlib.Manager0s1sROM_tb -log elaborate.log

