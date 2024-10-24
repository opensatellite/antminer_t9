# How to compile device tree and linux kernel for antminer-t9

# download
git clone https://github.com/xilinx/linux-xlnx
cp petalinux-dts/zynq-antminer-t9.dts linux-xlnx/arch/arm/boot/dts/xilinx/

# compile device tree
source /opt/xilinx/Vitis/2022.1/settings64.sh
cd linux-xlnx
make ARCH=arm xilinx_zynq_defconfig
make ARCH=arm xilinx/zynq-antminer-t9.dtb

# copy
cp arch/arm/boot/dts/xilinx/zynq-antminer-t9.dtb ~/pynq_t9/system.dtb

# compile kernel
export CROSS_COMPILE=arm-linux-gnueabihf-
export ARCH=arm
make -j8 UIMAGE_LOADADDR=0x8000 uImage

# copy
cp arch/arm/boot/uImage ~/pynq_t9/uImage

# u-boot bootargs
#bootargs=console=ttyPS1,115200 earlycon root=/dev/mmcblk0p2 rw rootwait devtmpfs.mount=1 uio_pdrv_genirq.of_id=\"generic-uio\" clk_ignore_unused

