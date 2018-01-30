#!/bin/bash

disable-user-expire
clear

echo -e "\e[032;1m---------- Daftar User\e[0m \e[034;1mSSH Aktif ----------\e[0m"
echo ""

cat /root/activeuser.txt
echo "" 
