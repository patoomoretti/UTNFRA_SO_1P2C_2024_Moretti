#!/bin/bash

DIR=/home/vagrant/repogit/UTNFRA_SO_1P2C_2024_Moretti/RTA_ARCHIVOS_Examen_20241005/Filtro_Avanzado.txt
IP=$(curl -s ifconfig.me | awk -F 'v' '{print $1}')
HASH=$(sudo grep vagrant /etc/shadow | awk -F ':' '{print $2}')
USUARIO_GIT=$(git remote get-url origin)
USUARIO_VAGRANT=$(whoami)

cat << EOF > $DIR
Mi IP Publica es: $IP
Mi usuario es: $USUARIO_VAGRANT
EL hash del mi Usuario es: $HASH
La URL de mi repositorio es: $USUARIO_GIT
EOF

echo "Archivo Filtro Avanzado creado!"
