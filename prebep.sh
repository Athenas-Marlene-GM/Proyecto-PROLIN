#!/bin/bash
NARANJA='\033[0;33m'
AZUL='\033[0;34m'
VERDE='\033[0;32m'
ROJO='\033[0;31m'
AMARILLO='\033[1;33m'
BLANCO='\033[1;37m'
CYAN='\033[0;36m'
ESC='\033[0m'
PURPURA='\033[0;35m'



EXISTE=$(which mpg123)
if [ "$EXISTE" == "" ] 
then
	echo -e "${ROJO} Se intalará mpg123${ESC}"
	sudo apt-get install mpg123
fi

if [ -d ~/Música ]
then
  	DIR_MUSICA=~/Música
else
	if [ -d ~/Music ]
	then
		DIR_MUSICA=~/Music
	else
		echo -e "${ROJO}No se encontró la carpeta predeterminada, por favor ingrese el directorio de la carpeta a utilizar${ESC}"
		AUX=0
		while [ $AUX == 0 ]
		do
			read -e $DIR_MUSICA
			if [ -d DIR_MUSICA ]
			then
				AUX=1
			else
				echo "${ROJO} No existe el directorio${ESC}"
			fi
		done
	fi
fi
 

titulo_reproductor(){
	echo -e "\n${BLANCO}       :::::::::   :::::::::   ::::::::::  :::::::::   ::::::::::     :::::::::   :::            :::    :::   :::  ::::::::::  ::::::::: ";
	echo -e "      :+:    :+:  :+:    :+:  :+:         :+:    :+:  :+:            :+:    :+:  :+:          :+: :+:  :+:   :+:  :+:         :+:    :+: ${ESC}";
	echo -e "${CYAN}     +:+    +:+  +:+    +:+  +:+         +:+    +:+  +:+            +:+    +:+  +:+         +:+   +:+  +:+ +:+   +:+         +:+    +:+ ";
	echo -e "    +#++:++#+   +#++:++#:   +#++:++#    +#++:++#+   +#++:++#       +#++:++#+   +#+        +#++:++#++:  +#++:    +#++:++#    +#++:++#: ${ESC}";
	echo -e "${AZUL}   +#+         +#+    +#+  +#+         +#+    +#+  +#+            +#+         +#+        +#+     +#+   +#+     +#+         +#+    +#+ ";
	echo -e "  #+#         #+#    #+#  #+#         #+#    #+#  #+#            #+#         #+#        #+#     #+#   #+#     #+#         #+#    #+# ${ESC}";
	echo -e "${AZUL} ##          ###    ###  ##########  #########   ##########     ###         ########## ###     ###   ###     ##########  ###    ### ${ESC}";

	
}
opciones(){
	echo -e "\n${ROJO}******************************************************************************************************************************************${ESC}";
	echo -e " ${AMARILLO}Directorio de reproduccion actual: $DIR_MUSICA ${ESC}"
	echo -e "${ROJO}*******************************************************************************************************************************************${ESC}";
	echo -e "                                                                  Opciones\n";
	echo -e "                                     ${CYAN}1)Reproducir la lista que se encuentra en el directorio actual"
	echo -e "                                                          2)Cambiar de directorio"
	echo -e "                                              3)Ver lista de caciones del directorio actual"
	echo -e "                                                   4)Elegir canción del directorio actual"
	echo -e "                                                          5)Salir del prebeplayer${ESC}"
}
comandos(){
	echo -e "\n${ROJO}******************************************************************************************************************************************${ESC}";
	echo -e " ${AMARILLO}Directorio de reproduccion actual: $DIR_MUSICA ${ESC}"
	echo -e "${ROJO}*******************************************************************************************************************************************${ESC}";
	echo -e "                                                     Comandos de reproduccion basicos";
	echo -e "                                         ${NARANJA}=====================================================${ESC}";
	echo -e "                                          ${AZUL}[ |< ]  [ << ]   [ >| ]  [ >> ]  [ >| ] Vol: [+] [-] ${ESC} ";
	echo -e "                                           ${CYAN}[d]     [,]     [s]o[]    [.]     [f]       [+] [-]${ESC}";
	echo -e "                                         ${NARANJA}=====================================================${ESC}";
	echo -e "                                                         ${CYAN}[h]${ESC} ${AZUL}Ver más comandos${ESC}";
	echo -e "                                                     ${CYAN}[q]${ESC} ${AZUL}Salir de la opcion actual${ESC}";

}
cd $DIR_MUSICA
while :
do
clear
titulo_reproductor
opciones
read OP
case $OP in 
	1)
	        clear
		titulo_reproductor
		comandos
		mpg123 -q $DIR_MUSICA/*.mp3
	;;
	2)
		clear
		echo -e "${VERDE}Ingresa el nuevo directorio (desde la raiz): ${ESC}"
		DIR_MUSICA2=$DIR_MUSICA
		read -e DIR_MUSICA
		if [ -d $DIR_MUSICA ]
		then
			echo -e "${VERDE}El nuevo directorio es $DIR_MUSICA ${ESC}"
		else	
			echo -e "${ROJO}No existe el directorio, se conservará el directorio anterior\n ${ESC}"
			DIR_MUSICA=$DIR_MUSICA2
		fi
		read -s -n 1 -p "Presiona alguna tecla para salir..."
		
		
	;;
	3)
		clear
		echo -e "${PURPURA}\n******************************************************************************************************************************************";
		echo -e " Directorio de reproduccion actual: $DIR_MUSICA"
		echo -e "*******************************************************************************************************************************************${ESC}";
		echo -e "${AZUL}\nLista de canciones${ESC}"
		basename -a $DIR_MUSICA/*.mp3
		echo ""
		read -s -n 1 -p "Presiona alguna tecla para salir..."
	;;
	4)
		clear
		printf "${VERDE}Ingresa el nombre de la cancion que quieres reproducir: ${ESC}"
		read NOMBRE_C
		clear
               titulo_reproductor
		comandos
		case "$NOMBRE_C" in  
     		*\ * )
           		mpg123 -q $DIR_MUSICA/"$NOMBRE_C".mp3
          	;;
       	*)
           		mpg123 -q $DIR_MUSICA/$NOMBRE_C.mp3
           	;;
		esac		
		
	;;
	5)
		clear
		exit
	;;
	*)
		echo "opcion invalida"
	;;
	esac
done

