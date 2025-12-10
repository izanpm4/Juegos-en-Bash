#!/bin/bash

echo "Hola, vamos a jugar a un juego"
echo "El juego se trata de adivinar el número"
echo "Mucha suerte"
echo " "
nume=$(($RANDOM%100))
numero=$(($nume + 1 ))
echo "El número secreto esta entre el 1 y el 100"
i=0
adivina=0
while [ "$adivina" -ne $numero ]; do
	read -p "Di un número -> " adivina
	if [ $adivina -lt $numero ]; then
		echo "Di un número más grande"
	elif [ $adivina -gt $numero ]; then
		echo "Di un número más pequeño"
	fi
		((i=i+1))
		#echo "número de intentos -> $i"
		echo " "
done
echo "Bien!!! Has acertado el número!!!"
echo "número de intentos -> $i"

exit 0 
