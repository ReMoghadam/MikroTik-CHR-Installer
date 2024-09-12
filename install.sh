#!/bin/bash

version="1.0"
date="2024-09-11"
by="Reza Moghadam"
repository="https://github.com/ReMoghadam"
x="@RealReMoghadam"
instagram="@ReMoghadam"
telegram="@ReMoghadam"
website="https://IPExperts.ir"
title="MikroTik CHR Installer - Version $version - by $by"

mikrotik_chr_installer() {
    sudo rm -f mikrotik-chr-installer.zip
    sudo rm -rf mikrotik-chr-installer
    wget -O mikrotik-chr-installer.zip https://github.com/remoghadam/mikrotik-chr-installer/archive/main.zip
    unzip mikrotik-chr-installer.zip
    if [ ! -d "mikrotik-chr-installer" ]; then
        sudo mkdir mikrotik-chr-installer
    fi
    sudo rm -rf mikrotik-chr-installer/*
    sudo mv mikrotik-chr-installer-main/* mikrotik-chr-installer/
    sudo rm -rf mikrotik-chr-installer-main
    sudo rm -f mikrotik-chr-installer.zip
    cd mikrotik-chr-installer/
    echo -e "\n#################################################################\nInstallation completed.\nReza Moghadam\n"
}

echo "$title"
echo -e "Updating OS and installing required packages...\n#################################################################\n"
if [ -x "$(command -v yum)" ]; then
    # CentOS/RHEL
    sudo yum -y update
    sudo yum -y install golang dialog unzip curl
elif [ -x "$(command -v apt-get)" ]; then
    # Debian/Ubuntu
    sudo DEBIAN_FRONTEND=noninteractive apt-get -y update
    sudo apt-get -y install golang dialog unzip curl
    sudo DEBIAN_FRONTEND=interactive
else
    echo "Unsupported distribution or package manager"
    exit 1
fi

mikrotik_chr_installer

while true; do
    choice=$(dialog --clear --backtitle "$title" \
        --title "MikroTik CHR Installer" \
        --no-cancel \
        --menu "\nChoose an operation:" 20 60 10  \
            "1" "MikroTik CHR - RouterOS Version 7" \
            "2" "MikroTik CHR - RouterOS Version 6" \
            "3" "About" \
            "0" "Quit" \
        2>&1 > /dev/tty)

    case "$choice" in
        "1") # Install RouterOS Version 7
            sudo curl -L https://download.mikrotik.com/routeros/7.15.3/chr-7.15.3.img.zip > mikrotik-chr.zip
            sudo funzip mikrotik-chr.zip > mikrotik-chr.img
            sudo dd if=mikrotik-chr.img of=/dev/sda bs=1M
            sudo reboot
            dialog --clear --backtitle "$title" --title "Success" --msgbox "\nMikroTik CHR 7.x installed successfully.\n\nPlease Login to your Mikrotik and secure default configurations ( Username & Password / IP Services ) ,ASAP., \n\nBye Bye!" 0 0

            ;;

        "2") # Install RouterOS Version 6
            sudo curl -L https://download.mikrotik.com/routeros/6.49.10/chr-6.49.10.img.zip > mikrotik-chr.zip
            sudo funzip mikrotik-chr.zip > mikrotik-chr.img
            sudo dd if=mikrotik-chr.img of=/dev/sda bs=1M
            sudo reboot
            dialog --clear --backtitle "$title" --title "Success" --msgbox "\nMikroTik CHR 6.x installed successfully.\n\nPlease Login to your Mikrotik and secure default configurations ( Username & Password / IP Services ) ,ASAP., \n\nBye Bye!" 0 0
            ;;

       
        "3") # About
            dialog --clear --backtitle "$title" \
            --title "About" \
            --msgbox "\nMikroTik CHR Installer - Version $version \n\nLicenced under GPLv3\n\nby $by\n\nRepository: $repository\nX ( Twitter ): $x\nInstagram : $instagram\nTelegram: $telegram\nWebsite : $website" 0 0
            ;;

        "0") # Quit
            clear
            exit 0
            ;;
    esac
done
