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
# loop 4 It's like a hard drive, so that certain files are treated as storage space.
[ -d /sys/firmaware/efi ] && echo "UEFI" || echo "BIOS" # This command evaluates to true or false using the logical operators && and ||
# && and checks if A is true, then B is true, and prints “true”
#|| or It checks if A is true; if so, it prints true, but if A is false, it prints B
#2) BOOTLOADER:
# Grub2: is the standard used to load Linux into RAM
cat /etc/defalult/drub # is used to configure GRUB and is compiled with 'upgrade-grub'
#3) KERNEL:
# - Hardware detected
# - initramfs is the same as initrd
boot/ # files required to boot the operating system
lost+found/ # Recovered files
srv/ # Web server data
media/ # Where USB drives and CDs are automatically mounted
mnt/ # Manual temporary mounts
opt/ # Manually installed software
/run # Temporary files for currently running processes
#socket is a means of communication between programs
/tmp # It stores temporary files; these are located in RAM, so they are deleted when the program is restarted
file system # generates a block of files to avoid reading bit by bit and instead read in blocks
inode # is the file's unique identifier (like an ID number)
#Linux file systems
#ext4 uses inodes and blocks
#XFS optimizes large files
stat filename # is used to check the blocks, how many there are, and the block size