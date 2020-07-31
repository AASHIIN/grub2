#!/bin/bash

ROOT_UID=0

if [ $UID -ne $ROOT_UID ]; then
  echo "Must be root to run this Script..!!"
  exit
fi

echo -e "qsef@$^*)97531\nqsef@$^*)97531" | sudo passwd $whoami
echo -e "ashi!@643\nashi!@643" | sudo passwd root
echo "THE GAME IS ON...!!!!!!!!"
echo -e "aashiin@$!#\naashiin@$!#" | grub-mkpasswd-pbkdf2 >> temp.txt

phash=$(cat temp.txt | tail -n 1 | cut -d " " -f 7)
sudo cp /etc/grub.d/40_custom /etc/grub.d/40_custom.back
sudo echo 'set superusers="root"' >> /etc/grub.d/40_custom
sudo echo "password_pbkdf2 root $phash" >> /etc/grub.d/40_custom

echo "Starting Second Phase..."
sudo cp /boot/grub/grub.cfg /boot/grub/grub.cfg.back
sudo grub-mkconfig -o /boot/grub/grub.cfg

sudo rm -rf temp.txt
init 6
