# ============================================================================
#  Dockerfile — "receta" para construir la imagen del curso
# ============================================================================
#  Un Dockerfile es un archivo de texto con instrucciones paso a paso que
#  Docker (o Codespaces) lee de arriba hacia abajo para fabricar una
#  "imagen". Una imagen es como un molde congelado de un sistema Linux
#  listo para usar; cada vez que abres el Codespace, se crea un
#  "contenedor" a partir de ese molde.
#
#  Analogía: la imagen es el PLANO, el contenedor es la CASA construida
#  con ese plano. Puedes construir muchas casas iguales a partir de un
#  solo plano, y si destruyes una casa el plano sigue intacto.
#
#  Cada instrucción (FROM, ENV, RUN...) crea una "capa". Docker guarda
#  esas capas en caché: si no cambias las primeras líneas, no las
#  reconstruye y el siguiente build es casi instantáneo.
# ============================================================================


# ----------------------------------------------------------------------------
# FROM: imagen base sobre la que vamos a construir
# ----------------------------------------------------------------------------
# En lugar de partir de cero, partimos de la imagen oficial de Kali Linux
# en su versión "rolling" (actualización continua, siempre al día).
# Todo lo que instalemos más abajo se apila ENCIMA de esta base.
#---------------------------------------------------
#   BLOCK a: EXPLANATION TO BASE IMAGE
#---------------------------------------------------
# This instruction defines the base image for our development container. 
# Kali Linux is selected because it is a Debian-based distribution pre-packaged 
# with specialized tools, libraries, and dependencies essential for penetration 
# testing and security auditing (BHB Ch. 3, "Installing Kali").
# Docker images are built using a layered architecture, where each instruction 
# creates a new read-only layer. The execution order is critical because Docker 
# uses a layer caching system; if an early layer changes, all subsequent caches 
# are invalidated, making logical ordering essential for quick builds.
FROM kalilinux/kali-rolling:latest




# ----------------------------------------------------------------------------
# ENV: variables de entorno permanentes dentro del contenedor
# ----------------------------------------------------------------------------
# Las variables de entorno son "ajustes globales" que cualquier programa
# del sistema puede leer. Se escriben en MAYÚSCULAS por convención.
#
#   DEBIAN_FRONTEND=noninteractive
#     Le dice al instalador de paquetes (apt) "no me hagas preguntas
#     interactivas, asume respuestas por defecto". Sin esto, algunos
#     paquetes pausarían el build esperando que pulsemos una tecla y se
#     quedaría colgado para siempre (porque no hay nadie mirando).
#
#   LANG / LC_ALL=es_ES.UTF-8
#     Configuran idioma y codificación de caracteres. UTF-8 es lo que
#     permite que acentos, ñ, €, emojis, etc. se muestren bien.
#
#   TERM=xterm-256color
#     Le indica a los programas que la terminal admite 256 colores, para
#     que vim, nvim, htop, etc. se vean con todos sus colores.
#
# La barra invertida "\" al final de cada línea significa "esto continúa
# en la línea siguiente". Solo es para legibilidad.

#---------------------------------------------------
#   BLOCK b: Docker Layers, Image & Cache Concept
#---------------------------------------------------
# Docker images are built incrementally using a read-only layered filesystem 
# architecture where each instruction generates a distinct layer. Docker 
# implements a caching mechanism to reuse unmodified layers from previous builds. 
# The sequential order of instructions is critical; modifying an early instruction 
# invalidates its cache and forces all subsequent layers to rebuild from scratch.

#---------------------------------------------------
#   BLOCK c: EXPLANATION TO ENVIRONMENT
#---------------------------------------------------
# Environment variables are loaded into the shell session to alter program 
# behavior and system configurations (BHB Ch. 1, "Checking Environment Variables").
#  DEBIAN_FRONTEND=noninteractive avoids build blocks by suppressing prompt questions.
#  LANG and LC_ALL configure the default system locale, encoding, and character sets.
#  TERM specifies the type of terminal emulator capabilities to ensure proper color.
# In Docker's layered architecture, changing ENV variables creates a new layer. 
# Because Docker uses a sequential caching mechanism, instructions are ordered 
# with ENV variables near the top so that subsequent RUN instructions can leverage 
# these settings without accidentally invalidating the image cache during rebuilds.
ENV DEBIAN_FRONTEND=noninteractive \
    LANG=es_ES.UTF-8 \
    LC_ALL=es_ES.UTF-8 \
    TERM=xterm-256color


# ----------------------------------------------------------------------------
# Pre-respuesta a una pregunta interactiva de Wireshark
# ----------------------------------------------------------------------------
# Wireshark/tshark PREGUNTA durante su instalación si los usuarios
# normales (no-root) deben poder capturar paquetes. Como en el contenedor
# siempre somos root, respondemos "false" POR ADELANTADO usando
# debconf-set-selections para que no detenga el build esperando input.

# ---------------------------------------------------
# BLOCK d: Advanced Package Installation and Tooling
# ---------------------------------------------------
# Automated Docker builds cannot pause for manual user input during package installations. 
# Pre-seeding the debconf system with this specific configuration programmatically answers 
# the interactive question prompt for the 'wireshark-common' package. This ensures 
# non-superusers are granted packet-capturing capabilities silently and automatically, 
# preventing the build execution from hanging or failing due to terminal blockages.
RUN echo "wireshark-common wireshark-common/install-setuid boolean false" \
    | debconf-set-selections


# ----------------------------------------------------------------------------
# RUN: ejecutar comandos durante la construcción de la imagen
# ----------------------------------------------------------------------------
# Aquí instalamos TODO el software del curso en un solo RUN.
#
#   apt-get update          -> actualiza la lista de paquetes disponibles
#   apt-get install         -> descarga e instala los paquetes listados
#     -y                    -> responde "sí" automáticamente
#     --no-install-recommends -> instala SOLO lo esencial (no los extras
#                                sugeridos). Ahorra cientos de MB.
#
# ¿Por qué un solo RUN gigante y no 10 RUN pequeños?
# Porque CADA RUN crea una capa nueva en la imagen. Menos capas = imagen
# más pequeña, más rápida de construir y de descargar.
#
# El "&&" encadena comandos: ejecuta el siguiente SOLO SI el anterior
# terminó bien. Si algo falla, el build se detiene con error (que es lo
# que queremos: mejor un error claro que una imagen rota).

# ----------------------------------------------------
# BLOCK e: Advanced Package Installation and Tooling
# ----------------------------------------------------
# This instruction pipelines multiple system updates and security tools inside the container.
# - 'apt-get update' synchronizes repository metadata, whereas 'apt-get install' fetches the binaries.
# - The '-y' flag suppresses manual installation confirmations by auto-answering yes.
# - '--no-install-recommends' keeps the system lightweight by skipping optional dependencies.
# - Chaining commands with the logical '&&' operator guarantees that subsequent packages only install 
#   if the preceding command completes successfully without errors (BHB Ch. 2, "Linking Conditions").
# - The backslash '\' character acts as a line continuation escape to maintain clean syntax formatting (BHB Ch. 1).
# - Condensing all package activities into a single 'RUN' instruction drastically optimizes image size, 
#   as it creates only one image layer instead of multiple bulky filesystem snapshots.
# Essential utilities included for automated auditing, parsing, and pentesting workflows:
# - gawk, sed, grep: Native stream editors and regex filters used to scrub text outputs (BHB Ch. 2).
# - shellcheck: A static analysis compiler designed to catch logical syntax bugs in shell scripts.
# - nmap: A robust infrastructure scanning utility for open port discovery and reconnaissance.
# - tcpdump, tshark: Command-line sniffer utilities deployed to analyze raw network packet captures.
# - tor, proxychains4: Privacy wrappers to force shell traffic through anonymous network relays.
# - jq: A dedicated JSON parser useful when handling script API outputs (BHB Ch. 2).
# - man-db: Deploys manual pages to locally query documentation via the 'man' command (BHB Ch. 1).
RUN apt-get update && apt-get install -y --no-install-recommends \
    \
    # === Editores de texto y shells (intérpretes de comandos) ===
    neovim \
    vim \
    zsh \
    bash-completion \
    \
    # === Herramientas de 4ta generación ===
    # Estas son las protagonistas de las Unidades 2, 3 y 4:
    perl \
    make \
    gawk \
    sed \
    grep \
    \
    # === Utilidades básicas de UNIX ===
    # coreutils trae cat, ls, head, tail, sort, cut, tr, etc.
    # findutils trae find y xargs.
    # procps trae ps, top, kill (gestión de procesos).
    # less = paginador para leer archivos largos.
    # tree = muestra directorios como árbol.
    # jq = procesa JSON desde la línea de comandos.
    coreutils \
    findutils \
    procps \
    less \
    tree \
    jq \
    \
    # === Páginas de manual (comando `man`) ===
    # La imagen base de Kali viene sin documentación para
    # ahorrar espacio. La reinstalamos porque en el curso "man bash" o
    # "man grep" es material de consulta obligada.
    man-db \
    manpages \
    manpages-posix \
    \
    # === Red básica y utilidades de descarga ===
    curl \
    wget \
    git \
    git-lfs \
    ca-certificates \
    locales \
    \
    # === Linter (revisor automático de errores) para scripts Bash ===
    shellcheck \
    \
    # === Reconocimiento y escaneo de red ===
    # nmap = el escáner de puertos más famoso.
    # masscan = escaneo masivo de rangos grandes de IPs.
    nmap \
    masscan \
    \
    # === Captura y análisis de paquetes de red ===
    # tcpdump = capturador clásico por terminal.
    # tshark = versión de terminal de Wireshark.
    tcpdump \
    tshark \
    \
    # === Utilidades de red variadas ===
    netcat-traditional \
    socat \
    dnsutils \
    whois \
    traceroute \
    mtr-tiny \
    iproute2 \
    net-tools \
    iputils-ping \
    \
    # === Anonimato: Tor y similares ===
    # tor = cliente de la red Tor.
    # torsocks = "envoltorio" que hace pasar cualquier comando por Tor.
    # proxychains4 = encadena múltiples proxies.
    # obfs4proxy = ofusca el tráfico de Tor para evadir bloqueos.
    tor \
    torsocks \
    proxychains4 \
    obfs4proxy \
    \
    # === Cliente HTTP más legible que curl para aprender ===
    httpie \
    \
 # --- Después de instalar, activamos el idioma español ---
 # sed busca "# es_ES.UTF-8" en /etc/locale.gen y le quita el "#" para
 # activar esa línea. Luego locale-gen compila los archivos de idioma.

#--------------------------------------------
# BLOCK f: Regional Locale Configuration
# --------------------------------------------
# This instruction modifies the core system configuration to enable localized assets.
# It employs 'sed' with the '-i' (in-place) flag to perform a text substitution directly 
# inside the '/etc/locale.gen' configuration file without needing an external text editor 
# (BHB Ch. 2, "Stream Editing with sed"). By uncommenting the specific Spanish UTF-8 line 
# and subsequently executing 'locale-gen', the operating system builds and activates 
# support for Spanish encoding structures, formatting, and character sets. 
 && sed -i 's/# es_ES.UTF-8/es_ES.UTF-8/' /etc/locale.gen \
 && locale-gen \
 \
 # --- Limpieza final: reducir el tamaño de la imagen ---
 # apt deja archivos de caché que ya no necesitamos después de instalar.
 # Borrarlos aquí (en el mismo RUN) hace la capa final más pequeña.
 # Si los borráramos en otro RUN, seguirían ocupando en la capa anterior.

# =========================================================================
# Block g: Layer Optimization and Package Cache Cleanup
# =========================================================================
# This instruction cleans up downloaded package files and repository lists.
# 'apt-get clean' removes the accumulated local .deb installers, and
# 'rm -rf /var/lib/apt/lists/*' deletes the repository index metadata.
# Reason: According to BHB Ch. 3 (Docker image/layer architecture), every RUN 
# instruction creates a persistent layer. If we do not clean these temporary 
# files within the exact same RUN layer where they were created, they will 
# remain inside the final image structure, causing unnecessary bloat and 
# increasing the image size.
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*


# ----------------------------------------------------------------------------
# SHELL: qué intérprete usar en los siguientes RUN
# ----------------------------------------------------------------------------
# Por defecto Docker usa /bin/sh (un shell más limitado y antiguo). Lo
# cambiamos a bash por si agregamos más instrucciones con sintaxis
# moderna (arrays, [[ ]], etc.).

# =========================================================================
# Block h: Setting the Default Shell for Subsequent RUN Instructions
# =========================================================================
# By default, Docker executes instructions using the legacy standard shell 
# ["/bin/sh", "-c"]. This line overrides that behavior to use Bash instead.
# Reason: As covered in BHB Ch. 1 & Ch. 2, standard 'sh' lacks support for advanced 
# features like arrays, specific control operators, and advanced string evaluation. 
# Explicitly forcing Bash ensures that any subsequent RUN layers can safely 
# execute complex Bash syntax, conditional flows, and native pipeline features.
SHELL ["/bin/bash", "-c"]


# ----------------------------------------------------------------------------
# WORKDIR: directorio de trabajo al entrar al contenedor
# ----------------------------------------------------------------------------
# Codespaces siempre monta el código del repositorio en
# /workspaces/<nombre-del-repo>. Establecer /workspaces aquí hace que las
# terminales se abran cerca de nuestros archivos del curso.
WORKDIR /workspaces

# Configuración de Git para el contenedor:
# - safe.directory *: confía en cualquier repo montado (necesario porque
#   /workspaces/... tiene un UID distinto al de root dentro del container).
# - init.defaultBranch main: evita warnings de "master vs main" en git init.
# - pull.rebase false: merge por defecto al hacer pull (más intuitivo)
# - git lfs install --system: registra los hooks de LFS globalmente para
#   que, si un repo los necesita, funcionen sin sorpresas.
RUN git config --system --add safe.directory '*' \
 && git config --system init.defaultBranch main \
 && git config --system pull.rebase false \
 && git lfs install --system

# ----------------------------------------------------------------------------
# CMD: comando que se ejecuta por defecto al arrancar el contenedor
# ----------------------------------------------------------------------------
# Lanza una shell bash interactiva. Codespaces la sobrescribe con su
# propia terminal integrada de VS Code, pero es buena práctica dejarla
# definida para que la imagen sea usable también con Docker puro.
# Cambiar shell de login de root a zsh dentro de la imagen,
# para que chsh ya no haga falta y todo sea consistente.
RUN chsh -s /usr/bin/zsh root

# Prompt institucional para los y las estudiantes del curso
RUN cat >> /root/.zshrc <<'EOF'

# ===== Valida si un comando fue ejecutado correctamente =====
PROMPT='%F{cyan}[Pamela-Toapanta]%f %F{yellow}%1~%f %{?%F{green}√.%F{red}x %?%}%f %# '
EOF

CMD ["/usr/bin/zsh"]