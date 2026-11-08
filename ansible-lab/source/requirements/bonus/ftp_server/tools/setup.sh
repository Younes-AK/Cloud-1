#!/bin/bash

cat <<EOF > /etc/vsftpd.conf
listen=YES
anonymous_enable=NO
local_enable=YES
write_enable=YES
local_umask=022
pasv_enable=YES
pasv_min_port=30000
pasv_max_port=30009
local_root=/home/${FTP_USERNAME}

EOF

useradd -m -d /home/${FTP_USERNAME} "${FTP_USERNAME}"
echo "${FTP_USERNAME}:${FTP_PASSWORD}" | chpasswd
service vsftpd stop

/usr/sbin/vsftpd /etc/vsftpd.conf