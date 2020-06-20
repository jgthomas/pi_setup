#!/bin/bash


update_packages() {
        sudo apt update && sudo apt upgrade
}


install_vim() {
        sudo apt install vim -y
}


install_wireguard() {
        # https://www.sigmdel.ca/michel/ha/wireguard/wireguard_02_en.html
        sudo apt install raspberrypi-kernel-headers && \
                echo "deb http://deb.debian.org/debian/ unstable main" | sudo tee --append /etc/apt/sources.list.d/unstable.list && \
                wget -O - https://ftp-master.debian.org/keys/archive-key-$(lsb_release -sr).asc | sudo apt-key add - && \
                printf 'Package: *\nPin: release a=unstable\nPin-Priority: 150\n' | sudo tee --append /etc/apt/preferences.d/limit-unstable && \
                sudo apt update && \
                sudo apt install wireguard -y
}


install_qbittorrent() {
        sudo apt install qbittorrent -y
}


install_plex() {
        # https://pimylifeup.com/raspberry-pi-plex-server/
        sudo apt install apt-transport-https && \
                curl https://downloads.plex.tv/plex-keys/PlexSign.key | sudo apt-key add - && \
                echo deb https://downloads.plex.tv/repo/deb public main | sudo tee /etc/apt/sources.list.d/plexmediaserver.list && \
                sudo apt update && \
                sudo apt install plexmediaserver -y
}


pi_setup() {
        update_packages && \
                install_vim && \
                install_wireguard && \
                install_qbittorrent && \
                install_plex
}


pi_setup
