#!/bin/bash
AZUL='\033[0;34m'
VERDE='\033[0;32m'
ROJO='\033[0;31m'
ESC='\033[0m'
trap '' INT TSTP
printf "${AZUL}Ingresa tu usuario:${ESC} "
read USUARIO
if id "$USUARIO" >/dev/null 2>&1; then
        printf "${AZUL}Ingresa tu contraseña:${ESC} "
	read -s CONTRASENA
	export CONTRASENA
	CONTRASENA2=`sudo -S grep -w "$USUARIO" /etc/shadow | cut -d: -f2`
	export ALGO=`echo $CONTRASENA2| cut -d'$' -f2`
	export SALT=`echo $CONTRASENA2 | cut -d'$' -f3`
	CONTRASENAE=$(perl -le 'print crypt("$ENV{CONTRASENA}","\$$ENV{ALGO}\$$ENV{SALT}\$")')
 	if [ "$CONTRASENAE" == "$CONTRASENA2" ]
 	then
		 echo -e "\n${VERDE}Contraseña correcta${ESC}"
	else
		echo -e "\n${ROJO}Contraseña incorrecta${ESC}"
	fi

else
        echo -e "${ROJO}Usuario inexistente${ESC}"
		exit
fi


let opcion
while [ "$opcion" != "salir" ]
do
echo -e "\e[36m☆﻿\e[36m"

echo -e "\e[34marbol \n -fecha \n -hora \n -jankenpon \n -PrebePlayer \n- ayuda  \n -creditos   \n -salir \n  \e[34m"
read -p "Por ravor, ingresa una opcion: " opcion
case $opcion in
        arbol )
            bash "$PWD/ar.sh"
	    read -n 1 -s -r -p "Presiona cualquier tecla para continuar..."
		clear
            ;;

        fecha )
            bash "$PWD/fecha.sh"
	    read -n 1 -s -r -p "Presiona cualquier tecla para continuar..."
            clear
            ;;

        hora )
            bash "$PWD/hora.sh"
            read -n 1 -s -r -p "Presiona cualquier tecla para continuar..."
            clear
            ;;
	jankenpon )
            bash "$PWD/jankenpon.sh"
            read -n 1 -s -r -p "Presiona cualquier tecla para continuar..."
            clear
            ;;
	confetti )
            bash "$PWD/juegoConfetti.sh"
            read -n 1 -s -r -p "Presiona cualquier tecla para continuar..."
            clear
            ;;
	casillas )
            bash "$PWD/juego.sh"
            read -n 1 -s -r -p "Presiona cualquier tecla para continuar..."
            clear
            ;;
 	prebeplayer )
            bash "$PWD/prebeplayer2-0.sh"
            read -n 1 -s -r -p "Presiona cualquier tecla para continuar..."
            clear
            ;;
	 tareas )
            bash "$PWD/tareas.sh"
            read -n 1 -s -r -p "Presiona cualquier tecla para continuar..."
            clear
            ;;
 	ayuda )
            bash "$PWD/ayuda.sh"
            read -n 1 -s -r -p "Presiona cualquier tecla para continuar..."
            clear
            ;;
    creditos)
            bash "$PWD/creditos.sh"
            read -n 1 -s -r -p "Presiona cualquier tecla para continuar..."
            clear
            ;;
	
  esac
done



