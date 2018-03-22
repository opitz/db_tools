#!/usr/bin/env bash

if [[ $EUID -ne 0 ]]; then
   echo "SORRY! This script must be run as root/superuser!" 
   exit 1
fi

echo ' '
echo "Installing multihost DB CLI tools v.1.5"
echo "----------------------------------------"
echo "==> installing reload_db"
sudo cp ./reload_db /usr/local/sbin/reload_db
sudo chmod +x /usr/local/sbin/reload_db

echo "==> installing localise_db"
sudo cp ./localise_db /usr/local/sbin/localise_db
sudo chmod +x /usr/local/sbin/localise_db

echo "==> installing dump_db"
sudo cp ./dump_db /usr/local/sbin/dump_db
sudo chmod +x /usr/local/sbin/dump_db
