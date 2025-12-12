#!/bin/bash

echo "Vamos a jugar al ahorcado"
echo "LA PALABRA OCULTA TIENE 5 LETRAS"
echo "This Script is by Izan Patiño Martínez"
echo "---"
echo " "
oculta="arroz"
intentos=0
letras_correctas="_____"
echo "---"
letra1=$(echo "$palabra" | cut -c 1)
letra2=$(echo "$palabra" | cut -c 2)
letra3=$(echo "$palabra" | cut -c 3)
letra4=$(echo "$palabra" | cut -c 4)
letra5=$(echo "$palabra" | cut -c 5)

while [ $intentos -lt 10 ]; do
	echo " "
	read -p "Dime una letra -> " letra
	if [ ${#letra} -ne "1" ]; then
		echo "Tenias que decir solo una letra"
		exit 1 
	fi	
	if [[ "$oculta" == *"$letra"* ]]; then
        echo "¡Correcto! La letra '$letra' está en la palabra."
        
        # Actualizar las letras correctas
        for i in {0..4}; do
            if [ "${oculta:$i:1}" == "$letra" ]; then
            	echo "La letra '$letra' está en la posición $((i+1))"
                letras_correctas="${letras_correctas:0:$i}$letra${letras_correctas:$i+1}"
            fi
        done
    	else
        	echo "La letra '$letra' no está en la palabra."
        	((intentos++))
    	fi
	 echo "Te quedan $((10 - intentos)) intentos."

    # Comprobar si adivinó la palabra
if [ "$letras_correctas" == "$oculta" ]; then
	echo "---"
	echo "¡Felicidades! Has adivinado la palabra: $letras_correctas"
        exit 2
fi
done
echo "---"
echo "¡Perdiste! La palabra era: $oculta"
exit 0
