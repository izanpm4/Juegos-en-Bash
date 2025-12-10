#!/bin/bash

#This Script is by Izan Patiño Martínez

echo "Vamos a jugar al 3 en raya"
echo "Para jugar se necesitan 2 personas"
echo "---"
read -p "Dime el nombre del Jugador 1 -> " jugador1
read -p "Dime el nombre del Jugador 2 -> " jugador2
echo "---"
echo "$jugador1 -> Jugara con la [ X ]"
echo "$jugador2 -> Jugara con el [ O ]"
echo "---"
echo " "
c1=1; c2=2; c3=3
c4=4; c5=5; c6=6
c7=7; c8=8; c9=9

muestra_el_tablero () {
echo " ___________________________________ "
echo "|           |           |           |"
echo "|    $c1      |     $c2     |    $c3      |"
echo "|           |           |           |"
echo "|-----------|-----------|-----------|"
echo "|           |           |           |"
echo "|    $c4      |    $c5      |    $c6      |"
echo "|           |           |           |"
echo "|-----------|-----------|-----------|"
echo "|           |           |           |"
echo "|    $c7      |    $c8      |    $c9      |"
echo "|___________|___________|___________|"
echo " "
}
echo "Que empiece la partida:"
muestra_el_tablero
turno=1
while [ true ]; do
	if [ $turno -eq 1 ]; then
	       read -p "$jugador1 elige una casilla -> " casilla
	       ficha="X"
       else
	       read -p "$jugador2 elige una casilla -> " casilla
	       ficha="O"
	       echo "---"
	       
	fi
	 case $casilla in
        	1) [ "$c1" = "X" -o "$c1" = "O" ] && echo "Casilla ocupada" && continue
        	   c1=$ficha ;;
        	2) [ "$c2" = "X" -o "$c2" = "O" ] && echo "Casilla ocupada" && continue
        	   c2=$ficha ;;
        	3) [ "$c3" = "X" -o "$c3" = "O" ] && echo "Casilla ocupada" && continue
        	   c3=$ficha ;;
        	4) [ "$c4" = "X" -o "$c4" = "O" ] && echo "Casilla ocupada" && continue
        	   c4=$ficha ;;
        	5) [ "$c5" = "X" -o "$c5" = "O" ] && echo "Casilla ocupada" && continue
        	   c5=$ficha ;;
        	6) [ "$c6" = "X" -o "$c6" = "O" ] && echo "Casilla ocupada" && continue
          	   c6=$ficha ;;
        	7) [ "$c7" = "X" -o "$c7" = "O" ] && echo "Casilla ocupada" && continue
        	   c7=$ficha ;;
        	8) [ "$c8" = "X" -o "$c8" = "O" ] && echo "Casilla ocupada" && continue
        	   c8=$ficha ;;
        	9) [ "$c9" = "X" -o "$c9" = "O" ] && echo "Casilla ocupada" && continue
        	   c9=$ficha ;;
        	*) echo "Casilla inválida"; turno=$((turno==1?2:1)); continue ;;
    	 esac
	 muestra_el_tablero
	 turno=$(( turno == 1 ? 2 : 1 ))
 done

 exit 0 

