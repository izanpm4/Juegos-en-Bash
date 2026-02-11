#!/bin/bash

echo "Juego de la Oca"
echo "--------------------"
echo "63 casillas"
echo "Puentes: 6 y 12"
echo "Ocas: 5 9 14 18 23 27 32 36 41 45 50 54 59"
echo "Posada: 19"
echo "Dados: 26 y 56"
echo "Pozo: 31"
echo "Carcel: 52"
echo "Calavera: 58"
echo "--------------------"

read -p "Número de jugadores (1-4) -> " num_jugadores

if [ $num_jugadores -lt 1 ] || [ $num_jugadores -gt 4 ]; then
    echo "Número inválido"
    exit 1
fi

# ---------- FUNCIÓN MOVER (con rebote) ----------
mover() {
    local i=$1
    local pasos=$2

    posiciones[$i]=$((posiciones[$i] + pasos))

    if [ ${posiciones[$i]} -gt 63 ]; then
        exceso=$((posiciones[$i] - 63))
        posiciones[$i]=$((63 - exceso))
        echo "¡Te pasaste! Rebotas hasta ${posiciones[$i]} 🔁"
    fi
}
# -----------------------------------------------

# nombres y posiciones
for ((i=0; i<num_jugadores; i++)); do
    read -p "Jugador $((i+1)) -> " nombre
    jugadores[$i]=$nombre
    posiciones[$i]=0
done

echo
echo "¡Comienza el juego!"
echo

ganador=0

while [ $ganador -eq 0 ]; do
    for ((i=0; i<num_jugadores; i++)); do

        jugador=${jugadores[$i]}

        read -p "Turno de $jugador (ENTER para lanzar)"

        dado=$((RANDOM % 6 + 1))
        echo "Ha salido $dado"

        mover $i $dado
        casilla=${posiciones[$i]}

        echo "$jugador cae en la casilla $casilla"

        # --------- REGLAS ---------
        case $casilla in

            6)
                echo "Puente → saltas al 12 🌉"
                posiciones[$i]=12
                ;;
            12)
                echo "Puente → saltas al 6 🌉"
                posiciones[$i]=6
                ;;

            19)
                echo "Posada → descansas un turno 🏨"
                ;;

            26|56)
                echo "Dados → vuelves a tirar 🎲"
                dado=$((RANDOM % 6 + 1))
                echo "Nuevo dado: $dado"
                mover $i $dado
                ;;

            31)
                echo "Pozo → mala suerte... 🕳️"
                ;;

            52)
                echo "Carcel → quedas retenido ⛓️"
                ;;

            58)
                echo "Calavera → vuelves al inicio 💀"
                posiciones[$i]=0
                ;;

            63)
                echo "¡¡¡ $jugador GANA !!! 🏆"
                ganador=1
                break
                ;;
        esac

        # --------- OCAS ---------
        ocas=(5 9 14 18 23 27 32 36 41 45 50 54 59)

        for oca in "${ocas[@]}"; do
            if [ ${posiciones[$i]} -eq $oca ]; then
                echo "De oca a oca y tiro porque me toca 🦢"
                dado=$((RANDOM % 6 + 1))
                echo "Nuevo dado: $dado"
                mover $i $dado
            fi
        done

        echo "$jugador ahora está en ${posiciones[$i]}"
        echo "---------------------------"

    done
done

exit 0

