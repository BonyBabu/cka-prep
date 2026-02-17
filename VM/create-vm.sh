qemu-system-x86_64 \
  -m 4G \
  -accel hvf \
  -cpu host \
  -drive file=noble-server-cloudimg-amd64.img,format=qcow2 \
  -drive file=seed.iso,format=raw,index=1,media=cdrom \
  -nographic \
  -serial mon:stdio
