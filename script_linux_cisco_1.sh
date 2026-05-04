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
# Permits are divided into three groups user(u)/group(g)/others(o) or all (a)
#A file or directory can have three different permissions: read, write, and execute. 
# READ (r): Allows the file's contents to be read or copied.
# WRITE(w): Allows you to modify or overwrite the contents of the file. Allows you to add or delete files in a directory.
# EXECUTE(x): Allows a file to act as a process, although script files will also require read permission.
Change permission commands
chmod #is used to change the permissions of a file or directory. Only the root user or the file's owner can change a file's permissions.
chmod meaning #change access mode
# We can use the chmod command in octal mode and symbolic mode
Symbolic mode
# We use this structure chmod [<COJUNTO DE PERMISOS><ACCIÓN><PERMISOS>]... ARCHIVO
# The actions can be + - or =
# The permissions are specified after to action symbol
# example: chmod u+x hello.sh
Change the owner of a file (chown command)
# The `chown` command allows you to change the owning group, which can be done by the root user or the file's owner.
#We use this structure -  chown [OPTIONS] [OWNER] FILE
# Example:  sudo chown root hello.sh  
# We use sudo to obtain administrative privileges
File Viewer
cat # The `cat` command, which stands for “concatenate,” is often used to quickly view the contents of small files.
# We use this structure: cat [OPTIONS] [FILE]
# Using `cat` is not recommended if you need to view long text files, because it does not allow you to view them in sections.
# Examples of pagination commands include the `more` and `less` commands.
# Another way to view the contents of files is by using the head and tail commands
# that are used to view a selected number of lines from the top or bottom of a file
#These commands have the same structure as `cat`
# The -n option with the head and tail commands can be used to specify the number of lines to display.
# head -n number_of_lines file
Copy files
# We use this command to copy files: cp [OPTIONS] ORIGEN DESTINATION
# The cp command is similar to the mv command because both require a source and a destination
# Example: cp /etc/passwd . -> In this case . is the destination
#To copy a file, you must have execute permission to access the directory where the file is located and read permission for the file being copied.
dd command # The dd command is used to copy files or entire partitions at the bit level.
#Structure: dd [OPTIONS] OPERATING
# It can be used for:
#Clone or delete
#Copy raw data to removable devices such as USB drives or CD-ROMs.
#Back up and restore the MBR
#Create a file of a specific size filled with binary zeros as virtual memory
# The dd command uses special arguments such as
#if: The input file to be read. 
#of: The output file to be written to.
#bs: The block size to be used. By default, the value is expressed in bytes.
#count: The number of blocks to be read from the input file. It is not necessary to specify the block size here.