#!/bin/bash

release_file=/etc/os-release
logfile=/var/log/updater.log
errorlog=/var/log/updater_errors.log

RED="\033[1;31m"
GREEN="\033[1;32m"
NOCOLOR="\033[0m"

echo "" > $logfile
echo "" > $errorlog

check_exit_status() {
    if [ $? -ne 0 ]
    then
        echo -e "${RED}Failed!!! Check $errorlog for more information${NOCOLOR}"
    else
        echo -e "${GREEN}Success!!! Check $logfile for more information${NOCOLOR}"
    fi
}  

if grep -q "Arch" $release_file
then
    echo -e "${GREEN}Arch Linux detected${NOCOLOR}"
    echo -e "${GREEN}Updating system${NOCOLOR}"
    sudo pacman -Syu >> $logfile 2>> $errorlog
    check_exit_status
    echo -e "${GREEN}Updating AUR packages${NOCOLOR}"
    yay -Syu >> $logfile 2>> $errorlog
    check_exit_status

elif grep -q "Debian" $release_file || grep -q "Kali" $release_file
then
    echo -e "${GREEN}Debian detected${NOCOLOR}"
    echo -e "${GREEN}Updating system${NOCOLOR}"
    sudo apt update >> $logfile 2>> $errorlog
    # sudo apt upgrade >> $logfile 2>> $errorlog
    check_exit_status
    echo -e "${GREEN}Updating snap packages${NOCOLOR}"
    sudo snap refresh >> $logfile 2>> $errorlog
    check_exit_status
    echo -e "${GREEN}Updating flatpak packages${NOCOLOR}"
    sudo flatpak update >> $logfile 2>> $errorlog
    check_exit_status

elif grep -q "Ubuntu" $release_file
then
    echo -e "${GREEN}Ubuntu detected${NOCOLOR}"
    echo -e "${GREEN}Updating system${NOCOLOR}"
    sudo apt update >> $logfile 2>> $errorlog
    sudo apt upgrade >> $logfile 2>> $errorlog
    check_exit_status
    echo -e "${GREEN}Updating snap packages${NOCOLOR}"
    sudo snap refresh >> $logfile 2>> $errorlog
    check_exit_status
    echo -e "${GREEN}Updating flatpak packages${NOCOLOR}"
    sudo flatpak update >> $logfile 2>> $errorlog
    check_exit_status

elif grep -q "Fedora" $release_file
then
    echo -e "${GREEN}Fedora detected${NOCOLOR}"
    echo -e "${GREEN}Updating system${NOCOLOR}"
    sudo dnf update >> $logfile 2>> $errorlog
    check_exit_status
    echo -e "${GREEN}Updating flatpak packages${NOCOLOR}"
    sudo flatpak update >> $logfile 2>> $errorlog
    check_exit_status

elif grep -q "openSUSE" $release_file
then
    echo -e "${GREEN}openSUSE detected${NOCOLOR}"
    echo -e "${GREEN}Updating system${NOCOLOR}"
    sudo zypper update >> $logfile 2>> $errorlog
    check_exit_status
    echo -e "${GREEN}Updating flatpak packages${NOCOLOR}"
    flatpak update >> $logfile 2>> $errorlog
    check_exit_status

elif grep -q "Manjaro" $release_file
then
    echo -e "${GREEN}Manjaro detected${NOCOLOR}"
    echo -e "${GREEN}Updating system${NOCOLOR}"
    sudo pacman -Syu >> $logfile 2>> $errorlog
    check_exit_status
    echo -e "${GREEN}Updating AUR packages${NOCOLOR}"
    yay -Syu >> $logfile 2>> $errorlog
    check_exit_status

else
    echo -e "${RED}Unsupported OS${NOCOLOR}"
    exit 1
fi
