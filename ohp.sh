#!/bin/bash
# /\/\/\/\/\/\/\/\/\/\//\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\//\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\//\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\|
# +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|
# \/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\//\/\/\/\/|

# OHP installer @Rerechan02
# FN Project

# Update Repository VPS
clear
apt update
apt-get -y upgrade


cd
# Install Ohp
wget -O /usr/local/bin/ohp "https://raw.githubusercontent.com/Rerechan02/v/main/OPENVPN/ohp"
chmod +x /usr/local/bin/ohp

# create service
cat > /etc/systemd/system/ohp-openvpn.service <<END
[Unit]
Description=OHP Openvpn
Documentation=https://t.me/fn_project
Wants=network.target
After=network.target

[Service]
ExecStart=/usr/local/bin/ohp -port 8585 -proxy 127.0.0.1:3128 -tunnel 127.0.0.1:1194
Restart=always
RestartSec=3

[Install]
WantedBy=multi-user.target
END

cat > /etc/systemd/system/ohp-ssh.service <<END
[Unit]
Description=OHP SSH
Documentation=https://t.me/fn_project
Wants=network.target
After=network.target

[Service]
ExecStart=/usr/local/bin/ohp -port 8686 -proxy 127.0.0.1:3128 -tunnel 127.0.0.1:3303
Restart=always
RestartSec=3

[Install]
WantedBy=multi-user.target
END

cat > /etc/systemd/system/ohp-dropbear.service <<END
[Unit]
Description=OHP SSH
Documentation=https://t.me/@fn_project
Wants=network.target
After=network.target

[Service]
ExecStart=/usr/local/bin/ohp -port 8787 -proxy 127.0.0.1:3128 -tunnel 127.0.0.1:109
Restart=always
RestartSec=3

[Install]
WantedBy=multi-user.target
END

# active service ohp
systemctl daemon-reload
systemctl enable ohp-openvpn
systemctl enable ohp-ssh
systemctl enable ohp-dropbear
systemctl restart ohp-openvpn
systemctl restart ohp-ssh
systemctl restart ohp-dropbear
echo ""
echo -e " Done installer "
echo -e " Rere OVPN 1.2 "
sleep 1
clear
