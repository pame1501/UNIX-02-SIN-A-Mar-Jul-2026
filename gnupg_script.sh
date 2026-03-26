uname -a #daba información del ordenador
which gpg #muestra ubicación del binario de gpg
gpg --version #muestra la versión y verifica que todo esté instalado
gpg --full-generate-key # genero la llave pública y privadausamos RSA por ser comptible y universal 4096 para dar complejidad
gpg --armor --export # exporta la llave pública
gpg --list-secret-keys --keyid-format=long # sirve para exportar la llave privada sec