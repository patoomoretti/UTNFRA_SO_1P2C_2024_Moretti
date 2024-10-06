#!/bin/bash

HASH=$(grep vagrant /etc/shadow | awk -F ':' '{print $2}')
DIR=/home/vagrant/repogit/UTNFRA_SO_1P2C_2024_Moretti/RTA_ARCHIVOS_Examen_20241005/validar.txt
GRUPO_ALUMNO=p1c2_2024_gAlumno
GRUPO_PROFESORES=p1c2_2024_gProfesores

ALUMNO_UNO=p1c2_2024_A1:alumno_1
ALUMNO_DOS=p1c2_2024_A2:alumno_2
ALUMNO_TRES=p1c2_2024_A3:alumno_3
PROFESORES=p1c2_2024_P1:profesores


sudo groupadd $GRUPO_ALUMNO
sudo groupadd $GRUPO_PROFESORES

sudo useradd -m -s /bin/bash -p "$HASH" -G $GRUPO_ALUMNO p1c2_2024_A1
sudo useradd -m -s /bin/bash -p "$HASH" -G $GRUPO_ALUMNO p1c2_2024_A2
sudo useradd -m -s /bin/bash -p "$HASH" -G $GRUPO_ALUMNO p1c2_2024_A3
sudo useradd -m -s /bin/bash -p "$HASH" -G $GRUPO_PROFESORES p1c2_2024_P1

echo "Alumnos y Profesor creados con sus respectivos grupos y contraseñas"



sudo chown -R p1c2_2024_A1 /Examenes-UTN/alumno_1
sudo chown -R p1c2_2024_A2 /Examenes-UTN/alumno_2
sudo chown -R p1c2_2024_A3 /Examenes-UTN/alumno_3
sudo chown -R p1c2_2024_P1 /Examenes-UTN/profesores

sudo chmod 750 p1c2_2024_A1 /Examenes-UTN/alumno_1
sudo chmod 760 p1c2_2024_A2 /Examenes-UTN/alumno_2
sudo chmod 700 p1c2_2024_A3 /Examenes-UTN/alumno_3
sudo chmod 775 p1c2_2024_P1 /Examenes-UTN/profesores


echo "Permisos cambiados"


cat << EOF >> validar.txt

EOF

echo "Archivo validar.txt fue creado"




USUARIOS=""
for i in ALUMNO_UNO ALUMNO_DOS ALUMNO_TRES PROFESORES
do
	SALIDA=$(sudo -su $i whoami) 
    	USUARIOS+="$SALIDA "
done



for user in ALUMNO_UNO ALUMNO_DOS ALUMNO_TRES PROFESORES
do
	CARPETA_ALUMNO=$(echo "$user" | awk -F ':' '{print $2}')
	USUARIO=$(echo "$user" | awk -F ':' '{print $1}')

	sudo -su $USUARIO bash -c "echo \"$USUARIOS\" > /Examenes-UTN/$CARPETA_ALUMNO/validar.txt"

done



