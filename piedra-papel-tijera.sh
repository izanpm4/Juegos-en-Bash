#!/bin/bash

#This Script is by Izan Patiño Martínez
echo "Vamos a hacer este famoso juego"
echo "---"
echo "Para jugar tienes que seleccionar una de las 3 opciones"
echo "Opciones -> [ Piedra ] [ Papel ] [ Tijera ]"
echo " "
echo "---"
maq=$(($RANDOM%3))
maquina=$(($maq + 1))
echo "1 -> Piedra"
echo "2 -> Papel"
echo "3 -> Tijera"
echo "---"
read -p "Que número eliges -> " num
while [ $num != "1" -a $num != "2" -a $num != "3" ]; do
	echo "---"
	echo "Has elegido un número incorrecto"
	read -p "Selecciona un número correcto -> " num
done
echo " "
if [ $num == "1" ]; then
	echo "Has elegido [ Piedra ]"
elif [ $num == "2" ]; then
	echo "Has elegido [ Papel ]"
elif [ $num == "3" ]; then
	echo "Has elegido [ Tijera ]"
fi
if [ $maquina == "1" ]; then
	echo "La maquina ha elegido [ Piedra ]"
elif [ $maquina == "2" ]; then
	echo "La maquina ha elegido [ Papel ]"
elif [ $maquina == "3" ]; then
	echo "La maquina ha elegido [ Tijera ]"
fi
echo "---"
if [ $num == $maquina ]; then
	echo "Habeis empatado"
else
	if [ $num == "1" ] && [ $maquina == "3" ]; then
		echo "Has ganado"
	elif [ $num == "2" ] && [ $maquina == "1" ]; then
		echo "Has ganado"
	elif [ $num == "3" ] && [ $maquina == "2" ]; then
		echo "Has ganado"
	else
       		echo "Has perdido"
	fi
fi
exit 0 

