#!/bin/bash
#Script Created By Pa'an Finest
read -p "Masukkan port OpenVPN yang diinginkan: " port

#openvpn
rm -f /root/openvpnport
openvpnport="$(netstat -nlpt | grep -i openvpn | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
echo ""
echo "Port OpenVPN sebelum diedit:"

cat > /root/openvpnport <<-END
$openvpnport
END

exec</root/openvpnport
while read line
do
	echo "Port $line"
	sed "/port $line/d" -i /etc/openvpn/server.conf
done
rm -f /root/openvpnport

echo ""

for i in ${port[@]}
do
	netstat -nlpt | grep -w "$i" > /dev/null
	if [ $? -eq 0 ]; then
		netstat -nlpt | grep -i squid | grep -w "$i" > /dev/null
		if [ $? -eq 0 ]; then
			sed -i "1 a\port $i" /etc/openvpn/server.conf
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
		
		netstat -nlpt | grep -i squid | grep -w "$i" > /dev/null
		if [ $? -eq 0 ]; then
			echo -e "\e[031;1mMaaf, Port $i sudah digunakan untuk Squid\e[0m"
		fi
	else
		sed -i "1 a\port $i" /etc/openvpn/server.conf
		echo -e "\e[032;1mPort $i sudah ditambahkan\e[0m"
	fi
done

echo ""
service openvpn restart

rm -f /root/openvpnport
openvpnport="$(netstat -nlpt | grep -i openvpn | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
echo ""
echo "Port OpenVPN sesudah diedit:"

cat > /root/openvpnport <<-END
$openvpnport
END

exec</root/openvpnport
while read line
do
	echo "Port $line"
done
rm -f /root/openvpnport
