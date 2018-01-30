#!/bin/bash
#Script Created By Pa'an Finest
read -p "Masukkan port OpenSSH yang dipisahkan dengan 'spasi': " port

#openssh
rm -f /root/opensshport
opensshport="$(netstat -nlpt | grep -i sshd | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
echo ""
echo -e "\e[34;1mPort OpenSSH sebelum diedit:\e[0m"

cat > /root/opensshport <<-END
$opensshport
END

exec</root/opensshport
while read line
do
	echo "Port $line"
	sed "/Port $line/d" -i /etc/ssh/sshd_config
	#sed "s/Port $line//g" -i /etc/ssh/sshd_config
done
rm -f /root/opensshport

echo ""

for i in ${port[@]}
do
	netstat -nlpt | grep -w "$i" > /dev/null
	if [ $? -eq 0 ]; then
		netstat -nlpt | grep -i sshd | grep -w "$i" > /dev/null
		if [ $? -eq 0 ]; then
			sed -i "4 a\Port $i" /etc/ssh/sshd_config
			echo -e "\e[032;1mPort $i sudah ditambahkan\e[0m"
		fi
		
		netstat -nlpt | grep -i dropbear | grep -w "$i" > /dev/null
		if [ $? -eq 0 ]; then
			echo -e "\e[031;1mMaaf, Port $i sudah digunakan untuk Dropbear\e[0m"
		fi
		
		netstat -nlpt | grep -i squid | grep -w "$i" > /dev/null
		if [ $? -eq 0 ]; then
			echo -e "\e[031;1mMaaf, Port $i sudah digunakan untuk Squid\e[0m"
		fi
		
		netstat -nlpt | grep -i openvpn | grep -w "$i" > /dev/null
		if [ $? -eq 0 ]; then
			echo -e "\e[031;1mMaaf, Port $i sudah digunakan untuk OpenVPN\e[0m"
		fi
	else
		sed -i "4 a\Port $i" /etc/ssh/sshd_config
		echo -e "\e[032;1mPort $i sudah ditambahkan\e[0m"
	fi
done

echo ""
service ssh restart

rm -f /root/opensshport
opensshport="$(netstat -nlpt | grep -i sshd | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
echo ""
echo -e "\e[34;1mPort OpenSSH sesudah diedit:\e[0m"

cat > /root/opensshport <<-END
$opensshport
END

exec</root/opensshport
while read line
do
	echo "Port $line"
done
rm -f /root/opensshport
