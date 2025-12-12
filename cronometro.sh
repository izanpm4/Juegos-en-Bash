#!/bin/bash

contador=0
tiempo_correcto=10
echo "El objetivo es dejarlo en los 10 segundos exactos"
echo "---"
echo "Pulsa [k] para empezar"
read -p "Pulse la [ k ] -> " tecla

while [ "$tecla" != "k" ]; do
    read -p "Debes pulsar [k] -> " tecla
done

echo "Contando... Pulsa [k] de nuevo para detener"

# Comienza el conteo
while true; do
    read -t 1 stop
    if [ "$stop" == "k" ]; then
        break
    fi
    ((contador++))
done

echo " "
echo "Has contado $contador segundos"
echo "---"
if [ $tiempo_correcto == $contador ]; then
	echo "Genial has clavado el tiempo!!!"
else
	echo "Noooo!!! A la proxima lo consigues"
fi

exit 0 

