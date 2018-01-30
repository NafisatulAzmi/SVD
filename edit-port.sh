#!/bin/bash
#Script Created By Pa'an Finest
while :
do
	#MYIP=$(ifconfig | grep 'inet addr:' | grep -v inet6 | grep -vE '127\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | cut -d: -f2 | awk '{ print $1}' | head -1)
	#if [ "$MYIP" = "" ]; then
		#MYIP=$(wget -qO- ipv4.icanhazip.com)
	#fi

	clear
	echo "--------------- Selamat Datang Di Server Finest Media - IP: $MYIP ---------------"
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
        echo -e "\e[032;1mSupport By :\e[0m \e[031;1mFinest media -\e[0m \e[034;1mPhreakers Jateng Official\e[0m"
	echo "------------------------------------------------------------------------------"
	echo "Apa yang ingin Anda lakukan?"
	echo -e "\e[031;1m 1\e[0m) Edit Port OpenSSH (\e[34;1medit-port-openssh\e[0m)"
	echo -e "\e[031;1m 2\e[0m) Edit Port Dropbear (\e[34;1medit-port-dropbear\e[0m)"
	echo -e "\e[031;1m 3\e[0m) Edit Port Squid Proxy (\e[34;1medit-port-squid\e[0m)"
	echo -e "\e[031;1m 4\e[0m) Edit Port OpenVPN (\e[34;1medit-port-openvpn\e[0m)"
	echo ""
	echo -e "\e[031;1m x\e[0m) Exit"
	echo ""
	read -p "Masukkan pilihan anda, kemudian tekan tombol ENTER: " option2
	case $option2 in
		1)
		clear
		edit-port-openssh
		exit
		;;
		2)
		clear
		edit-port-dropbear
		exit
		;;
		3)
		clear
		edit-port-squid
		exit
		;;
		4)
		clear
		edit-port-openvpn
		exit
		;;
		x)
		clear
		exit
		;;
	esac
done
