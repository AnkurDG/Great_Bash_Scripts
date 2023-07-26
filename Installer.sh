#!/bin/bash

echo "Welcome to The_Installer"
sleep 1
echo "You can download any application on your Linux distro"
sleep 1

echo -e "Select an option to install: \n1) Visual Studio Code\n2) Brave Browser\n3) Chrome\n4) Zsh Shell\n5) Build-Essential\n6) VLC Media Player"
read -p "Enter your choice: " OPTION

case $OPTION in
  1)
    echo "Installing Visual Studio Code..."
    sudo snap install --classic code > file.txt 2>&1
    if [ $? -eq 0 ]; then
        echo "Visual Studio Code Installed Successfully"
        code --version
    else
        echo "Failed to install Visual Studio Code. Check file.txt for error logs."
    fi
    ;;

  2)
    echo "Installing Brave Browser..."
    sudo apt install apt-transport-https curl > file.txt 2>&1
    curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | sudo apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add - > file.txt 2>&1
    echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
    sudo apt update > file.txt 2>&1
    sudo apt install brave-browser > file.txt 2>&1
    if [ $? -eq 0 ]; then
        echo "Brave Browser Installed Successfully"
    else
        echo "Failed to install Brave Browser. Check file.txt for error logs."
    fi
    rm file.txt
    ;;

  3)
    echo "Installing Chrome..."
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb > file.txt 2>&1
    sudo dpkg -i google-chrome-stable_current_amd64.deb > file.txt 2>&1
    if [ $? -eq 0 ]; then
        echo "Chrome Installed Successfully"
    else
        echo "Failed to install Chrome. Check file.txt for error logs."
    fi
    rm file.txt
    ;;

  4)
    echo "Installing Zsh Shell..."
    sudo apt-get update > file.txt 2>&1
    sudo apt-get install zsh > file.txt 2>&1
    if [ $? -eq 0 ]; then
        echo "Zsh Shell Installed Successfully"
    else
        echo "Failed to install Zsh Shell. Check file.txt for error logs."
    fi
    rm file.txt
    ;;

  5)
    echo "Installing Build-Essential..."
    sudo apt update > file.txt 2>&1
    sudo apt install build-essential > file.txt 2>&1
    if [ $? -eq 0 ]; then
        echo "Build-Essential Installed Successfully"
    else
        echo "Failed to install Build-Essential. Check file.txt for error logs."
    fi
    rm file.txt
    ;;

  6)
    echo "Installing VLC..."
    sudo apt install snapd > file.txt 2>&1
    sudo snap install vlc > file.txt 2>&1
    if [ $? -eq 0 ]; then
        echo "VLC Installed Successfully"
    else
        echo "Failed to install VLC. Check file.txt for error logs."
    fi
    rm file.txt
    ;;

  *)
    echo "Exiting..."
    ;;
esac
