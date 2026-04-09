#The absolute path starts at the root /
mkdir #mkdir is used to create a directory
# relative path.- We can navigate to the project folder using cd /directory_name
#absolute path.- We use it to navigate directly to the root directory
#If I use `cd` + `Enter`, it takes me to the home directory no matter which directory I'm in
#We can also move to the home directory using `cd ~`
#Finally, we can navigate to a directory using `cd /directory_name`
#Environment variables are those that can be used anywhere in the environment
#We use `echo $directory_name` to navigate using environment variables
echo $HOME #Moves to the HOME directory
echo $BASH #We use this to move to the bin directory, where the binary executables are located
echo $PATH #Shows us all the possible directories we can navigate to
ls -lai # list files and folders
man ls # shows me the command options
ls --all # shows me all we have the directory, the hard links (the . and .. directories) that are present in every directory
. directory # “.” refers to the current directory
.. # is a relative link that points to the parent directory of the directory you are currently in.
