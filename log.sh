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
fi



