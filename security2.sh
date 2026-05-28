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