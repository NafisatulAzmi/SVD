#!/bin/bash
#Scritp Created By Pa'an Finest
while :
do
	#MYIP=$(ifconfig | grep 'inet addr:' | grep -v inet6 | grep -vE '127\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | cut -d: -f2 | awk '{ print $1}' | head -1)
	#if [ "$MYIP" = "" ]; then
		#MYIP=$(wget -qO- ipv4.icanhazip.com)
	#fi

	clear
	echo "--------------- \e[032;1mSelamat Datang Di\e[0m \e[034;1mServer Finest Media\e[032;1m" - IP: $MYIP ---------------"
	cname=$( awk -F: '/model name/ {name=$2} END {print name}' /proc/cpuinfo )
	cores=$( awk -F: '/model name/ {core++} END {print core}' /proc/cpuinfo )
	freq=$( awk -F: ' /cpu MHz/ {freq=$2} END {print freq}' /proc/cpuinfo )
	tram=$( free -m | awk 'NR==2 {print $2}' )
	swap=$( free -m | awk 'NR==4 {print $2}' )
	up=$(uptime|awk '{ $1=$2=$(NF-6)=$(NF-5)=$(NF-4)=$(NF-3)=$(NF-2)=$(NF-1)=$NF=""; print }')

	echo -e "\e[032;1mCPU model:\e[0m $cname"
	echo -e "\e[032;1mNumber of cores:\e[0m $cores"
	echo -e "\e[032;1mCPU frequency:\e[0m $freq MHz"
	echo -e "\e[032;1mTotal amount of ram:\e[0m $tram MB"
	echo -e "\e[032;1mTotal amount of swap:\e[0m $swap MB"
	echo -e "\e[032;1mSystem uptime:\e[0m $up"
    echo -e "\e[032;1mScript Created\e[0m \e[034;1mBy Pa'an Finest\e[032;1m"
    echo -e "\e[032;1mSupport By :\e[0m \e[031;1mFinest media -\e[0m \e[034;1mPhreakers Jateng Official\e[0m "
	echo "------------------------------------------------------------------------------"
	echo "Apa yang ingin Anda lakukan?"
	echo -e "\e[031;1m 1\e[0m) Buat Akun SSH/OpenVPN (\e[34;1muser-add\e[0m)"
	echo -e "\e[031;1m 2\e[0m) Generate Akun SSH/OpenVPN (\e[34;1muser-gen\e[0m)"
	echo -e "\e[031;1m 3\e[0m) Ganti Password Akun SSH/OpenVPN (\e[34;1muser-pass\e[0m)"
	echo -e "\e[031;1m 4\e[0m) Tambah Masa Aktif Akun SSH/OpenVPN (\e[34;1muser-renew\e[0m)"
	echo -e "\e[031;1m 5\e[0m) Hapus Akun SSH/OpenVPN (\e[34;1muser-del\e[0m)"
	echo -e "\e[031;1m 6\e[0m) Buat Akun PPTP VPN (\e[34;1muser-add-pptp\e[0m)"
	echo -e "\e[031;1m 7\e[0m) Monitoring Dropbear (\e[34;1mdropmon\e[0m)"
	echo -e "\e[031;1m 8\e[0m) Cek Login Dropbear, OpenSSH, PPTP VPN dan OpenVPN (\e[34;1muser-login\e[0m)"
	echo -e "\e[031;1m 9\e[0m) Kill Multi Login Manual (1-2 Login) (\e[34;1muser-limit\e[0m)"
	echo -e "\e[031;1m10\e[0m) AutoKill Multi Login (2-3 Login) (\e[34;1mautokill\e[0m)"
	echo -e "\e[031;1m11\e[0m) Daftar Akun dan Expire Date (\e[34;1muser-list\e[0m)"
	echo -e "\e[031;1m12\e[0m) Daftar Akun Aktif (\e[34;1muser-active-list\e[0m)"
	echo -e "\e[031;1m13\e[0m) Daftar Akun Expire (\e[34;1muser-expire-list\e[0m)"
	echo -e "\e[031;1m14\e[0m) Disable Akun Expire (\e[34;1mdisable-user-expire\e[0m)"
	echo -e "\e[031;1m15\e[0m) Delete Akun Expire (\e[34;1mdelete-user-expire\e[0m)"
	echo -e "\e[031;1m16\e[0m) Banned Akun (\e[34;1mbanned-user\e[0m)"
	echo -e "\e[031;1m17\e[0m) Unbanned Akun (\e[34;1munbanned-user\e[0m)"
	echo -e "\e[031;1m18\e[0m) Restart Dropbear (\e[34;1mservice dropbear restart\e[0m)"
	echo -e "\e[031;1m19\e[0m) Memory Usage (\e[34;1mps-mem\e[0m)"
	echo -e "\e[031;1m20\e[0m) Speedtest (\e[34;1mspeedtest --share\e[0m)"
	echo -e "\e[031;1m21\e[0m) Benchmark (\e[34;1mbenchmark\e[0m)"
	echo -e "\e[031;1m22\e[0m) Restart Webmin (\e[34;1mservice webmin restart\e[0m)"
	echo -e "\e[031;1m23\e[0m) Edit Banner SSH Login (Dropbear/OpenSSH) (\e[34;1mbanner\e[0m)"
	echo -e "\e[031;1m24\e[0m) Edit Port (\e[34;1medit-port\e[0m)"
	echo -e "\e[031;1m25\e[0m) Ganti Password Root (\e[34;1mroot-pass\e[0m)"
	echo -e "\e[031;1m26\e[0m) Reboot Server (\e[34;1mreboot\e[0m)"
	echo ""
	echo -e "\e[031;1m x\e[0m) Exit"
	echo ""
	read -p "Masukkan pilihan anda, kemudian tekan tombol ENTER: " option1
	case $option1 in
		1)
		clear
		user-add
		exit
		;;
		2)
		clear
		user-gen
		exit
		;;
		3)
		clear
		user-pass
		exit
		;;
		4)
		clear
		user-renew
		exit
		;;
		5)
		clear
		user-del
		exit
		;;
		6)
		clear
		user-add-pptp
		exit
		;;
		7)
		clear
		#read -p "Isikan Port Dropbear yang akan dimonitor: " PORT
		#dropmon $PORT
		dropmon
		exit
		;;
		8)
		clear
		user-login
		exit
		;;
		9)
		clear
		#read -p "Isikan Maximal Log
