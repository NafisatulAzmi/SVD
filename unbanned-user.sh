#!/bin/bash
#Script Created By Pa'an Finest
clear
echo -e "\e[032;1m---------- Unbanned\e[0m \e[034;1mUser ----------\e[0m"
cat /root/banneduser.txt
echo "--------------------------------------------------------------------------------"
echo ""

read -p "Isikan username: " username

egrep "^$username" /etc/passwd >/dev/null
if [ $? -eq 0 ]; then
	echo ""
	read -p "Apakah Anda benar-benar ingin mem-unbanned akun [$username] [y/n]: " -e -i y UNBANNED
	if [[ "$UNBANNED" = 'y' ]]; then
		sed -i "s/ User : $username//g" /root/banneduser.txt
		sed -i /^$/d /root/banneduser.txt
		passwd -u $username
		echo ""
		echo "Akun [$username] berhasil diunbanned!"
	else
		echo ""
		echo "Unbanned akun [$username] dibatalkan!"
	fi
else
	echo "Username [$username] belum terdaftar!"
	exit 1
fi
