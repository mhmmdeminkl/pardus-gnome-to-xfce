# Pardus GNOME to XFCE

Scripte GNOME masaüstü ortamından XFCE masaüstü ortamına geçiş için aksiyonlar eklenmektedir. Script henüz TEST EDİLMEMİŞTİR. Lütfen Vmware, Vbox, Kutular uygulaması üzerinden test ediniz. Ana sisteminizde denemeniz çökmelere sebebiyet verebilir.

Pardus kullanıcılarının GNOME masaüstü ortamından XFCE masaüstü ortamına geçiş yapmaya yarayan kod betiği. 

## Kurulum
XFCE arayüzünü yüklerken GNOME arayüzünü silme işlemi gerçekleşeceği için tty1 ekranına geçmeniz önerilmektedir. CTRL+ALT+F7 kombinasyonu ile tty1 ekranına geçerek daha sağlıklı bir geçiş sağlayabilirsiniz.

Kurulum için aşağıdaki komutlarla bu git reposunu kendi cihazınıza klonlamanız
gerekmektedir.

```
git clone https://github.com/mhmmdeminkl/pardus-gnome-to-xfce.git
cd pardus-gnome-to-xfce
```

Kurulum işlemi bitmiştir.

## Çalıştırma
Şimdi basitçe aşağıdaki komutla çalıştırabilirsiniz.

```
bash pgtx.sh
```

Script çalıştığında gerekli uyarıları yapmaktadır.
**Sorumluluk Reddi**: Script çalıştığında oluşabilecek her türlü sorunun sorumluluğu size aittir. Yaşadığınız sorunlarla ilgili Pardus Forumlar üzerinden açmış olduğum [Gnome'dan Xfce'ye geçiş rehberi](https://forum.pardus.org.tr/t/pardus-23-gnomedan-xfcee-gecme-rehber/25018) ne yorum yaparak sorununuza çözüm bulmayı deneyebilirsiniz.

**UYARI**: Script Pardus 23.0 İşletim Sistemi ile test edilmiştir. Başka sürümlerde denemeniz çökmelere sebebiyet verebilir!
