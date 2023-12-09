#!/bin/bash

echo "Pardus Gnome Temizliği Başlıyor."
echo -e  "\033[31mUYARI! Bu işlem Geri Alınamaz!\033[0m"

# Kullanıcı onayı istenilmektedir.
confirm() {
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
 
# Verilen girdiye göre işlemin devamı veya iptali
if confirm; then
    echo "İşleme devam ediliyor lütfen bekleyiniz..."
else
    echo "İşlem iptal edildi. Çıkış yapılıyor. Tekrar görüşmek üzere..."
    exit
fi

# Güncelleme, XFCE yükleme işlemi ve GNOME arayüzüne dair tüm paketlerin silinmesi
sudo apt-get -y update
sudo apt-get -y upgrade
sudo chvt 1
sudo apt-get -y install pardus-xfce-desktop
sudo dpkg-reconfigure lightdm
sudo apt-get -y purge pardus-gnome-*
sudo apt-get -y purge gnome-desktop3-data
sudo apt-get -y autoremove
sudo apt-get -y clean
sudo apt-get -y autoclean

echo "İşlem tamamlandı. Başka scriptlerde görüşmek üzere..."
