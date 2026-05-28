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