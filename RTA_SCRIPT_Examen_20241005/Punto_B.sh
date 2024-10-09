#!/bin/bash


echo "Particiono el disco"

sudo fdisk /dev/sdc << EOF
n
p
1

+1G
n
e
2


w

EOF

for (( i=0; i<8; i++ )); do
sudo fdisk /dev/sdc << EOF
n

+1G
w

EOF
sleep 1
done

sudo fdisk /dev/sdc << EOF
n


w

EOF




echo "Formateo el disco"

sudo mkfs -t ext4 /dev/sdc1

for (( i=5; i<14; i++ )); do
        sudo mkfs -t ext4 /dev/sdc${i}
        sleep 1
done




echo "Monto los discos"

echo "/dev/sdc1 /Examenes-UTN/profesores ext4 defaults 0 0" | sudo tee -a /etc/fstab
echo "/dev/sdc5 /Examenes-UTN/alumno_1/parcial_1 ext4 defaults 0 0" | sudo tee -a /etc/fstab
echo "/dev/sdc6 /Examenes-UTN/alumno_1/parcial_2 ext4 defaults 0 0" | sudo tee -a /etc/fstab
echo "/dev/sdc7 /Examenes-UTN/alumno_1/parcial_3 ext4 defaults 0 0" | sudo tee -a /etc/fstab
echo "/dev/sdc8 /Examenes-UTN/alumno_2/parcial_1 ext4 defaults 0 0" | sudo tee -a /etc/fstab
echo "/dev/sdc9 /Examenes-UTN/alumno_2/parcial_2 ext4 defaults 0 0" | sudo tee -a /etc/fstab
echo "/dev/sdc10 /Examenes-UTN/alumno_2/parcial_3 ext4 defaults 0 0" | sudo tee -a /etc/fstab
echo "/dev/sdc11 /Examenes-UTN/alumno_3/parcial_1 ext4 defaults 0 0" | sudo tee -a /etc/fstab
echo "/dev/sdc12 /Examenes-UTN/alumno_3/parcial_2 ext4 defaults 0 0" | sudo tee -a /etc/fstab
echo "/dev/sdc13 /Examenes-UTN/alumno_3/parcial_3 ext4 defaults 0 0" | sudo tee -a /etc/fstab


sudo mount -a
