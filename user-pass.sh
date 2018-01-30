#!/bin/bash
#Script Created By Pa'an Finest
echo -e "\e[032;1m---------- Ganti Password\e[0m \e[034;1mAkun SSH----------\e[0m"
# begin of user-list
echo "-----------------------------------"
echo "USERNAME              EXP DATE     "
echo "-----------------------------------"

while read expired
do
	AKUN="$(echo $expired | cut -d: -f1)"
	ID="$(echo $expired | grep -v nobody | cut -d: -f3)"
	exp="$(chage -l $AKUN | grep "Account expires" | awk -F": " '{print $2}')"
	if [[ $ID -ge 1000 ]]; then
		printf "%-21s %2s\n" "$AKUN" "$exp"
	fi
done < /etc/passwd
echo "-----------------------------------"
echo ""
# end of user-list

read -p "Isikan username: " username

egrep "^$username" /etc/passwd >/dev/null
if [ $? -eq 0 ]; then
	read -p "Isikan password baru akun [$username]: " password
	read -p "Konfirmasi password baru akun [$username]: " password1
	echo ""
	if [[ $password = $password1 ]]; then
		echo $username:$password | chpasswd
		echo "Penggantian password akun [$username] Sukses"
		echo ""
	    echo "------------------------------------------"
	    echo "Informasi Detail Akun Anda :"
	    echo "------------------------------------------"
	    echo "Host/IP: $MYIP"
	    echo "Username : $username"
	    echo "Password : $password"
	    echo "OpenSSH Port : 22, 143"
      echo "SSL/TSL Port : 443"
	    echo "Squid Proxy : 80, 8080, 3128"
	    echo "OpenVPN Config : http://$MYIP:81/client.ovpn"
	    echo "Aktif Sampai : $(date -d "$AKTIF days" +"%d-%m-%Y")"
        echo -e "\e[032;1mScript Created\e[0m \e[034;1mBy Pa'an Finest\e[032;1m"
        echo "------------------------------------------"
        echo ""
        echo -e" \e[032;1m[ Facebook : Pa'an\e[0m | \e[031;1mInstagram : @paan_finest\e[0m | \e[034;1mWA : +1 (202) 852-2868 ]\e[0m"
        echo ""
	else
		echo "Penggantian password akun [$username] Gagal"
		echo "[Password baru] & [Konfirmasi Password Baru] tidak cocok, silahkan ulangi lagi!"
	fi
else
	echo "Username [$username] belum terdaftar!"
	exit 1
fi
