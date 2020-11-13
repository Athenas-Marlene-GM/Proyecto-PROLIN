#!/bin/bash

trap '' 2 
trap "" TSTP 

echo -e "Has seleccionado buscar fichero \n "

echo -e " \n ¿Dónde quiere que se realice la búsqueda? \n "

echo -e "1.- Buscar en el directorio actual:\n" pwd

echo -e "2.- Buscar en otra direccion\n"



echo -e "Selecciona una opción: \n" 
read OPCION 


case $OPCION in 
	1) 
	clear
	echo -e "*************************************\n"
	echo -e "************BUSCAR*******************\n"
	echo -e "*************************************\n"
	echo -e "DIRECTORIO ACTUAL\n"
	
	echo -e "Ingresa archivo a buscar: \n"

	read ARCHIVO 

	if ls | egrep $ARCHIVO 

	then 
		echo -e "\n Tu archivo está en la direccion actual:  `pwd`/$ARCHIVO"

	else 
		echo -e " \n No fue encontrado\n";  
	fi 
	;;
	
	2)
	clear
	echo -e "*************************************\n"
	echo -e "************BUSCAR*******************\n"
	echo -e "*************************************\n"
	echo -e "OTRO DIRECTORIO\n"
	
	echo -e "Ingresa archivo a: \n"
	read ARCHIVO 
	
	echo -e "\n Ingresa ruta donde quieras buscar: "
	read DIRECTORIO 
	if ls $DIRECTORIO | egrep $ARCHIVO
	then
		echo -e "\nTu archivo estaba en : $DIRECTORIO/$ARCHIVO\n"
		

	else
		echo -e "Eror 404: File not found "
	fi
	;; 
	
	
	*) 
	echo -e "Error"
	;;
	
esac
