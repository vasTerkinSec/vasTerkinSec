#!/bin/bash
#проверяю наличие репозиторя Backports
if ! [ -f /etc/apt/sources.list.d/backports.list ]; then
	echo "deb http://dep.debian.org/debian buster-backports main" | sudo tee /etc/apt/sources.list.d/backports.list
fi
# обновляю пакетный менеджер
sudo apt update
sudo apt upgrade -y
# устанавливаю Apach2
sudo apt install apache2 -y
# устанавливаю Python
sudo apt install puthon -y
# устанавливаю и запускаем SSH-сервер
sudo apt install openssh-server -y
sudo systemctl start ssh
# скрипт очистки файлов журнала
cd /var/log
cat /dev/null > messages
cat /dev/null > wtmp
echo "Log files cleaned up."
ping -c 3 ya.ru
