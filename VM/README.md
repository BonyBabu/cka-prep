Download Ubuntu live server from iso from [ubuntu](https://cloud-images.ubuntu.com/noble/current/noble-server-cloudimg-amd64.img)

Install qemu
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
# copy seed.iso to the folder with script create-vm.sh
cp seed.iso ../
```

```
./create-vm.sh 
```


```code
ubuntu login: ubuntu
Password:
Welcome to Ubuntu 24.04.4 LTS (GNU/Linux 6.8.0-100-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/pro

 System information as of Tue Feb 17 13:27:00 UTC 2026

  System load:           0.1
  Usage of /:            70.4% of 2.35GB
  Memory usage:          4%
  Swap usage:            0%
  Processes:             93
  Users logged in:       0
  IPv4 address for ens3: 10.0.2.15
  IPv6 address for ens3: fec0::5054:ff:fe12:3456


Expanded Security Maintenance for Applications is not enabled.

0 updates can be applied immediately.

Enable ESM Apps to receive additional future security updates.
See https://ubuntu.com/esm or run: sudo pro status


To run a command as administrator (user "root"), use "sudo <command>".
See "man sudo_root" for details.
```

