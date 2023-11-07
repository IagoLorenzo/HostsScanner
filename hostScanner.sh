#!/bin/bash

#Colours
greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"

#Ctrl + c
function ctrl_c(){
	echo -e "${redColour}\n\n[!] Saliendo...\n${endColour}"
	tput cnorm; exit 1
}
trap ctrl_c SIGINT

#Scanner

tput civis

for i in $(seq 1 254); do
	timeout 1 bash -c "ping -c 1 192.168.1.$i" &>/dev/null && echo -e "${yellowColour}[+]${endColour}${greyColour} Host${endColour}${turquoiseColour} 192.168.1.$i${endColour}${greyColour} - ${endColour}${greenColour}ACTIVE${endColour}" &
done

wait

tput cnorm
