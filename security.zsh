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

