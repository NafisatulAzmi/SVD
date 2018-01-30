#!/bin/bash
#Script Created By Pa'an Finest
echo -e "\e[032;1m----------Generat Akun\e[0m \e[034;1mSSH ----------\e[0m"
read -p "Berapa jumlah akun yang akan dibuat: " JUMLAH
read -p "Berapa hari akun aktif: " AKTIF

today="$(date +"%Y-%m-%d")"
expire=$(date -d "$AKTIF days" +"%Y-%m-%d")

echo ""
echo ""
	echo "------------------------------------------"
	echo "Informasi Detail Akun Anda :"
	echo "------------------------------------------"
	echo "Host/IP: $MYIP"
	echo "OpenSSH Port : 22, 143"
  echo "SSL/TSL Port : 443"
	echo "Squid Proxy : 80, 8080, 3128"
	echo "OpenVPN Config : http://$MYIP:81/client.ovpn"
	echo "Aktif Sampai : $(date -d "$AKTIF days" +"%d-%m-%Y")"
    echo "------------------------------------------"

for (( i=1; i <= $JUMLAH; i++ ))
do
	username=`cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 15 | head -n 1`;
	useradd -M -N -s /bin/false -e $expire $username
	#password=`cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 15 | head -n 1`;
	echo $username:$username | chpasswd
	
	echo "$i. Username/Password: $username"
done

echo "Aktif Sampai: $(date -d "$AKTIF days" +"%d-%m-%Y")"
    echo -e "\e[032;1mScript Created\e[0m By \e[034;1mPa'an Finest\e[032;1m"
    echo "------------------------------------------"
    echo ""
    echo -e " \e[032;1m[ Facebook : Pa'an\e[0m | \e[031;1mInstagram : @paan_finest\e[0m | \e[034;1mWA : +1 (202) 852-2868 ]\e[0m"
    echo ""
