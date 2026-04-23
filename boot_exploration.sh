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
sudo sh-c 'echo "chao" >> /etc/archivo_prolegido #Add the line “chao” to the end of a system file securely and with the correct permissions.
sudo -i # move to superuser or use sudo su or sudo su -
su - # move to root but use a password
rm -rf / # is used to delete all directories
echo “$HOME” # Expands the variable, displaying its contents
echo ‘$HOME’ # Prints the text, treating it as a variable
