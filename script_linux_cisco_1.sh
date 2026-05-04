ls #The ls command displays a list of information about the files
aptitude moo #is a package management tool available in some versions of Linux. 
ls -l #  The -l option is added to the ls command to produce a “long” output, providing more information about each listed file and allowing you to view technical details that a simple list does not show.
pwd # We use this command to get information about the current working directory
cd # We can use `change directory` to switch directories and navigate the file system structure.
ls [OPCIONES] [ARCHIVO] # is used to obtain detailed information about files, such as file type, permissions, properties, or timestamps
ls -lt # The -t option will sort the files by their timestamp
ls -l -s #The -S (size) option will sort the files by file size
ls -l -r #Using only the -r option with the list of files in reverse alphabetical order
Permision commands
ls -l # >sample
#-rw-rw-rw-  1 codespace root        230 May  3 03:28 saludo.c
#The first character of this output indicates the file type.
# Permits are divided into three groups user/group/others
#A file or directory can have three different permissions: read, write, and execute. 
# READ : Allows the file's contents to be read or copied.
# WRITE: Allows you to modify or overwrite the contents of the file. Allows you to add or delete files in a directory.
# EXECUTE: Allows a file to act as a process, although script files will also require read permission.
