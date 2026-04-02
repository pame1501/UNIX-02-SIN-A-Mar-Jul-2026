cd /# Go to the change directory We navigate to the root directory
ls -F #is used to list the files in the current directory
Vmlinuz #refers to the Linux kernel
# initrd es el encargado de iniciar linux
# FHS is the Linux root directory structure
#Arranque de linux se divide en 3 fases:
# 1) carga del firmware
# -Power on self test
# -Busqueda del dispositivo de arranque
# -Busca la BIOS, MBR, UEFI
sudo apt update # Download an updated list of all available packages and their versions.
sudo apt upgrade # Download and install the latest versions of the programs you already have on your system.
sudo apt install parted # Download the files from the Ubuntu/Debian repositories and place them in the system folders
sudo parted -l && echo -e "\n---\n" && lsblk -f && echo -e "\n---\n"
#This command is a combination or shortcut for the following commands:
sudo parted -l# displays the disk layout and its total size, the partition table type, and a list of partitions with their start and end points and file systems
# * -e ensures that 'echo' is executed as a string and not as a command (always true; it is not evaluated)
lsblk -f # It displays a tree structure of your partitions and includes the following: FSTYPE: The file system format of each partition; UUID: The unique identifier of the partition; MOUNTPOINT: The exact folder where each disk is mounted.
