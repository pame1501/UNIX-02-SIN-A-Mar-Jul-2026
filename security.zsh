umask
touch archivo1
mkdir directorio1
ls -l
umask 027
touch archivo2
mkdir directorio2
ls -l
apt update
apt install acl
chown -R $(whoami) .
setfacl -bnR .