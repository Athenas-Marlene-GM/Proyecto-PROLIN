#!/bin/bash
echo -e "\e[36mLa hora es:"
/sbin/hwclock | grep '[0-9]*:[0-9]*:[0-9]*' -Eo
