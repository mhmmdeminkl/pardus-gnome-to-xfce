#!/bin/bash

echo "Pardus Gnome to Xfce Başlıyor."
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
    echo "İşleme devam ediliyor. Lütfen root yetkisi için şifrenizi girebilir misiniz?"
else
    echo "İşlem iptal edildi. Çıkış yapılıyor. Tekrar görüşmek üzere..."
    exit
fi

# Güncelleme, XFCE yükleme işlemi ve GNOME arayüzüne dair tüm paketlerin silinmesi
sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -y install pardus-xfce-desktop
sudo apt-get -y install pardus-xfce-greeter
sudo apt-get -y install pardus-xfce-gtk-theme
sudo apt-get -y install pardus-xfce-icon-theme
sudo apt-get -y install pardus-xfce-live-settings
sudo apt-get -y install pardus-xfce-settings
sudo apt-get -y install pardus-xfce-tweaks
sudo dpkg-reconfigure lightdm
sudo apt-get -y purge gdm3
sudo apt-get -y purge gdm
sudo apt-get -y install pardus-gnome-desktop
sudo apt-get -y install pardus-gnome-greeter
sudo apt-get -y install pardus-gnome-settings
sudo apt-get -y install pardus-gnome-shortcuts
sudo apt-get -y purge gnome-desktop3-data
# XFCE arayüzünün GNOME arayüzü ile ilgili paketleri kullanma ihtimali bulunduğu için tekrar kullanıldı.
sudo apt-get -y pardus-xfce-*
sudo apt-get -y autoremove
sudo apt-get -y clean
sudo apt-get -y autoclean

# Pardus Karşılayıcı için autostart işlemi
`cp /usr/share/applications/tr.org.pardus.xfce-greeter.desktop ~/.config/autostart/`

echo "İşlem tamamlandı. Başka scriptlerde görüşmek üzere..."

echo -e  "\033[31mDeğişikliklerin uygulanabilmesi için bilgisayarınız yeniden başlatılacaktır. Bu soruya onay vermelisiniz!\033[0m"

# Kullanıcı onayı istenilmektedir.
confirm() {
    while true; do
        read -p "Bilgisayarınız yeniden başlatılacaktır? (Evet) " yn
        case $yn in
            [Ee]* ) return 0;;
            * ) echo "Sizi anlayamadım. Lütfen tekrar dener misiniz? Evet[Ee].";;
        esac
    done
}

 
# Verilen girdiye göre işlemin devamı
if confirm; then
    echo " Bilgisayarınız yeniden başlatılıyor."
   sudo reboot now
fi 
