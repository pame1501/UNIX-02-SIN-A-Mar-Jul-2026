17  mkdir registros
   18  mv kepler/docs kepler/registros
   19  mv docs registros
   20  ls -F
   21  mkdir plantillas
   22  ls -F
   23  git add .
   24  git commit -m "Fix problema 1: estructura de directorios corregida"
   25  history
   23  git add .
   24  git commit -m "Fix problema 1: estructura de directorios corregida"
   25  history
   26  mv sensores.log registros/
   27  mv ajustes.old ajustes.conf
   28  ls -F
   29  git add .
   30  git commit -m "Fix problema 2: archivos movidos y renombrados"
   31  history
    25  history
   26  mv sensores.log registros/
   27  mv ajustes.old ajustes.conf
   28  ls -F
   29  git add .
   30  git commit -m "Fix problema 2: archivos movidos y renombrados"
   31  history
   32  ls registros/
   33  history
   32  ls registros/
   33  history
   34  chmod 600 kepler/registros/sensores.log
   35  chmod 600 registros/sensores.log
   36  ls -l
   37  ls -l registros/sensores.log 
   38  git add .
   39  git commit -m "Fix problema 3: permisos numericos 600 en sensores.log"
   40  history