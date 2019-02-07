#!/usr/bin/env bash

echo "deb http://mirror.yandex.ru/debian/ stretch main contrib non-free"                       > /etc/apt/sources.list;
echo "deb-src http://mirror.yandex.ru/debian/ stretch main contrib non-free"                  >> /etc/apt/sources.list;
echo "deb http://mirror.yandex.ru/debian/ stretch-updates main contrib non-free"              >> /etc/apt/sources.list;
echo "deb-src http://mirror.yandex.ru/debian/ stretch-updates main contrib non-free"          >> /etc/apt/sources.list;
echo "deb http://mirror.yandex.ru/debian-security/ stretch/updates main contrib non-free"     >> /etc/apt/sources.list;
echo "deb-src http://mirror.yandex.ru/debian-security/ stretch/updates main contrib non-free" >> /etc/apt/sources.list;

apt update
apt full-upgrade
apt install apt-transport-https mc net-tools aptitude;

# Sudo
apt install sudo
usermod -a -G sudo rodzewich

# Установка шрифтов
apt-get install ttf-freefont ttf-mscorefonts-installer fonts-noto;
echo "<?xml version=\"1.0\"?>"                            > /etc/fonts/local.conf;
echo "<!DOCTYPE fontconfig SYSTEM \"fonts.dtd\">"        >> /etc/fonts/local.conf;
echo "<fontconfig>"                                      >> /etc/fonts/local.conf;
echo "    <match target=\"font\">"                       >> /etc/fonts/local.conf;
echo "        <edit mode=\"assign\" name=\"rgba\">"      >> /etc/fonts/local.conf;
echo "            <const>rgb</const>"                    >> /etc/fonts/local.conf;
echo "        </edit>"                                   >> /etc/fonts/local.conf;
echo "    </match>"                                      >> /etc/fonts/local.conf;
echo "    <match target=\"font\">"                       >> /etc/fonts/local.conf;
echo "        <edit mode=\"assign\" name=\"hinting\">"   >> /etc/fonts/local.conf;
echo "            <bool>true</bool>"                     >> /etc/fonts/local.conf;
echo "        </edit>"                                   >> /etc/fonts/local.conf;
echo "    </match>"                                      >> /etc/fonts/local.conf;
echo "    <match target=\"font\">"                       >> /etc/fonts/local.conf;
echo "        <edit mode=\"assign\" name=\"hintstyle\">" >> /etc/fonts/local.conf;
echo "            <const>hintslight</const>"             >> /etc/fonts/local.conf;
echo "        </edit>"                                   >> /etc/fonts/local.conf;
echo "    </match>"                                      >> /etc/fonts/local.conf;
echo "    <match target=\"font\">"                       >> /etc/fonts/local.conf;
echo "        <edit mode=\"assign\" name=\"lcdfilter\">" >> /etc/fonts/local.conf;
echo "            <const>lcddefault</const>"             >> /etc/fonts/local.conf;
echo "        </edit>"                                   >> /etc/fonts/local.conf;
echo "    </match>"                                      >> /etc/fonts/local.conf;
echo "    <match target=\"font\">"                       >> /etc/fonts/local.conf;
echo "        <edit mode=\"assign\" name=\"autohint\">"  >> /etc/fonts/local.conf;
echo "            <bool>false</bool>"                    >> /etc/fonts/local.conf;
echo "        </edit>"                                   >> /etc/fonts/local.conf;
echo "    </match>"                                      >> /etc/fonts/local.conf;
echo "    <dir>~/.fonts</dir>"                           >> /etc/fonts/local.conf;
echo "</fontconfig>"                                     >> /etc/fonts/local.conf;

# Teamviewer
wget -O ./teamviewer_amd64.deb https://download.teamviewer.com/download/linux/teamviewer_amd64.deb;
wget -O ./teamviewer-host_amd64.deb https://download.teamviewer.com/download/linux/teamviewer-host_amd64.deb;
dpkg -i ./teamviewer_amd64.deb;
apt -f -y install;
unlink ./teamviewer_amd64.deb;
dpkg -i ./teamviewer-host_amd64.deb;
unlink ./teamviewer-host_amd64.deb;
apt -f -y install;

# Open Project
wget -qO- https://dl.packager.io/srv/opf/openproject-ce/key | apt-key add -;
wget -O /etc/apt/sources.list.d/openproject-ce.list https://dl.packager.io/srv/opf/openproject-ce/stable/8/installer/debian/9.repo;
apt-get update;
apt-get install -y openproject;

# Smart GIT
wget -O smartgit.deb https://www.syntevo.com/downloads/smartgit/smartgit-18_2_5.deb;
dpkg -i ./smartgit.deb;
unlink ./smartgit.deb;

wget -O https://release.axocdn.com/linux/gitkraken-amd64.deb;
dpkg -i ./gitkraken-amd64.deb;
unlink ./gitkraken-amd64.deb;

# Emulators
apt install -y retroarch;
apt install -y fuse-emulator-common spectrum-roms

# Atom
wget -qO - https://packagecloud.io/AtomEditor/atom/gpgkey | apt-key add -
echo "deb [arch=amd64] https://packagecloud.io/AtomEditor/atom/any/ any main" > /etc/apt/sources.list.d/atom.list;
apt update && apt install -y atom;

# Vscode
wget -qO - https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor | apt-key add;
echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list;
apt update && apt install -y code;

# Sublime text
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | apt-key add -;
echo "deb https://download.sublimetext.com/ apt/stable/" > /etc/apt/sources.list.d/sublime-text.list;
apt update && apt install -y sublime-text gvfs-backends gvfs-fuse;

# Brackets
wget https://github.com/adobe/brackets/releases/download/release-1.13/Brackets.Release.1.13.64-bit.deb;
dpkg -i ./Brackets.Release.1.13.64-bit.deb;
unlink ./Brackets.Release.1.13.64-bit.deb;
apt --fix-broken install;

# Google Chrome
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -;
echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list;
apt update && apt install -y google-chrome-stable

# Opera
wget -q -O - https://deb.opera.com/archive.key | apt-key add -;
echo "deb [arch=i386,amd64] https://deb.opera.com/opera-stable/ stable non-free" > /etc/apt/sources.list.d/opera-stable.list;
apt update && apt install -y opera-stable;

# Vivaldi
wget -O - http://repo.vivaldi.com/stable/linux_signing_key.pub | sudo apt-key add -;
echo "deb http://repo.vivaldi.com/stable/deb/ stable main" > /etc/apt/sources.list.d/vivaldi.list;
apt update && apt install -y vivaldi-stable;

# Yandex-Browser
wget -O - https://repo.yandex.ru/yandex-browser/YANDEX-BROWSER-KEY.GPG | sudo apt-key add -;
echo "deb [arch=amd64] http://repo.yandex.ru/yandex-browser/deb beta main" > /etc/apt/sources.list.d/yandex-browser-beta.list;
apt update && apt install -y yandex-browser-beta;

# Telegram
apt install -y dirmngr;
echo "deb http://ppa.launchpad.net/atareao/telegram/ubuntu xenial main"      > /etc/apt/sources.list.d/telegram.list;
echo "deb-src http://ppa.launchpad.net/atareao/telegram/ubuntu xenial main" >> /etc/apt/sources.list.d/telegram.list;
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 36FD5529;
apt update && apt install telegram

# Skype
wget -O skype-install.deb https://go.skype.com/skypeforlinux-64.deb;
apt install -y ./skype-install.deb;
unlink ./skype-install.deb;
apt -f -y install;

# Viber
wget -O viber.deb https://download.cdn.viber.com/cdn/desktop/Linux/viber.deb;
apt install -y ./viber.deb;
unlink ./viber.deb;
apt -f -y install;

# Zoom
wget -O zoom_amd64.deb https://zoom.us/client/latest/zoom_amd64.deb;
apt install -y ./zoom_amd64.deb;
unlink ./zoom_amd64.deb;
apt -f -y install;

# Slack
wget -O slack-desktop-3.3.7-amd64.deb https://downloads.slack-edge.com/linux_releases/slack-desktop-3.3.7-amd64.deb;
dpkg -i ./slack-desktop-3.3.7-amd64.deb;
unlink ./slack-desktop-3.3.7-amd64.deb;
apt -f -y install;

# Vk Messenger
wget -O vk-messenger.deb "https://desktop.userapi.com/get_last?platform=linux64&branch=master&packet=deb";
apt install -y ./vk-messenger.deb;
unlink ./vk-messenger.deb;
apt -f -y install;

# Fb Messenger
wget -O fb-messenger.deb "https://dl.messengerfordesktop.com/download/linux/latest?arch=amd64&pkg=deb";
apt install -y ./fb-messenger.deb;
unlink ./fb-messenger.deb;
apt -f -y install;

# Twitter
wget -O ./franz.deb https://github.com/meetfranz/franz/releases/download/v5.0.0/franz_5.0.0_amd64.deb;
dpkg -i ./franz.deb;
unlink ./franz.deb;
apt -f -y install;

wget -O ./ring-all_amd64.deb https://dl.ring.cx/ring-manual/debian_9/ring-all_amd64.deb;
dpkg -i ./ring-all_amd64.deb;
unlink ./ring-all_amd64.deb;
apt -f -y install;

wget -O ./discordapp.deb "https://discordapp.com/api/download?platform=linux&format=deb";
dpkg -i ./discordapp.deb;
unlink ./discordapp.deb;
apt -f -y install;

## GAMES

wget -O - https://download.opensuse.org/repositories/home:/strycore/Debian_9.0/Release.key | apt-key add -;
echo "deb http://download.opensuse.org/repositories/home:/strycore/Debian_9.0/ ./" > /etc/apt/sources.list.d/lutris.list;
apt-get update;
apt-get install -y lutris;
apt -f -y install;

apt install libx11-6:i386 libstdc++6:i386 libgl1-mesa-glx:i386;
wget -O ./steam.deb https://steamcdn-a.akamaihd.net/client/installer/steam.deb;
dpkg -i ./steam.deb;
unlink ./steam.deb;
apt -f -y install;

## OFFICE

wget -O ./softmaker-office.deb https://www.softmaker.net/down/softmaker-office-2018_946-01_amd64.deb;
dpkg -i ./softmaker-office.deb;
unlink ./softmaker-office.deb;
apt -f -y install;

wget -O ./wps-office.deb http://kdl.cc.ksosoft.com/wps-community/download/6757/wps-office_10.1.0.6757_amd64.deb;
dpkg -i ./wps-office.deb;
unlink ./wps-office.deb;
apt -f -y install;

# Power Shell
wget -O - https://packages.microsoft.com/keys/microsoft.asc | apt-key add -;
echo "deb [arch=amd64] https://packages.microsoft.com/repos/microsoft-debian-stretch-prod stretch main" > /etc/apt/sources.list.d/microsoft.list;
apt-get update;
apt-get install -y powershell;

# Установка программ
apt install file-roller evince qalculate clementine vlc gimp shotwell gparted gnome-disk-utility libreoffice-writer libreoffice-calc libreoffice-impress vim emacs nano kodi gimp krita gparted transmission deluge filezilla thunderbird taskwarrior eclipse-* netbeans netbeans-* rhythmbox banshee smplayer clementine cmus shutter alien blender blender-data chromium chromium-l10n darktable digikam neofetch openssh-server mercurial subversion git zim clipit empathy pidgin mkchromecast htop geany gufw texmaker kazam bacula openshot uget xdm aria2 calibre freecad librecad openscad;

# Far Manager
apt install -y gawk m4 libglib2.0-dev libwxgtk3.0-dev cmake g++ git;
git clone https://github.com/elfmz/far2l far;
cd ./far;
cmake -DUSEWX=yes -DCMAKE_BUILD_TYPE=Release;
make -j4;
make install;
cd ../;
rm -rf ./far;

# MailSpring
wget -O ./mailspring.deb "https://updates.getmailspring.com/download?platform=linuxDeb";
dpkg -i ./mailspring.deb;
apt -f -y install;
unlink ./mailspring.deb;

### https://www.vandyke.com/cgi-bin/releases.php?product=securecrt

# XN Converter
wget  -O ./xnconvert-linux-x64.deb https://download.xnview.com/XnConvert-linux-x64.deb;
dpkg -i ./xnconvert-linux-x64.deb;
unlink ./xnconvert-linux-x64.deb;

# Yandex Disk
echo "deb http://repo.yandex.ru/yandex-disk/deb/ stable main" > /etc/apt/sources.list.d/yandex-disk.list;
wget http://repo.yandex.ru/yandex-disk/YANDEX-DISK-KEY.GPG -O- | apt-key add -;
apt update;
apt install -y yandex-disk;

# Gnome Browser
apt install epiphany-browser;

# Google Cloud SDK
# https://cloud.google.com/sdk/docs/quickstart-debian-ubuntu
export CLOUD_SDK_REPO="cloud-sdk-$(lsb_release -c -s)";
wget https://packages.cloud.google.com/apt/doc/apt-key.gpg -O- | apt-key add -
echo "deb http://packages.cloud.google.com/apt $CLOUD_SDK_REPO main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list;
apt update;
apt install -y google-cloud-sdk;

# Typora
wget -qO - https://typora.io/linux/public-key.asc | apt-key add -;
echo "deb https://typora.io/linux ./" > /etc/apt/sources.list.d/typora.list;
apt-get update;
apt-get install typora;

# VirtualBox
echo "deb http://download.virtualbox.org/virtualbox/debian stretch contrib" > /etc/apt/sources.list.d/virtualbox.list;
wget -qO - https://www.virtualbox.org/download/oracle_vbox_2016.asc | apt-key add -;
apt update;
apt install -y virtualbox-5.2;

simplenote
pitiv

overgrive
Lightworks

Remmina
Iptables
ExpressVPN
Audacious
Ardour
Vim
Stacer
FreeCAD
Synaptic
Pidgin
Empathy

BleachBit
Terminator

VMWare

# https://get.adobe.com/ru/flashplayer/
#wget -O ./flashplugin.rpm "https://get.adobe.com/ru/flashplayer/download/?installer=FP_32.0_for_Linux_64-bit_(.rpm)_-_PPAPI&sType=7472&standalone=1";
#alien ./flashplugin.rpm;
#dpkg -i ./flashplugin.deb;
#unlink ./flashplugin.rpm;
#unlink ./flashplugin.deb;

# VMWare
wget -O workstation https://www.vmware.com/go/getworkstation-linux;
chmod 777 ./workstation;
./workstation;
unlink ./workstation;

# FreeCAD
wget -O /usr/share/freecad https://github.com/FreeCAD/FreeCAD/releases/download/0.17/FreeCAD-0.17.13541.9948ee4.glibc2.17-x86_64.AppImage;
chmod 777 /usr/share/freecad;
ln -s /usr/bin/freecad /usr/share/freecad;


# SQL Developer
# https://download.oracle.com/otn/java/sqldeveloper/sqldeveloper-18.4.0-376.1900.noarch.rpm

# Putty
apt install putty putty-tools


# timeshift

nvidia-driver


uget
kolourpaint
