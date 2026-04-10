sudo apt upgrade
sudo apt install -y git vim make gcc libncurses-dev flex bison bc cpio libelf-dev libssl-dev syslinux dosfstools qemu-system-x86 # install libraries
git clone --depth 1 https://github.com/torvalds/linux.git # clone git
cd linux # move to the linux folder
make menuconfig # select the 64-bit configuration
make -j 2 # assign 2 cores to work on compiling the kernel
Kernel: arch/x86/boot/bzImage is ready  (#1) # means that compilation is complete
sudo mkdir /boot-files # create a new folder
sudo cp arch/x86/boot/bzImage /boot-files/ # This command copies the Linux kernel you just compiled to the folder you created earlier.
cd .. # You are moving up one level in your system's directory tree.
git clone --depth 1 https://git.busybox.net/busybox # You are downloading the source code for BusyBox, an essential tool for creating minimal Linux systems.
cd busybox # move busybox folfer
make menuconfig # Important change: Go to Settings → Build Options and enable “Build static binary (no shared libs)”by pressing the spacebar. This prevents external library dependencies
make -j 2 #compila 
# Change config_TC=y to config_TC=n and wait for the final result Link to: m resolv
sudo mkdir /boot-files/initramfs #Install it in the initramfs directory

