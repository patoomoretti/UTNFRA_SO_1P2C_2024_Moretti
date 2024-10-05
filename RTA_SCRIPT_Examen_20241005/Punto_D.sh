#!/bin/bash

echo "Creando Esctructura Asimetrica"

sudo mkdir -p /Estructura_Asimetrica/{correo/{carteros_{1..10},cartas_{1..100}},clientes/cartas_{1..100}}

cd /Estructura_Asimetrica

tree /Estructura_Asimetrica/ --noreport | pr -T -s' ' -w 80 --column 4

sudo rm -rf /Estructura_Asimetrica

echo "Se elimino todo"

ls /
