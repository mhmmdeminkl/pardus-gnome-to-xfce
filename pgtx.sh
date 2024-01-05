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

paket_yükle() {
  apt-get install "$1" -y
}

paket_yükle "lightdm
xfwm4
xfdesktop4-data
xfdesktop4
xfconf
xfce4-xkb-plugin
xfce4-whiskermenu-plugin
xfce4-weather-plugin
xfce4-wavelan-plugin
xfce4-verve-plugin
xfce4-timer-plugin
xfce4-terminal
xfce4-taskmanager
xfce4-systemload-plugin
xfce4-smartbookmark-plugin
xfce4-settings
xfce4-session
xfce4-sensors-plugin
xfce4-screenshooter
xfce4-pulseaudio-plugin
xfce4-power-manager-plugins
xfce4-power-manager-data
xfce4-power-manager
xfce4-places-plugin
xfce4-panel
xfce4-notifyd
xfce4-netload-plugin
xfce4-mailwatch-plugin
xfce4-helpers
xfce4-goodies
xfce4-genmon-plugin
xfce4-fsguard-plugin
xfce4-diskperf-plugin
xfce4-dict
xfce4-cpugraph-plugin
xfce4-cpufreq-plugin
xfce4-clipman-plugin
xfce4-clipman
xfce4-battery-plugin
xfce4-appfinder
xfce4
xfburn
thunar
ristretto
policykit-1-gnome
mousepad
libxfconf-0-3
libxfce4util7
libxfce4util-common
libxfce4util-bin
libxfce4ui-utils
libxfce4ui-common
libxfce4ui-2-0
libxfce4panel-2.0-4
libgarcon-gtk3-1-0
libgarcon-1-0
libexo-2-0
gir1.2-xfconf-0
pardus-xfce-desktop
pardus-xfce-greeter
pardus-xfce-gtk-theme
pardus-xfce-icon-theme
pardus-xfce-live-settings
pardus-xfce-settings
pardus-xfce-tweaks"
# Giriş ekranı sçimi
sudo dpkg-reconfigure lightdm
# Gnome paketlerinin silinmesi
paket_sil() {
  apt-get purge "$1" -y
}

paket_sil "gdm3
gdm
*gnome*
pardus-gnome-desktop
pardus-gnome-greeter
pardus-gnome-settings
pardus-gnome-shortcuts"
gnome-desktop3-data
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
