id # view the principal group
id -gn # only the name of principal group

#Create a file and see wich groups inherits
touch ~/test_grupo_heredado.txt 
ls -la ~/test_grupo_heredado.txt #is the user's primary group

#View the current group
id -gn
echo "Grupo actual: $(id -gn)"
#Create a file before newgrp
touch ~/antes_de_newgrp.txt
 ls -la ~/antes_de_newgrp.txt

#Install package to newgrp
apt update
apt upgrade
apt install -y apt-file && apt-file update
apt-file search /usr/bin/newgrp
apt install -y util-linux-extra
newgrp desarrolladores
id -gn # Verfify

#Create a file within subshell
touch ~/dentro_de_newgrp.txt
ls -la ~/dentro_de_newgrp.txt
# The current group is desarrolladores
#Create directory
 mkdir -p ~/proyecto_dev/src
 ls -la ~/

#proyecto_dev/ belongs group 'desarrolladores'
#exit to subshell newgrp
exit
# Verify return to original group
id -gn
echo "Grupo restaurado: $(id -gn)"

#Compare both files
ls -la ~/antes_de_newgrp.txt ~/dentro_de_newgrp.txt

#Create a group with a password
groupadd grupo_restringido
gpasswd grupo_restringido
#The system lost a password to the group

# A user who is NOT a member of the group can join temporarily if they know the password
newgrp grupo_restringido
# The system will ask for the group password
# If the password is correct, it is temporarily added
id-gn
exit # When you exit, your temporary membership expires