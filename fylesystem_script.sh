cd /dev # Change directory to the /dev directory
ls # List files and directories in the /dev directory
history # Display a list of previously entered commands
cd /proc # Real-time system and process information, directly from the terminal.
cat cpuinfo # Display detailed information about the processor (CPU).
#The mount points are located in /media
bin/ #contains binary files
var #variable data such as database files
gcc greeting.c -o greetingbin #creates a file in C and then converts it to binary; the -o stands for output to name the file
sudo mv saludobin /bin/ # moves the file to /bin so it can be executed from anywhere in the terminal
# the inode stores metadata; the file name is NOT stored in the inode
# pwd stands for print working directory
ls -F # lists files
/ # directory
* #file
@ #symbolic link
ls -i #shows the inodes
hard link # uses the same inode to create a sort of backup file as long as it remains within the same space, but if the original is deleted, the link breaks
# pointer: the variable points to the address
#sbin is for the superuser
#the Linux kernel is in the / directory
