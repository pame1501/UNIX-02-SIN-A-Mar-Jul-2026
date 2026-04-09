sudo apt update
sudpo apt upgrade
sudo apt install -y git vim make gcc libncurses-dev flex bison bc cpio libelf-dev libssl-dev syslinux dosfstools qemu-system-x86 # instalación de librerías
git clone --depth 1 https://github.com/torvalds/linux.git # clona git
cd linux # nos movemos a la carpeta de linux
make menuconfig # se selecciona condifuración de 64 bits
make -j 2 # se ponen 2 cores para que trabaje compilando el kernel
