umask: #Displays the current mask (the default permissions).
touch file1 / mkdir directory1: #Creates a file and a directory with the default settings.
ls -l: #Lists the files to verify their permissions.
umask 027:# Sets the new mask (restricts permissions to the group and others).
apt update / apt install acl: #Updates the package manager and installs the ACL tool, necessary for managing advanced permissions.
chown -R $(whoami) .: #Changes the owner of all files in the current directory to the user currently logged in.
setfacl -bnR .: #This is the key command. It recursively removes all ACL rules and restores standard Linux behavior.
umask 077# Sets a restrictive mask that removes all permissions for the group and other users.
touch secret.txt# Creates a file that can only be read and edited by the owner (permissions 600).
mkdir private: Creates a directory that only the owner can access to view its contents (permissions 700).
ls -l #Lists the files and folders to verify that the permissions were applied correctly.
umask 022 #Changes the mask to a standard setting, allowing other users to read but not modify new files.
#Create a file as a normal user
whoami # Displays the name of the user currently logged in to the system (in the image, it is “alberto”).
echo “Hola” > mi_archivo # Creates a file named ‘my_file’ and writes the word “Hello” into it.
ls -l my_file # Lists detailed information about the file to see who owns it and what permissions it has.
useradd -m -s /usr/bin/zsh luna # Creates a new user named “luna,” assigns them a home directory (-m), and sets the default shell to Zsh (-s).
chown luna my_file # Changes the file's owner so that it now belongs to “luna” instead of “alberto”.
groups # Displays the groups to which the current user belongs (in this case, the user belongs only to the root group).
groupadd test_group #Creates a new group on the system named test_group.
groups #Run this command again to verify group membership; note that the current user still belongs only to the root group because creating a group does not automatically add you to it.
touch comun # Creates an empty file named comun in the current directory.
ls -l comun # Displays the details of the created file, confirming that the owner is root and the associated group is also root.
 usermod -a -G test_group luna # Adds (-a) the user luna to the supplementary group (-G) named test_group without removing her from her current groups.
chgrp test_group comun # Changes the group associated with the comun file from the root group to the test_group.
ls -l comun # Displays the file details, confirming that although the owner is still root, the group with permissions on the file is now test_group.
chown luna: # grupo_test mi_archivo: Simultaneously changes the owner to luna and the group to grupo_test for the specified file.
ls -l mi_archivo: # Verifies the change; the file now shows luna as the owner and grupo_test as the group with access rights.
usermod -aG grupo_test $USER: # You attempted to add your current user to the group, but the system displayed the help menu because of a syntax error or missing privileges.
mkdir -p proyecto/sub: # Creates the directory structure including parent directories if they don't exist; it creates "proyecto" and the "sub" folder inside it simultaneously.
touch proyecto/readme proyecto/sub/datos: #Creates two empty files at once in different paths: "readme" in the main folder and "datos" inside the subfolder.
chown -R luna:grupo_test proyecto: #Recursively (-R) changes the owner to luna and the group to grupo_test for the "proyecto" folder and everything inside it.
ls -lR proyecto: Performs a recursive long listing, showing that every file and subfolder now belongs to luna and grupo_test.
id # numeric user ID, primary group, secondary groups
cat/etc/passwd | head -10 # View all system users
groups # Which group does the current user belong to?
groups $USER 

id -u # user ID
id -g # Principal group id
id -G # All group

cat /etc/group | grep root #grep is responsible for filtering based on the adjacent word
mkdir ~/proyecto_unix/ #Create the “proyecto_unix” directory in the Home folder
ls -la ~/proyecto_unix/ #list files on proyecto_linux

sudo grupadd desarrolladores # create a simple group
sudo groupadd -g 2000 opreaciones # Create group with a specific GID
groupadd --system servicios_web # GID >1000

grep "desarrolladores\|operaciones\|sevicios_web" # Verify creation
 grep -E "desarrolladores|operaciones|servicios_web" /etc/group
groupadd --help

grep "GID_MIN\|GID_MAX\|SYS_GID" /etc/login.defs #command to view the range of GIDs on the system

#Create groups with addgroups
addgroup diseno 
addgroup --gid 2100 marketing 
addgroup --system cache_web 
grep "diseno\|marketing\|cache_web" /etc/group #verify