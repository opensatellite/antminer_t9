#!/bin/bash

source /opt/xilinx/Vitis/2022.1/settings64.sh
cd ~/u-boot-xlnx

# cleanup (optional)
make distclean

# set environment
export CROSS_COMPILE=arm-linux-gnueabihf-
export ARCH=arm
export DEVICE_TREE="zynq-antminer-t9"

# initial config
make xilinx_zynq_virt_defconfig

# set device tree
echo "In menuconfig window, modify"
echo "Device Tree Control -> Default Device Tree for DT control (zynq-antminer-t9)"
echo "select <Save>, press enter to confirm, then select <Exit> -> Save new configuration"
echo "Press enter to run menuconfig..."
read
make menuconfig 

# Compile u-boot
make -j8

