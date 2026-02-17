qemu-system-x86_64 \
  -m 1G \
  -smp 1 \
  -accel hvf \
  -cpu host \
  -drive file=$1\
  -nographic
