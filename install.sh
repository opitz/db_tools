#!/usr/bin/env bash

if [[ $EUID -ne 0 ]]; then
   echo "SORRY! This script must be run as root/superuser!" 
   exit 1
fi

echo ' '
echo "Installing multihost DB CLI tools v.2.0"
echo "----------------------------------------"

# check for the updated config file and read the settings 
if [ ! -f ./db_tools.conf ]
	then
	echo "No configuration file found at ./db_tools.conf - aborting!"
	exit 1
fi
. ./db_tools.conf

# installing/updating the configuration file
if [ -f /etc/db_tools.conf ]
	then
	echo "Found an existing '/etc/db_tools.conf' file!."
else
	sudo cp db_tools.conf /etc/db_tools.conf
	sudo chmod 777 /etc/db_tools.conf
	echo "==> A '/etc/db_tools.conf' file has been placed and probably needs to be configured in order to finish the initial setup."
fi
echo "Please press any key to open that file with an editor, make any necessay changes and save them."
echo "The setup will continue after you have closed the editor."
read -n 1 -s
sudo nano /etc/db_tools.conf

# check for the updated config file and read the settings 
if [ ! -f /etc/db_tools.conf ]
	then
	echo "No configuration file found at /etc/db_tools.conf - aborting!"
	exit 1
fi
. /etc/db_tools.conf

# now actually install the cli commands
cho "==> installing reload_db"
sudo cp ./reload_db $install_path/reload_db
sudo chmod +x $install_path/reload_db

echo "==> installing localise_db"
sudo cp ./localise_db $install_path/localise_db
sudo chmod +x $install_path/localise_db

echo "==> installing dump_db"
sudo cp ./dump_db $install_path/dump_db
sudo chmod +x $install_path/dump_db

echo '==> all done!'