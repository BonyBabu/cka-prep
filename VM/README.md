Download Ubuntu live server from iso from [ubuntu](https://cloud-images.ubuntu.com/noble/current/noble-server-cloudimg-amd64.img)
```code
brew install qemu
```

## Create seed.iso
```code
mkdir cloud-config
#user-data
cat <<EOF > user-data
#cloud-config
password: mypassword123
chpasswd: { expire: False }
ssh_pwauth: True
EOF

touch meta-data

hdiutil makehybrid -o seed.iso -hfs -joliet -iso -default-volume-name cidata .
cp seed.iso ../
```

./create-vm.sh 
./create-vm.sh

