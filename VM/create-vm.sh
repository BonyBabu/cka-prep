qemu-img create -f qcow2 $1.qcow2 15G

qemu-system-x86_64 \
-m 1G \
-smp 1 \
-cdrom $2 \
-drive file=$1.qcow2,if=virtio \
-vga virtio \
-display default,show-cursor=on \
-usb \
-device usb-tablet \
-cpu host \
-machine type=q35,accel=hvf \
