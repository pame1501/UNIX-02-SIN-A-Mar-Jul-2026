umask: #Displays the current mask (the default permissions).
touch file1 / mkdir directory1: #Creates a file and a directory with the default settings.
ls -l: #Lists the files to verify their permissions.
umask 027:# Sets the new mask (restricts permissions to the group and others).
apt update / apt install acl: #Updates the package manager and installs the ACL tool, necessary for managing advanced permissions.
chown -R $(whoami) .: #Changes the owner of all files in the current directory to the user currently logged in.
setfacl -bnR .: #This is the key command. It recursively removes all ACL rules and restores standard Linux behavior.
umask 077
