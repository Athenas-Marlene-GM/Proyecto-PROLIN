#!/bin/bash
esc=$(printf '\033')
#B=$(tput setaf 4)
#N=$(tput op)
read -e directorio
if [ "$directorio" == "" ] 
then
		find $PWD |sed -e 's;[^/]*/;|____;g;s;____|;  |;g' 
else
		find $directorio | sed -e 's;[^/]*/;|____;g;s;____|;  |;g'
fi
