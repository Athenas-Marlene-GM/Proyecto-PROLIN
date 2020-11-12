#!/bin/bash
echo -e "*******************************************************************************"
echo -e "Hola, has seleccionado infosys, que te dará la información de tu sistema. \n"
echo -e "*******************************************************************************"

echo -e "\nTu sistema operativo es: \n" 
cat /etc/issue 
uname -m
echo -e "\n Nombre de host \n"; 
uname -n

echo -e "\n RAM \n"; 
hwinfo --memory | grep "Memory Size" | cut -c3-

echo -e "\n Kernel \n"
uname -r

echo -e "\n Shell \n";  
$echo $SHELL --version

echo -e "\n Resolución \n";
xdpyinfo | grep 'dimensions:' | cut -c3-

echo -e "\n Desktop Enviroment  \n"; 
env|grep XDG_CURRENT_DESKTOP

echo -e "\n Terminal \n"; 
neofetch | grep 'Terminal' | cut -c19-


echo -e "\n Model name:  \n"; 
lscpu | grep 'Nombre del modelo' | cut -c38-


echo -e "\n GPU (Nvidia always better) \n";
neofetch | grep 'GPU' | cut -c19-

echo -e "\n Tamaño de memoria \n"; 
df . -h 
grep -m 1 "model name" /proc/cpuinfo | cut -c14-

echo -e "\n Usuario actual \n"; 
echo $USER

echo -e "\n Usuarios logeados \n"; 
w