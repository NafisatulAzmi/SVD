#!/bin/bash
#Script Created By Pa'an Finest
read -p "Masukkan port Squid yang dipisahkan dengan 'spasi': " port

#squid
rm -f /root/squidport
squidport="$(cat /etc/squid3/squid.conf | grep -i http_port | awk '{print $2}')"
echo ""
echo -e "\e[34;1mPort Squid sebelum diedit:\e[0m"

cat > /root/squidport <<-END
$squidport
END

exec</root/squidport
while read line
do
	echo "Port $line"
	sed "/http_port $line/d" -i /etc/squid3/squid.conf
	#sed "s/Port $line//g" -i /etc/squid3/squid.conf
done
rm -f /root/squidport

echo ""

for i in ${port[@]}
do
	netstat -nlpt | grep -w "$i" > /dev/null
	if [ $? -eq 0 ]; then
		netstat -nlpt | grep -i squid | grep -w "$i" > /dev/null
		if [ $? -eq 0 ]; then
			sed -i "21 a\http_port $i" /etc/squid3/squid.conf
			echo -e "\e[032;1mPort $i sudah ditambahkan\e[0m"
		fi
		
		netstat -nlpt | grep -i sshd | grep -w "$i" > /dev/null
		if [ $? -eq 0 ]; then
			echo -e "\e[031;1mMaaf, Port $i sudah digunakan untuk OpenSSH\e[0m"
		fi
		
		netstat -nlpt | grep -i dropbear | grep -w "$i" > /dev/null
		if [ $? -eq 0 ]; then
			echo -e "\e[031;1mMaaf, Port $i sudah digunakan untuk Dropbear\e[0m"
		fi
		
		netstat -nlpt | grep -i openvpn | grep -w "$i" > /dev/null
		if [ $? -eq 0 ]; then
			echo -e "\e[031;1mMaaf, Port $i sudah digunakan untuk OpenVPN\e[0m"
		fi
	else
		sed -i "21 a\http_port $i" /etc/squid3/squid.conf
		echo -e "\e[032;1mPort $i sudah ditambahkan\e[0m"
	fi
done

echo ""
service squid3 restart

rm -f /root/squidport
squidport="$(cat /etc/squid3/squid.conf | grep -i http_port | awk '{print $2}')"
echo ""
echo -e "\e[34;1mPort Squid sesudah diedit:\e[0m"

cat > /root/squidport <<-END
$squidport
END

exec</root/squidport
while read line
do
	echo "Port $line"
done
rm -f /root/squidport
