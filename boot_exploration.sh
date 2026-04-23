ls -a / ls --all # Lists everything, including hidden files
ls -l # Lists the directories and files I have
ls -h # Only shows the files in one folder
ls -l -a -h / ls -lah # Shows the list, the human-readable format, and hidden files; all hidden options
mkdir -- -rf # Used to create a directory named -rf
rmdir -- -rf # Used to remove a directory
ls --help # Shorter or summary help
man ls # Displays the full manual
n to navigate forward and N to navigate backward, para buscar usamos /la palabra a encontrar
depth = Create a shallow clone with a history truncated to the specified number of commits.
           Implies --single-branch unless --no-single-branch is given to fetch the histories
           near the tips of all branches. If you want to clone submodules shallowly, also pass
           --shallow-submodules
u = usuario  read
g = grupo    write
o = otros    excecute
- es un archivo
d es un directorio
l enlace simbólico
Change mode # There are two syntax versions: chmod user operator permission file
chmod +x script.sh   # Adds execute permissions to everyone because no user is specified
chmod u+x script.sh  # Adds execute permissions to the user
chmod o-r secret.txt # Removes read permissions from others
chmod u+rw, go-rwx private # Adds read and write permissions to the user, and removes read, write, and execute permissions from others
sudo chmod +x init # Contains the first process to be executed in the OS
sudo echo “Hello” > /etc/protected_file # Sudo doesn't work because it only acts on the command immediately following it
echo “Hello” | sudo tee /etc/protected_file > /dev/null # echo goes to standard output; using | tee gives me the standard output, which in this case is the terminal, and I redirect it to /dev/null
echo "Hola" | sudo tee /etc/archivo_protegido # displays the file's contents directly in the terminal and creates the file
sudo sh-c 'echo "chao" >> /etc/archivo_prolegido # Add the line “chao” to the end of a system file securely and with the correct permissions.
sudo -i # move to superuser or use sudo su or sudo su -
su - # move to root but use a password
rm -rf / # is used to delete all directories
echo “$HOME” # Expands the variable, displaying its contents
echo ‘$HOME’ # Prints the text, treating it as a variable
echo ‘#!/bin/sh’ > hello.sh # This means that whatever you enter will be interpreted by the sh shell
echo 'echo “Hello from my first script” >> hello.sh # Now you have a text file that contains: echo “Hello from my first script”.
cat hello.sh # You will see the line you wrote in the previous step on your terminal. This is how you confirm that the file was created correctly.
/hello.sh # Permission denied. This happens because, for security reasons, new files do not have permission to “run” as programs.
ls -l Hola.sh # Displays the contents of Hola.sh along with its permissions
chmod +x Hola.sh # Grants execute permissions
ls -l Hola.sh # Checks the assigned execute permissions
./Hola.sh # Moves to the .sh folder
ls /etc # Lists the files in /etc
touch /etc/test.txt # Creates a new file that displays “permission denied” because it lacks execute permission
mkdir ~/my_folder # Creates a folder named my_folder inside your home directory.
apt install cowsay # Does not allow me to install cowsay
