kernel_image=uImage
devicetree_image=system.dtb
ramdisk_image=ramdisk.cpio.gz.u-boot
bootargs="console=ttyPS1,115200 earlycon root=/dev/mmcblk0p2 rw rootwait devtmpfs.mount=1 uio_pdrv_genirq.of_id=\"generic-uio\" clk_ignore_unused"

fatload mmc 0 0x3000000 ${kernel_image}
fatload mmc 0 0x2A00000 ${devicetree_image} 
if fatload mmc 0 0x2000000 ${ramdisk_image}; then 
    bootm 0x3000000 0x2000000 0x2A00000; 
else 
    bootm 0x3000000 - 0x2A00000; 
fi

