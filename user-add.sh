#!/bin/bash
#Script Created By Pa'an Finest
echo -e "\e[032;1m---------- Membuat Akun\e[0m \e[034;1mSSH/Ovpn ----------\e[0m"
read -p "Isikan username: " username

egrep "^$username" /etc/passwd >/dev/null
if [ $? -eq 0 ]; then
	echo "Username [$username] sudah ada!"
	exit 1
else
	read -p "Isikan password akun [$username]: " password
	read -p "Berapa hari akun [$username] aktif: " AKTIF

	today="$(date +"%Y-%m-%d")"
	expire=$(date -d "$AKTIF days" +"%Y-%m-%d")
	useradd -M -N -s /bin/false -e $expire $username
	echo $username:$password | chpasswd

	echo ""
	echo "------------------------------------------"
	echo "Informasi Detail Akun Anda :"
	echo "------------------------------------------"
	echo "Host/IP: $IP"
	echo "Username : $username"
	echo "Password : $password"
	echo "OpenSSH Port : 22, 143"
  echo "SSL/TSL Port : 443"
	echo "Squid Proxy : 80, 8080, 3128"
	echo "OpenVPN Config : http://$IP:81/client.ovpn"
	echo "Aktif Sampai : $(date -d "$AKTIF days" +"%d-%m-%Y")"
    echo "------------------------------------------"
    echo -e "\e[032;1mScript Created\e[0m \e[034;1mBy Pa'an Finest\e[032;1m"
    echo ""
    echo -e " \e[032;1m[ Facebook : Pa'an\e[0m | \e[031;1mInstagram : @paan_finest\e[0m | \e[034;1mWA : +1 (202) 852-2868 ]\e[0m"
fi
