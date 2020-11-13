#!/bin/bash

AZUL='\033[0;34m'
VERDE='\033[0;32m'
ROJO='\033[0;31m'
ESC='\033[0m'
trap '' INT TSTP
printf "${AZUL}Ingresa tu usuario:${ESC} "
read -e USUARIO
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

echo -e "${ROJO}************************************************************${ESC}\n";
echo -e "${ROJO}****************P R E B E S H E L L*************************${ESC}\n";
echo -e "${ROJO}************************************************************${ESC}\n"; 


echo -e "${VERDE} \n -arbol \n -fecha \n -hora \n -infosys\n -prebeplayer \n -ahorcado \gato \n- ayuda \n -Buscar  \n -creditos   \n -salir \n  ${ESC}"
read -p  "Por ravor, ingresa una opcion:  " opcion

case $opcion in
        arbol )
            bash "$PWD/arbol.sh"
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
	infosys )
            bash "$PWD/infosys.sh"
            read -n 1 -s -r -p "Presiona cualquier tecla para continuar..."
            clear
            ;;
	buscar )
            bash "$PWD/buscar.sh"
            read -n 1 -s -r -p "Presiona cualquier tecla para continuar..."
            clear
            ;;
	ahorcado )
            bash "$PWD/ahorcado.sh"
            read -n 1 -s -r -p "Presiona cualquier tecla para continuar..."
            clear
            ;;
    gato )
            bash "$PWD/gatoC.sh"
            read -n 1 -s -r -p "Presiona cualquier tecla para continuar..."
            clear
            ;;
 	prebeplayer )
            bash "$PWD/prebep.sh"
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



