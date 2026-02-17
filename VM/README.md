Download Ubuntu live server from iso from [ubuntu](https://cloud-images.ubuntu.com/noble/current/noble-server-cloudimg-amd64.img)
```code
brew install qemu
```

## Create seed.iso
```code
#user-data
cat <<EOF > user-data
#cloud-config
user: ubuntu
password: mypassword123
chpasswd: { expire: False }
ssh_pwauth: True
EOF

touch meta-data

hdiutil makehybrid -o seed.iso -hfs -joliet -iso -default-volume-name cidata .
```

./create-vm.sh noble-server-cloudimg-amd64.img
./create-vm.sh noble-server-cloudimg-amd64.img

