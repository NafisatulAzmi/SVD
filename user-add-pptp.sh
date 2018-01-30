#!/bin/bash
#Script Created By Pa'an Finest
echo -e "\e[032;1m---------- Membuat Akun\e[0m \e[034;1mPPTP VPN ----------\e[0m"
read -p "Isikan username baru: " username
read -p "Isikan password akun [$username]: " password

echo "$username pptpd $password *" >> /etc/ppp/chap-secrets

echo ""
echo "-------------------------------------------------"
echo "Informasi Detail Akun PPTP VPN:"
echo "-------------------------------------------------"
echo "Host/IP: $MYIP"
echo "Username: $username"
echo "Password: $password"
echo "-------------------------------------------------"
echo -e "\e[032;1mScript Created\e[0m \e[034;1mBy Pa'an Finest\e[032;1m"
echo ""
echo -e " \e[032;1m[ Facebook : Pa'an\e[0m | \e[031;1mInstagram : @paan_finest\e[0m | \e[034;1mWA : +1 (202) 852-2868 ]\e[0m"
