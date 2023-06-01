#!/bin/bash

echo "Welcome to The_Installer"
sleep 1
echo "You can download any application on your linux distro"
sleep 1

echo -n "Select an option which u want to install"
sleep 2

echo ""
echo " 1)Visual Studio Code
      2)Brave Browser
      3)Chrome 
      4)zsh
      5)Build-Essential
      6)VLC meadia Player
      7)"
read OPTION

# echo -n "The official language of $COUNTRY is "


case $OPTION in

  1)echo -n "Installing Visual Studio Code"
   sudo snap install --classic code 2> file.txt
   echo ""
   echo "Version:" 
   code --version
   echo " Vs Code Installed successfully"
   
    ;;

  2)
    echo -n "Installing Brave-Browser"
    sudo apt install apt-transport-https curl > file.txt 2>&1
    curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | sudo apt-key --      keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add - > file.txt 2>&1
   echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
    sudo apt update > file.txt 2>&1
    sudo apt install brave-browser 2> file.txt 
    sleep 1
    rm file.txt
    echo -n "Brave Installed  successfully"
    ;;

  3)
    echo -n "Installing Chrome"
    echo ""
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb > file.txt 2>&1
    sudo dpkg -i google-chrome-stable_current_amd64.deb > file.txt 2>&1
    echo -n "Chrome Installed  successfully"
    sleep 1
    clear
    ;;
  4)
  echo -n "Installing Zsh Shell"
   sudo apt-get update > file.txt 2>&1
   sudo apt-get install zsh > file.txt 2>&1
   echo -n "zsh Shell Installed successfully"
   sleep 1
   clear
  ;;

  5)
  echo -n "Installing Build-Essential"
   sudo apt update && sudo apt install build-essential
   echo -n "Build-Essential Installed successfully"
   sleep 1
   clear
  ;;
  6)
  echo -n "Installing VLC"
   sudo apt install snapd
   sudo snap install vlc 
   echo -n "VLC Installed successfully"
   sleep 1
   clear
  ;;
    
    

  *)
    echo -n "Exiting"
    ;;
esac
