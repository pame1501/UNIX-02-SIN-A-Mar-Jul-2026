id # view the principal group
id -gn # only the name of principal group

#Create a file and see wich groups inherits
touch ~/test_grupo_heredado.txt 
ls -la ~/test_grupo_heredado.txt #is the user's primary group
