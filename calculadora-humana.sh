#!/bin/bash

echo "Vamos a comprobar que tan buen calculo matemático mental tienes"
echo "Tu puedes"
echo "---"
echo " "
preguntas=5
puntos=0
inicio=$(date +%s)
for i in $(seq 1 $preguntas)
do
	a=$((RANDOM % 10 + 1))
	b=$((RANDOM % 10 + 1))
	calculo=$((RANDOM % 4))
	if [ $calculo -eq "0" ]; then
		#calculo = cal
		cal="+"
		resultado=$((a + b))
	elif [ $calculo -eq "1" ]; then
		cal="-"
		resultado=$((a - b))
	elif [ $calculo -eq "2" ]; then
		cal="*"
		resultado=$((a * b))
	elif [ $calculo -eq "3" ]; then
		resultado=$((RANDOM % 10 + 1))
		b=$((RANDOM % 10 + 1))
		a=$((resultado * b))
		cal="/"
	fi
	echo "Cuanto es -> $a $cal $b"
	read -p "Respuesta -> " respuesta

	if [ "$respuesta" == "$resultado" ]; then
		echo "Correctooo!!!"
		((puntos++))
	else
		echo "Incorrecto!!! El resultado era -> $resultado"
	fi
	echo " "
done
fin=$(date +%s)
tiempo_total=$(($fin - $inicio))
echo " "
echo "---"
echo "Resultado -> $puntos / $preguntas"
echo "Tiempo total -> $tiempo_total segundos"

exit 0 
