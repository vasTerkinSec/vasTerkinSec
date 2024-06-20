#!/bin/bash
# указываю директорию, в которой будет сохраняться резервная копия
archive="/backup/$(date +'%Y%m%d')"
# создаю директорию для резервной копии
mkdir -p $archive
# копирую директорию /home
cp -r /home $archive
# копирую конфигурационные файлы для SSH, RDP, FTP
cp /etc/ssh/sshd_config $archive
cp /etc/xrdp/xrdp.ini $archive
cp /etc/vsftpd.conf $archive
# копирую директорию /var/log
cp -r /var/log $archive
# архивирую созданную директорию
tar -czf $archive.tar.gz $archive
# удаляю временную директорию
rm -r $archive