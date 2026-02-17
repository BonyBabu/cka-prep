cp noble-server-cloudimg-amd64.img $1.img
cp seed.iso $1.iso
qemu-system-x86_64 \
  -m 1G \
  -accel hvf \
  -cpu host \
  -drive file=$1.img,format=qcow2 \
  -drive file=$1.iso,format=raw,index=1,media=cdrom \
  -nographic \
  -serial mon:stdio
