Download Ubuntu live server from iso from [ubuntu](https://cloud-images.ubuntu.com/noble/current/noble-server-cloudimg-amd64.img)
```code
brew install qemu
brew install libguestfs
virt-customize -a noble-server-cloudimg-amd64.img --password root:password:root
./create-vm.sh one ubuntu-24.04.4-desktop-amd64.iso
./create-vm.sh two ubuntu-24.04.4-desktop-amd64.iso
```
