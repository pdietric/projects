#!/bin/bash
#Author : pdietric
#Date   : 2022/01/20
#Version: 0.2
#This script adds a new partition and uses all the free space available
#USE WITH CAUTION! ONLY A DRAFT FOR TESTING PURPOSES!!!
echo -e "\033[31mImplementiert eine neue Festplatte komplett im System.\033[0m"
echo -e "\033[31mUSE WITH CAUTION! ONLY A DRAFT FOR TESTING PURPOSES!!!\033[0m"
echo "Do you want to continue?(yes/no)"
read input
if [ "$input" == "yes" ]
then
echo "continue"
else
exit 1
fi

disks_var=$(lsblk -r | grep disk | awk '{print $1}')
disks=($disks_var)  # split to array $names

lsblk

echo -n "Choose Disk:"
echo

for (( i=0; i<${#disks[@]}; i++ ))
do
    echo "$i: ${disks[$i]}"
done

read -r disk_option

selecteddisk=$(echo ${disks[$disk_option]})

echo "Disk $selecteddisk wurde ausgewählt."

echo "n
p
1


w" | fdisk /dev/$selecteddisk

echo ${selectedpvs}1
pvcreate ${selectedpvs}1
vgs
vg_var=$(vgs | awk '{print $1}'  | head -n -0 | tail -n+2)
vgs=($vg_var)  # split to array $names
echo -n "Choose Volume Group to extend:"
echo

for (( i=0; i<${#vgs[@]}; i++ ))
do
    echo "$i: ${vgs[$i]}"
done

read -r vg_option

selectedVG=$(echo ${vgs[$vg_option]})
echo "Volumegroup $selectedVG wurde ausgewählt."
vgextend $selectedVG /dev/${selecteddisk}1

filesys_var=$(df -h | grep dev | awk '{print $1}')
filesys=($filesys_var)  # split to array $names

df -h

echo -n "Choose Filesystem:"
echo

for (( i=0; i<${#filesys[@]}; i++ ))
do
    echo "$i: ${filesys[$i]}"
done

read -r filesys_option

selectedfilesys=$(echo ${filesys[$filesys_option]})
echo $selectedfilesys
echo "Filesystem $selectedfilesys wurde ausgewählt."
lvextend -l +100%FREE $selectedfilesys

resize2fs $selectedfilesys

echo "Erfolgreich"

df -h | grep $selectedfilesys
