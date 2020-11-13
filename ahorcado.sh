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
CUERPO=$VERDE
OP_ESTADO=1
LETRA='A'
PALABRAS=('perro' 'gato' 'conejo' 'caballo' 'mamifero' 'ave' 'reptil' 'asustado' 'alegre' 'pensar' 'caminar' 'linux' 'dormir' 'ferrocarril' 'estudiante' 'maestro' 'television' 'windows' 'amistad' 'dados' 'violin' 'piano' 'cubo' 'piramide' 'arbol' 'flor' 'celular' 'artificial' 'natural' 'inteligencia' 'extraterrestre' 'murcielago' 'cuadrilatero' 'armamento' 'felino' 'supinacion' 'pronacion' 'adyacente' 'hielo' 'hiel' 'lastimero' 'lacerar' 'languido' 'aumentar' 'resfriar' 'auxiliar' 'morir' 'vivir' 'ilusion' 'athenas' 'cineasta' 'escualido' 'dosificar' 'adivinanza' 'entender' 'vastago' 'estratosfera' 'camaleon');
palabra_a_adivinar(){
	NUM_PALABRA=$((RANDOM % ${#PALABRAS[*]})) 
	PALABRA=${PALABRAS[NUM_PALABRA]}
	AUX=0
	LIM=${#PALABRA}

	while [ $AUX -lt $LIM ]
	do
		AR_PALABRA[AUX]="${PALABRA:AUX:1}"
		echo ${AR_PALABRA[AUX]}
		let AUX=AUX+1
	done
}
comparar(){
	AUX=0
	NINGUNA_CORRECTA=0;
	while [ $AUX -lt $LIM ]
	do
		if [ "$LETRA" == "${AR_PALABRA[AUX]}" ]
		then
			if [ "${COMPROBADO[AUX]}" == 0 ]
			then
				COMPROBADO[AUX]=1
				let AUX2=AUX2+1
				echo "si"
			fi
		else
			let NINGUNA_CORRECTA=NINGUNA_CORRECTA+1
		fi
		let AUX=AUX+1
		
	done
	if [ $NINGUNA_CORRECTA == $LIM ]
	then
		let OP_ESTADO=OP_ESTADO+1	
	fi
}
imprimir(){
	AUX=0
	echo ""
	printf "                  "
	while [ $AUX -lt $LIM ]
	do
		
		if [ "${COMPROBADO[AUX]}" == 1 ]
		then
			printf "${AR_PALABRA[AUX]}"
		else
			printf "_"
		fi
		let AUX=AUX+1
	done
}
inicio_comprobado(){
	echo "comprobando"
	AUX=0
	while [ $AUX -lt $LIM ]
	do
		COMPROBADO[AUX]=0
		let AUX=AUX+1
		echo "comprobando"
	done
}
comprobacion_fin(){
	if [ $AUX2 == $LIM ]
	then
		FIN=1
		estado
		imprimir
		echo ""
		echo -e "${VERDE} \nFelicidades, ganaste ${ESC}"
	fi
	
	if [ $OP_ESTADO == 8 ]
	then
		FIN=1
		estado
		imprimir
		echo ""
		echo -e "${ROJO} \nPerdiste :( la palabra correcta era $PALABRA ${ESC}"
	fi
}
echo -e "                         ${NARANJA}@@@@@@@@@@@@@@@@@@@@@@@@@@@@${ESC}"                         
echo -e "                            ${AZUL}*@${ESC}        ${NARANJA}@@@@        @@@${ESC}"                           
echo -e "                            ${AZUL}*@${ESC}           ${NARANJA}@@@@     @@@${ESC}"                          
echo -e "                            ${AZUL}*@${ESC}             ${NARANJA}@@@@   @@@${ESC}"                         
echo -e "                       ${CUERPO}@@@@${ESC}${AZUL}*@${ESC}                ${NARANJA}@@@%@@@${ESC}"                        
echo -e "                       ${CUERPO}@@@@@@@${ESC}                  ${NARANJA}@@@@@${ESC}"                        
echo -e "                        ${CUERPO}&@@@@@@@@${ESC}                 ${NARANJA}@@@${ESC}"                       
echo -e "                         ${CUERPO}@@@@@@@@@${ESC}                ${NARANJA}@@@${ESC}"                      
echo -e "                       ${CUERPO}*@@.@@@@@@@@${ESC}               ${NARANJA}@@@${ESC}"                     
echo -e "                       ${CUERPO}@@@ @@@@@ @@${ESC}               ${NARANJA}@@@${ESC}"                    
echo -e "                       ${CUERPO}@@@ @@@@@ @@*${ESC}              ${NARANJA}@@@${ESC}"                   
echo -e "                           ${CUERPO}@@@@#${ESC}                  ${NARANJA}@@@${ESC}"                  
echo -e "                          ${CUERPO}%@@@@@${ESC}                 ${NARANJA}@@@@@${ESC}"                 
echo -e "                          ${CUERPO}@@@@@@${ESC}                ${NARANJA}@@@@@@@&${ESC}"                
echo -e "                          ${CUERPO}@@@@@@${ESC}               ${NARANJA}@@@@@@ @@@${ESC}"       
echo -e "                                              ${NARANJA}@@@ @@@  @@@${ESC}"

estado(){
	case "$OP_ESTADO" in
		1)
			echo -e "                         ${NARANJA}@@@@@@@@@@@@@@@@@@@@@@@@@@@@${ESC}"                         
			echo -e "                                      ${NARANJA}@@@@        @@@${ESC}"                           
			echo -e "                                         ${NARANJA}@@@@     @@@${ESC}"                          
			echo -e "                                           ${NARANJA}@@@@   @@@${ESC}"                         
			echo -e "                                            ${NARANJA}@@@%@@@${ESC}"                        
			echo -e "                                               ${NARANJA}@@@@@${ESC}"                        
			echo -e "                                                 ${NARANJA}@@@${ESC}"                       
			echo -e "                                                  ${NARANJA}@@@${ESC}"                      
			echo -e "                                                  ${NARANJA}@@@${ESC}"                     
			echo -e "                                                  ${NARANJA}@@@${ESC}"                    
			echo -e "                                                  ${NARANJA}@@@${ESC}"                   
			echo -e "                                                  ${NARANJA}@@@${ESC}"                  
			echo -e "                                                 ${NARANJA}@@@@@${ESC}"                 
			echo -e "                                                ${NARANJA}@@@@@@@&${ESC}"                
			echo -e "                                               ${NARANJA}@@@@@@ @@@${ESC}"       
			echo -e "                                              ${NARANJA}@@@ @@@  @@@${ESC}"
		;;
		2)
			echo -e "                         ${NARANJA}@@@@@@@@@@@@@@@@@@@@@@@@@@@@${ESC}"                         
			echo -e "                            ${AZUL}*@${ESC}        ${NARANJA}@@@@        @@@${ESC}"                           
			echo -e "                            ${AZUL}*@${ESC}           ${NARANJA}@@@@     @@@${ESC}"                          
			echo -e "                            ${AZUL}*@${ESC}             ${NARANJA}@@@@   @@@${ESC}"                         
			echo -e "                           ${AZUL}*@${ESC}                ${NARANJA}@@@%@@@${ESC}" 
			echo -e "                                               ${NARANJA}@@@@@${ESC}"                        
			echo -e "                                                 ${NARANJA}@@@${ESC}"                       
			echo -e "                                                  ${NARANJA}@@@${ESC}"                      
			echo -e "                                                  ${NARANJA}@@@${ESC}"                     
			echo -e "                                                  ${NARANJA}@@@${ESC}"                    
			echo -e "                                                  ${NARANJA}@@@${ESC}"                   
			echo -e "                                                  ${NARANJA}@@@${ESC}"                  
			echo -e "                                                 ${NARANJA}@@@@@${ESC}"                 
			echo -e "                                                ${NARANJA}@@@@@@@&${ESC}"                
			echo -e "                                               ${NARANJA}@@@@@@ @@@${ESC}"       
			echo -e "                                              ${NARANJA}@@@ @@@  @@@${ESC}"
                      

		;;
		3)
			CUERPO=$VERDE
			echo -e "                         ${NARANJA}@@@@@@@@@@@@@@@@@@@@@@@@@@@@${ESC}"                         
			echo -e "                            ${AZUL}*@${ESC}        ${NARANJA}@@@@        @@@${ESC}"                           
			echo -e "                            ${AZUL}*@${ESC}           ${NARANJA}@@@@     @@@${ESC}"                          
			echo -e "                            ${AZUL}*@${ESC}             ${NARANJA}@@@@   @@@${ESC}"                         
			echo -e "                       ${CUERPO}@@@@${ESC}${AZUL}*@${ESC}                ${NARANJA}@@@%@@@${ESC}"                        
			echo -e "                       ${CUERPO}@@@@@@@${ESC}                  ${NARANJA}@@@@@${ESC}"                        
			echo -e "                        ${CUERPO}&@@@@    ${ESC}                 ${NARANJA}@@@${ESC}"
			echo -e "                                                  ${NARANJA}@@@${ESC}"                      
			echo -e "                                                  ${NARANJA}@@@${ESC}"                     
			echo -e "                                                  ${NARANJA}@@@${ESC}"                    
			echo -e "                                                  ${NARANJA}@@@${ESC}"                   
			echo -e "                                                  ${NARANJA}@@@${ESC}"                  
			echo -e "                                                 ${NARANJA}@@@@@${ESC}"                 
			echo -e "                                                ${NARANJA}@@@@@@@&${ESC}"                
			echo -e "                                               ${NARANJA}@@@@@@ @@@${ESC}"       
			echo -e "                                              ${NARANJA}@@@ @@@  @@@${ESC}"
			

		;;
		4)
			echo -e "                         ${NARANJA}@@@@@@@@@@@@@@@@@@@@@@@@@@@@${ESC}"                         
			echo -e "                            ${AZUL}*@${ESC}        ${NARANJA}@@@@        @@@${ESC}"                           
			echo -e "                            ${AZUL}*@${ESC}           ${NARANJA}@@@@     @@@${ESC}"                          
			echo -e "                            ${AZUL}*@${ESC}             ${NARANJA}@@@@   @@@${ESC}"                         
			echo -e "                       ${CUERPO}@@@@${ESC}${AZUL}*@${ESC}                ${NARANJA}@@@%@@@${ESC}"                        
			echo -e "                       ${CUERPO}@@@@@@@${ESC}                  ${NARANJA}@@@@@${ESC}" 
			echo -e "                        ${CUERPO}&@@@@@@@@${ESC}                 ${NARANJA}@@@${ESC}"                       
			echo -e "                         ${CUERPO}@@@@@@@@@${ESC}                ${NARANJA}@@@${ESC}"                      
			echo -e "                       ${CUERPO}    @@@@@   ${ESC}               ${NARANJA}@@@${ESC}"                     
			echo -e "                       ${CUERPO}    @@@@@   ${ESC}               ${NARANJA}@@@${ESC}"                    
			echo -e "                       ${CUERPO}    @@@@@    ${ESC}              ${NARANJA}@@@${ESC}"
			echo -e "                                                  ${NARANJA}@@@${ESC}"                  
			echo -e "                                                 ${NARANJA}@@@@@${ESC}"                 
			echo -e "                                                ${NARANJA}@@@@@@@&${ESC}"                
			echo -e "                                               ${NARANJA}@@@@@@ @@@${ESC}"       
			echo -e "                                              ${NARANJA}@@@ @@@  @@@${ESC}"
		;;
		5)
			CUERPO=$AMARILLO
			echo -e "                         ${NARANJA}@@@@@@@@@@@@@@@@@@@@@@@@@@@@${ESC}"                         
			echo -e "                            ${AZUL}*@${ESC}        ${NARANJA}@@@@        @@@${ESC}"                           
			echo -e "                            ${AZUL}*@${ESC}           ${NARANJA}@@@@     @@@${ESC}"                          
			echo -e "                            ${AZUL}*@${ESC}             ${NARANJA}@@@@   @@@${ESC}"                         
			echo -e "                       ${CUERPO}@@@@${ESC}${AZUL}*@${ESC}                ${NARANJA}@@@%@@@${ESC}"                        
			echo -e "                       ${CUERPO}@@@@@@@${ESC}                  ${NARANJA}@@@@@${ESC}" 
			echo -e "                        ${CUERPO}&@@@@@@@@${ESC}                 ${NARANJA}@@@${ESC}"                       
			echo -e "                         ${CUERPO}@@@@@@@@@${ESC}                ${NARANJA}@@@${ESC}"
			echo -e "                       ${CUERPO}*@@.@@@@@   ${ESC}               ${NARANJA}@@@${ESC}"                     
			echo -e "                       ${CUERPO}@@@ @@@@@   ${ESC}               ${NARANJA}@@@${ESC}"                    
			echo -e "                       ${CUERPO}@@@ @@@@@    ${ESC}              ${NARANJA}@@@${ESC}"
			echo -e "                                                  ${NARANJA}@@@${ESC}"                  
			echo -e "                                                 ${NARANJA}@@@@@${ESC}"                 
			echo -e "                                                ${NARANJA}@@@@@@@&${ESC}"                
			echo -e "                                               ${NARANJA}@@@@@@ @@@${ESC}"       
			echo -e "                                              ${NARANJA}@@@ @@@  @@@${ESC}"  
		;;
		6)
			echo -e "                         ${NARANJA}@@@@@@@@@@@@@@@@@@@@@@@@@@@@${ESC}"                         
			echo -e "                            ${AZUL}*@${ESC}        ${NARANJA}@@@@        @@@${ESC}"                           
			echo -e "                            ${AZUL}*@${ESC}           ${NARANJA}@@@@     @@@${ESC}"                          
			echo -e "                            ${AZUL}*@${ESC}             ${NARANJA}@@@@   @@@${ESC}"                         
			echo -e "                       ${CUERPO}@@@@${ESC}${AZUL}*@${ESC}                ${NARANJA}@@@%@@@${ESC}"                        
			echo -e "                       ${CUERPO}@@@@@@@${ESC}                  ${NARANJA}@@@@@${ESC}"                        
			echo -e "                        ${CUERPO}&@@@@@@@@${ESC}                 ${NARANJA}@@@${ESC}"                       
			echo -e "                         ${CUERPO}@@@@@@@@@${ESC}                ${NARANJA}@@@${ESC}"                      
			echo -e "                       ${CUERPO}*@@.@@@@@@@@${ESC}               ${NARANJA}@@@${ESC}"                     
			echo -e "                       ${CUERPO}@@@ @@@@@ @@${ESC}               ${NARANJA}@@@${ESC}"                    
			echo -e "                       ${CUERPO}@@@ @@@@@ @@*${ESC}              ${NARANJA}@@@${ESC}" 
			echo -e "                                                  ${NARANJA}@@@${ESC}"                  
			echo -e "                                                 ${NARANJA}@@@@@${ESC}"                 
			echo -e "                                                ${NARANJA}@@@@@@@&${ESC}"                
			echo -e "                                               ${NARANJA}@@@@@@ @@@${ESC}"       
			echo -e "                                              ${NARANJA}@@@ @@@  @@@${ESC}" 
		;;
		7)
			CUERPO=$ROJO
			echo -e "                         ${NARANJA}@@@@@@@@@@@@@@@@@@@@@@@@@@@@${ESC}"                         
			echo -e "                            ${AZUL}*@${ESC}        ${NARANJA}@@@@        @@@${ESC}"                           
			echo -e "                            ${AZUL}*@${ESC}           ${NARANJA}@@@@     @@@${ESC}"                          
			echo -e "                            ${AZUL}*@${ESC}             ${NARANJA}@@@@   @@@${ESC}"                         
			echo -e "                       ${CUERPO}@@@@${ESC}${AZUL}*@${ESC}                ${NARANJA}@@@%@@@${ESC}"                        
			echo -e "                       ${CUERPO}@@@@@@@${ESC}                  ${NARANJA}@@@@@${ESC}"                        
			echo -e "                        ${CUERPO}&@@@@@@@@${ESC}                 ${NARANJA}@@@${ESC}"                       
			echo -e "                         ${CUERPO}@@@@@@@@@${ESC}                ${NARANJA}@@@${ESC}"                      
			echo -e "                       ${CUERPO}*@@.@@@@@@@@${ESC}               ${NARANJA}@@@${ESC}"                     
			echo -e "                       ${CUERPO}@@@ @@@@@ @@${ESC}               ${NARANJA}@@@${ESC}"                    
			echo -e "                       ${CUERPO}@@@ @@@@@ @@*${ESC}              ${NARANJA}@@@${ESC}"                   
			echo -e "                           ${CUERPO}@@@@#${ESC}                  ${NARANJA}@@@${ESC}"                  
			echo -e "                          ${CUERPO}%@@   ${ESC}                 ${NARANJA}@@@@@${ESC}"                 
			echo -e "                          ${CUERPO}@@@   ${ESC}                ${NARANJA}@@@@@@@&${ESC}"                
			echo -e "                          ${CUERPO}@@@   ${ESC}               ${NARANJA}@@@@@@ @@@${ESC}"       
			echo -e "                                              ${NARANJA}@@@ @@@  @@@${ESC}"
		;;
		8)
			echo -e "                         ${NARANJA}@@@@@@@@@@@@@@@@@@@@@@@@@@@@${ESC}"                         
			echo -e "                            ${AZUL}*@${ESC}        ${NARANJA}@@@@        @@@${ESC}"                           
			echo -e "                            ${AZUL}*@${ESC}           ${NARANJA}@@@@     @@@${ESC}"                          
			echo -e "                            ${AZUL}*@${ESC}             ${NARANJA}@@@@   @@@${ESC}"                         
			echo -e "                       ${CUERPO}@@@@${ESC}${AZUL}*@${ESC}                ${NARANJA}@@@%@@@${ESC}"                        
			echo -e "                       ${CUERPO}@@@@@@@${ESC}                  ${NARANJA}@@@@@${ESC}"                        
			echo -e "                        ${CUERPO}&@@@@@@@@${ESC}                 ${NARANJA}@@@${ESC}"                       
			echo -e "                         ${CUERPO}@@@@@@@@@${ESC}                ${NARANJA}@@@${ESC}"                      
			echo -e "                       ${CUERPO}*@@.@@@@@@@@${ESC}               ${NARANJA}@@@${ESC}"                     
			echo -e "                       ${CUERPO}@@@ @@@@@ @@${ESC}               ${NARANJA}@@@${ESC}"                    
			echo -e "                       ${CUERPO}@@@ @@@@@ @@*${ESC}              ${NARANJA}@@@${ESC}"                   
			echo -e "                           ${CUERPO}@@@@#${ESC}                  ${NARANJA}@@@${ESC}"                  
			echo -e "                          ${CUERPO}%@@@@@${ESC}                 ${NARANJA}@@@@@${ESC}"                 
			echo -e "                          ${CUERPO}@@@@@@${ESC}                ${NARANJA}@@@@@@@&${ESC}"                
			echo -e "                          ${CUERPO}@@@@@@${ESC}               ${NARANJA}@@@@@@ @@@${ESC}"       
			echo -e "                                              ${NARANJA}@@@ @@@  @@@${ESC}"
		;;
	esac

}
while :
do
	clear
	echo -e "${NARANJA}               )      )    (                        (          ) ";
	echo -e "    (       ( /(   ( /(    )\ )     (       (       )\ )    ( /( ";
	echo -e "    )\      )\())  )\())  (()/(     )\      )\     (()/(    )\()) ";
	echo -e " ((((_)(   ((_)\  ((_)\    /(_))  (((_)  ((((_)(    /(_))  ((_)\ ";
	echo -e "  )\ _ )\   _((_)   ((_)  (_))    )\___   )\ _ )\  (_))_     ((_) ${ESC}";
	echo -e "${ROJO}  (_)_\(_) | || |  / _ \  | _ \  ((/ __|  (_)_\(_)  |   \   / _ \ ";
	echo -e "   / _ \   | __ | | (_) | |   /   | (__    / _ \    | |) | | (_) | ";
	echo -e "  /_/ \_\  |_||_|  \___/  |_|_\    \___|  /_/ \_\   |___/   \___/\n ${ESC}";
	echo -e "                       Elige una opcion"
	echo -e "${CYAN}                          1. Jugar"
	echo -e "                       2. Instrucciones"
	echo -e "                           3. Salir${ESC}"
	read OP
	case $OP in 
		1)
			FIN=0
			OP_ESTADO=1
			AUX2=0
			palabra_a_adivinar
			inicio_comprobado
			while [ $FIN != 1 ]
			do
				clear
				estado
				imprimir
				printf "\n\nDame una letra: "
				read -e LETRA
				comparar
				comprobacion_fin
			done
			clear
			comprobacion_fin
			echo ""
			read -s -n 1 -p "Presiona alguna tecla para volver al inicio..."
		        
		;;
		2)
			clear
			echo -e "                     Instrucciones"
			echo -e "${AMARILLO}Introduce la letra que creas que forma parte de la palabra"
			echo -e "               Puedes equivocarte 7 veces${ESC}"
			echo ""
			read -s -n 1 -p "Presiona alguna tecla para volver al inicio..."
			
			
		;;
		3)
			clear
			exit
		;;
		
		*)
			echo -e "${ROJO}Opcion invalida\n${ESC}"
			echo ""
			read -s -n 1 -p "Presiona alguna tecla para volver al inicio..."
		;;
		esac
done


