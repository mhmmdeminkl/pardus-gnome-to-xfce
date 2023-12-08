#!/bin/bash

echo "Pardus Gnome Temizliği Başlıyor."
echo -e  "\033[31mUYARI! Bu işlem Geri Alınamaz!\033[0m"

# Function to display the confirmation prompt
function confirm() {
    while true; do
        read -p "Devam Etmek İstiyor musunuz? (Evet/Hayır/Çıkış) " yn
        case $yn in
            [Ee]* ) return 0;;
            [Hh]* ) return 1;;
            [Çç]* ) exit;;
            * ) echo "Sizi anlayamadım. Lütfen tekrar dener misiniz? Evet[Ee]/Hayır[Hh]/Çıkış[Çç].";;
        esac
    done
}
 
# Example usage of the confirm function
if confirm; then
    echo "İşleme devam ediliyor lütfen bekleyiniz..."
    # Place your code here to execute when user confirms
else
    echo "İşlem iptal edildi. Çıkış yapılıyor. Tekrar görüşmek üzere..."
    # Place your code here to execute when user denies
fi

sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -y purge pardus-gnome-*
sudo apt-get -y purge gnome-desktop3-data
sudo apt-get -y autoremove
sudo apt-get -y clean
sudo apt-get -y autoclean

echo "İşlem tamamlandı. Başka scriptlerde görüşmek üzere..."
