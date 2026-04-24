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
   git checkout -b eval_p2_1_g2 upstream/eval_p2_1_g2
    4  git push origin eval_p2_1_g2
    5  mv kepler/docs kepler/registros
    6  ls -F kepler
    7  ls -a
    8  ls -F kepler/
    9  ls -F evaluation/
   10  ls -F kepler/
   11  cd kepler
   12  cd kepler/
   13  mv docs registros
   14  cd evaluation
   15  cd kepler
   16  mv kepler/docs kepler/registros
   17  mkdir registros
   18  mv kepler/docs kepler/registros
   19  mv docs registros
   20  ls -F
   21  mkdir plantillas
   22  ls -F
   23  git add .
   24  git commit -m "Fix problema 1: estructura de directorios corregida"
   25  history
   26  mv sensores.log registros/
   27  mv ajustes.old ajustes.conf
   28  ls -F
   29  git add .
   30  git commit -m "Fix problema 2: archivos movidos y renombrados"
   31  history
   32  ls registros/
   33  history
   34  chmod 600 kepler/registros/sensores.log
   35  chmod 600 registros/sensores.log
   36  ls -l
   37  ls -l registros/sensores.log 
   38  git add .
   39  git commit -m "Fix problema 3: permisos numericos 600 en sensores.log"
   40  history
   41  git commit -m "Fix problema 3: permisos numericos 600 en sensores.log"
   42  chmod u+x runner.sh
   43  chmod o-w ajustes.conf
   44  ls -l
   45  git add .
   46  git commit -m "Fix problema 4: permisos simbolicos corregidos"
   47  chmod u+s runner.sh
   48  ls -l
   49  git add .
   50  git commit -m "Fix problema 5: SUID activado en runner.sh"
   51  chmod +t /tmp/kepler_zone
   52  exit
   53  cd evaluation
   54  mkdir -p /tmp/kepler_zone
   55  chmod +t /tmp/kepler_zone
   56  git add .
   57  git commit -m "Fix problema 6: sticky bit en /tmp/kepler_zone"
   58  history
   1  git fetch upstream
    2  git checkout -b eval_p2_1_g1 upstream/eval_p2_1_g1
    3  git checkout -b eval_p2_1_g2 upstream/eval_p2_1_g2
    4  git push origin eval_p2_1_g2
    5  mv kepler/docs kepler/registros
    6  ls -F kepler
    7  ls -a
    8  ls -F kepler/
    9  ls -F evaluation/
   10  ls -F kepler/
   11  cd kepler
   12  cd kepler/
   13  mv docs registros
   14  cd evaluation
   15  cd kepler
   16  mv kepler/docs kepler/registros
   17  mkdir registros
   18  mv kepler/docs kepler/registros
   19  mv docs registros
   20  ls -F
   21  mkdir plantillas
   22  ls -F
   23  git add .
   24  git commit -m "Fix problema 1: estructura de directorios corregida"
   25  history
   26  mv sensores.log registros/
   27  mv ajustes.old ajustes.conf
   28  ls -F
   29  git add .
   30  git commit -m "Fix problema 2: archivos movidos y renombrados"
   31  history
   32  ls registros/
   33  history
   34  chmod 600 kepler/registros/sensores.log
   35  chmod 600 registros/sensores.log
   36  ls -l
   37  ls -l registros/sensores.log 
   38  git add .
   39  git commit -m "Fix problema 3: permisos numericos 600 en sensores.log"
   40  history
   41  git commit -m "Fix problema 3: permisos numericos 600 en sensores.log"
   42  chmod u+x runner.sh
   43  chmod o-w ajustes.conf
   44  ls -l
   45  git add .
   46  git commit -m "Fix problema 4: permisos simbolicos corregidos"
   47  chmod u+s runner.sh
   48  ls -l
   49  git add .
   50  git commit -m "Fix problema 5: SUID activado en runner.sh"
   51  chmod +t /tmp/kepler_zone
   52  exit
   53  cd evaluation
   54  mkdir -p /tmp/kepler_zone
   55  chmod +t /tmp/kepler_zone
   56  git add .
   57  git commit -m "Fix problema 6: sticky bit en /tmp/kepler_zone"
   58  history
   59  cat > /tmp/mi_llave.batch <<'EOF'
%no-protection
Key-Type: RSA
Key-Length: 2048
Name-Real: vega
Name-Email: vega@kepler.lab
Expire-Date: 0
%commit
EOF

   60  gpg --batch --generate-key /tmp/mi_llave.batch
   61  gpg --encrypt --recipient vega@kepler.lab --output registros/sensores.log.gpg registros/sensores.log
   62  ls -R
   63  gpg --encrypt --recipient vega@kepler.lab --output registros/sensores.log.gpg registros/sensores.log
   64  git add .
   65  git commit -m "Fix problema 7: llave GPG generada y sensores.log cifrado"
   66  gpg --clearsign --output ajustes.conf.asc ajustes.conf
   67  gpg --detach-sign --output runner.sh.sig runner.sh
   68  git add .
   69  cd kepler
   70  gpg --clearsign --output ajustes.conf.asc ajustes.conf
   71  gpg --detach-sign --output runner.sh.sig runner.sh
   72  git add .
   73  git commit -m "Fix problema 8: firmas GPG corregidas y creadas"
   74  cd ..
   75  ./calificar.sh kepler
   76  history