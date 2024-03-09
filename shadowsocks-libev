#!/bin/bash

clear

# @Rerechan02 | Dev in FN Project Autoscript Kolaborasi bersama dengan PR_Aiman [@praiman99]

# Proses install Shadowsocks-libev

# INFO
source /etc/os-release
OS=$ID
ver=$VERSION_ID

# Install Package
apt-get install --no-install-recommends build-essential autoconf libtool libssl-dev libpcre3-dev libev-dev asciidoc xmlto automake -y

# Install VPN
clear
echo -e "proses untuk setup shadowsocks-libev"
sleep 2
clear
apt-get install software-properties-common -y
if [[ $OS == 'ubuntu' ]]; then
apt install shadowsocks-libev -y
apt install simple-obfs -y
elif [[ $OS == 'debian' ]]; then
if [[ "$ver" = "9" ]]; then
echo "deb http://deb.debian.org/debian stretch-backports main" | tee /etc/apt/sources.list.d/stretch-backports.list
apt update
apt -t stretch-backports install shadowsocks-libev -y
apt -t stretch-backports install simple-obfs -y
elif [[ "$ver" = "10" ]]; then
echo "deb http://deb.debian.org/debian buster-backports main" | tee /etc/apt/sources.list.d/buster-backports.list
apt update
apt -t buster-backports install shadowsocks-libev -y
apt -t buster-backports install simple-obfs -y
elif [[ "$ver" = "11" ]]; then
echo "deb http://deb.debian.org/debian bullseye-backports main" | tee /etc/apt/sources.list.d/bullseye-backports.list
apt update
apt -t bullseye-backports install shadowsocks-libev -y
apt -t bullseye-backports install simple-obfs -y
fi
fi

# Setup Konfigurasi Shadowsocks-Libev
# Default JSON
cat > /etc/shadowsocks-libev/config.json <<END
{   
    "server":"0.0.0.0",
    "server_port":8488,
    "password":"tes",
    "timeout":60,
    "method":"aes-256-cfb",
    "fast_open":true,
    "nameserver":"8.8.8.8",
    "mode":"tcp_and_udp",
}
END

# Libev JSON
cat > /etc/shadowsocks-libev.json <<END
{
    "server":"127.0.0.1",
    "server_port":8388,
    "local_port":1080,
    "password":"",
    "timeout":60,
    "method":"chacha20-ietf-poly1305",
    "mode":"tcp_and_udp",
    "fast_open":true,
    "plugin":"/usr/bin/obfs-local",
    "plugin_opts":"obfs=tls;failover=127.0.0.1:1443;fast-open"
}
END

# Create Data Akaun
echo -e "">>"/etc/shadowsocks-libev/akun.conf"

# Mengizinkan Dia Punya Konfigurasi
iptables -I INPUT -m state --state NEW -m tcp -p tcp --dport 2443:3543 -j ACCEPT
iptables -I INPUT -m state --state NEW -m udp -p udp --dport 2443:3543 -j ACCEPT
iptables-save > /etc/iptables.up.rules
ip6tables-save > /etc/ip6tables.up.rules

# Beri izin akses konfigurasi
chmod 777 /etc/shadowsocks-libev.json
chmod 777 /etc/shadowsocks-libev/config.json
chmod 777 /etc/shadowsocks-libev/akun.conf

# Jalankan Service daripada dia punya konfigurasi
systemctl enable shadowsocks-libev.service
systemctl start shadowsocks-libev.service

# clear Tambahan Sahaja
# wget https://menu.sh
clear
