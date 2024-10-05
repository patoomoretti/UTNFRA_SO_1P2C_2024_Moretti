#!/bin/bash

MEMORIA_TOTAL=$(cat /proc/meminfo | grep -i "memtotal")
CHASSIS=$(sudo dmidecode -t chassis | grep -i -E "chassis|manufacturer")
DIR=/home/vagrant/repogit/UTNFRA_SO_1P2C_2024_Moretti/RTA_ARCHIVOS_Examen_20241005/Filtro_Basico.txt

cat << EOF >> $DIR 
$MEMORIA_TOTAL
$CHASSIS
EOF

echo "Filtro Basico creado"
