#!/usr/bin/env bash

PLAYER="@"
stty -echo -icanon time 0 min 0
tput civis
clear

cleanup() {
stty sane
tput cnorm
clear
exit
}
trap cleanup INT

# posiciones
declare -A cable_r cable_c
cable_r[1]=3; cable_c[1]=10
cable_r[2]=3; cable_c[2]=35
cable_r[3]=9; cable_c[3]=10
cable_r[4]=9; cable_c[4]=35

menu_r=6
menu_c=25

player_r=1
player_c=1

current_error=0
last_change=0

draw_box() {
local r=$1 c=$2 text=$3
tput cup $r $c; printf "+-----------+"
tput cup $((r+1)) $c; printf "| %-9s |" "$text"
tput cup $((r+2)) $c; printf "+-----------+"
}

draw_number() {
tput cup 13 20; printf "+-----------+"
tput cup 14 20; printf "| Numero: %-2s |" "$current_error"
tput cup 15 20; printf "+-----------+"
}

draw_map() {
clear
draw_box ${cable_r[1]} ${cable_c[1]} "Cable 1"
draw_box ${cable_r[2]} ${cable_c[2]} "Fibra 2"
draw_box ${cable_r[3]} ${cable_c[3]} "Par 3"
draw_box ${cable_r[4]} ${cable_c[4]} "Ethernet 4"
draw_box $menu_r $menu_c "Menu 5"
draw_number
}

draw_player() {
tput cup $player_r $player_c
printf "$PLAYER"
}

show_menu() {
clear
echo "=== MENU ==="
echo
echo "W A S D -> mover"
echo "Q -> salir del juego"
echo "E -> salir del menu"
while true; do
read -rsn1 k
[[ $k == "e" ]] && break
done
}

new_error() {
current_error=$((RANDOM % 4 + 1))
}

check_fix() {
[[ $current_error -eq 0 ]] && return
r=${cable_r[$current_error]}
c=${cable_c[$current_error]}
if [[ $player_r -ge $r && $player_r -le $((r+2)) &&
$player_c -ge $c && $player_c -le $((c+12)) ]]; then
current_error=0
fi
}

new_error

while true; do
now=$(date +%s)
if [[ $current_error -eq 0 && $((now-last_change)) -ge 4 ]]; then
new_error
last_change=$now
fi

draw_map
draw_player

read -rsn1 key
case "$key" in
w) ((player_r--)) ;;
s) ((player_r++)) ;;
a) ((player_c--)) ;;
d) ((player_c++)) ;;
q) cleanup ;;
esac

if [[ $player_r -ge $menu_r && $player_r -le $((menu_r+2)) &&
$player_c -ge $menu_c && $player_c -le $((menu_c+12)) ]]; then
show_menu
fi

check_fix
#sleep 0.05
done

exit 0 
