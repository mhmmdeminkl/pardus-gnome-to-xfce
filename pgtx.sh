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
sudo apt-get -y install lightdm
sudo apt-get -y install xfwm4
sudo apt-get -y install xfdesktop4-data
sudo apt-get -y install xfdesktop4
sudo apt-get -y install xfconf
sudo apt-get -y install xfce4-xkb-plugin
sudo apt-get -y install xfce4-whiskermenu-plugin
sudo apt-get -y install xfce4-weather-plugin
sudo apt-get -y install xfce4-wavelan-plugin
sudo apt-get -y install xfce4-verve-plugin
sudo apt-get -y install xfce4-timer-plugin
sudo apt-get -y install xfce4-terminal
sudo apt-get -y install xfce4-taskmanager
sudo apt-get -y install xfce4-systemload-plugin
sudo apt-get -y install xfce4-smartbookmark-plugin
sudo apt-get -y install xfce4-settings
sudo apt-get -y install xfce4-session
sudo apt-get -y install xfce4-sensors-plugin
sudo apt-get -y install xfce4-screenshooter
sudo apt-get -y install xfce4-pulseaudio-plugin
sudo apt-get -y install xfce4-power-manager-plugins
sudo apt-get -y install xfce4-power-manager-data
sudo apt-get -y install xfce4-power-manager
sudo apt-get -y install xfce4-places-plugin
sudo apt-get -y install xfce4-panel
sudo apt-get -y install xfce4-notifyd
sudo apt-get -y install xfce4-netload-plugin
sudo apt-get -y install xfce4-mailwatch-plugin
sudo apt-get -y install xfce4-helpers
sudo apt-get -y install xfce4-goodies
sudo apt-get -y install xfce4-genmon-plugin
sudo apt-get -y install xfce4-fsguard-plugin
sudo apt-get -y install xfce4-diskperf-plugin
sudo apt-get -y install xfce4-dict
sudo apt-get -y install xfce4-cpugraph-plugin
sudo apt-get -y install xfce4-cpufreq-plugin
sudo apt-get -y install xfce4-clipman-plugin
sudo apt-get -y install xfce4-clipman
sudo apt-get -y install xfce4-battery-plugin
sudo apt-get -y install xfce4-appfinder
sudo apt-get -y install xfce4
sudo apt-get -y install xfburn
sudo apt-get -y install thunar
sudo apt-get -y install ristretto
sudo apt-get -y install policykit-1-gnome
sudo apt-get -y install mousepad
sudo apt-get -y install libxfconf-0-3
sudo apt-get -y install libxfce4util7
sudo apt-get -y install libxfce4util-common
sudo apt-get -y install libxfce4util-bin
sudo apt-get -y install libxfce4ui-utils
sudo apt-get -y install libxfce4ui-common
sudo apt-get -y install libxfce4ui-2-0
sudo apt-get -y install libxfce4panel-2.0-4
sudo apt-get -y install libgarcon-gtk3-1-0
sudo apt-get -y install libgarcon-1-0
sudo apt-get -y install libexo-2-0
sudo apt-get -y install gir1.2-xfconf-0
sudo apt-get -y install pardus-xfce-desktop
sudo apt-get -y install pardus-xfce-greeter
sudo apt-get -y install pardus-xfce-gtk-theme
sudo apt-get -y install pardus-xfce-gtk-theme
sudo apt-get -y install pardus-xfce-gtk-theme
sudo apt-get -y install pardus-xfce-gtk-theme
sudo apt-get -y install pardus-xfce-icon-theme
sudo apt-get -y install pardus-xfce-live-settings
sudo apt-get -y install pardus-xfce-settings
sudo apt-get -y install pardus-xfce-tweaks
# Giriş ekranı seçimi
sudo dpkg-reconfigure lightdm

# Gnome paketlerinin silinmesi
sudo apt-get -y purge gdm3
sudo apt-get -y purge gdm
sudo apt-get -y purge *gnome*
sudo apt-get -y purge pardus-gnome-desktop
sudo apt-get -y purge pardus-gnome-greeter
sudo apt-get -y purge pardus-gnome-settings
sudo apt-get -y purge pardus-gnome-shortcuts
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
