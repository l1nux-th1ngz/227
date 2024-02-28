#!/bin/bash

 username="$1"
 echo "# Hello Madd Hatter!" >> /home/$username/.bashrc
pacman -S --noconfirm --needed chromium libreoffice-fresh glib2 glibc gcclibs gvfs 
automake autoconf coreutils autoconf-archive gdb ninja gcc cmake meson libxcb xcb-proto xcb-util xcb-util-keysyms libxfixes libx11 libxcomposite xorg-xinput libxrender pixman wayland-protocols 
cairo pango seatd libxkbcommon xcb-util-wm xorg-xwayland libinput libliftoff libdisplay-info cpio tomlplusplus wayland-utils hyprland kitty alacritty aalib ascii gum bats udisks2 udiskie libnotify
thunar xdg-user-dirs xdg-userdirs-dirs-gtk python nodejs go npm sddm wofi grim gtk2 gtk3 gtk4 gtk-layer-shell imv layershell-qt mako qt5-wayland qt6-wayland fuse3 pam gobject-introspection typescript
libdecor git gurl wget ffmpeg geany geany-plugins notepadqq imv swaybg lib32-libdecor lib32-libva lib32-wayland playerctl brightnesscrl polkit-kde-agent libpulse libsoup3 networkmanager nm-connection-editor
spotify-launcher kvantum pavucontrol ranger neofetch vlc mpv wl-clipboard cliphist dunst btop htop jq imagemagick ffmpegthumbnailer tumbler thunar-archive-plugin network-manager-applet libnma libmm-glib
noise-suppression-for-voice bluez bluez-utils blueman zip unzip archinstall arch-install-scripts parted gparted exfat-utils libdbusmenu-gtk3 gjs libappindicator-gtk3 upower dracut draco font-manager
fontconfig fuse-common fuse-zip bzip2 granite7 tk yad zenity gpm popt slang tcl libnewt polkit-gnome plymouth cantarell-fonts iana-etc filesystem freetype2 libdrm libpciaccess zlib libevdev libpng 
archiso libarchive lz4 expat xz acl zstd openssl mkinitcpio-archiso boost-libs i2pd jp2a mkinitcpio figlet lsd qt5-base qt5ct qt6-base qt6ct vhs acorn  jdk-openjdk nodejs-yaml intel-ucode rofi base-devel
multilib-devel sudo bzip3 aalib jo bluefish bats-assert bats-file bats-support acpi upower batctl viewnior thefuck eza terminator ufw gufw pacman-contrib namcap waybar libnova thunderbird
enchant mythes-en ttf-liberation hunspell-en_US ttf-bitstream-vera pkgstats adobe-source-sans-pro-fonts gst-plugins-good ttf-droid ttf-dejavu aspell-en icedtea-web gst-libav ttf-ubuntu-font-family ttf-anonymous-pro  
languagetool libmythes zathura-pdf-mupdf zathura-pdf-poppler i2pd peek 
# Update Dirs
  xdg-user-dirs-update 
  
cp -r wofi ~/.config
cp -r ranger ~/.config
cp -r kitty ~/.config
cp -r alacritty ~/.config
cp -r terminator ~/.config
cp -r geany ~/.config
cp -r notepadqq ~/.config
cp -r neofetch ~/.config
cp -r vlc ~/.config
cp -r mpv ~/.config
cp -r cliphist ~/.config
cp -r wl-clipboard ~/.config
cp -r btop ~/.config
cp -r htop ~/.config
cp -r qt5ct ~/.config
cp -r qt6ct ~/.config
cp -r terminator ~/.config
cp -r bluefish ~/.config
cp -r zathura ~/.config


sudo systemctl enable ufw
	sleep 3
	
sudo systemctl enable sddm
    sleep 3
    
sudo systemctl enable --now bluetooth.service
    sleep 3
	
sudo systemctl enable paccache.timer
	sleep 3
	
sudo systemctl enable i2pd 
	sleep 3

# This runs the following command before Calamares using the paramaters listed above
# Only works with post 2023-Feb-02 ISO.
cal_path=/etc/calamares/modules
log_path=/home/liveuser

if [[ $1 == --iso-config ]]; then 
    echo "$(date): Stage 1. of the user_commands.bash script in-progress..." >> $log_path/log.txt
    if [[ ! $(grep '@snapshots' "$cal_path/mount.conf") ]]; then
            echo "$(date): @snapshots not found.  Modifying mount.conf..." >> $log_path/log.txt
            sudo sed -i '/subvolume: \/@log/a\\    - mountPoint: \/.snapshots\n\      subvolume: \/@snapshots' $cal_path/mount.conf 
            echo "Resulting subvolumes after modification:"            
            grep 'subvolume:' $cal_path/mount.conf | while read line
            do
                echo $line >> $log_path/log.txt
                if [[ $line == *"snapshots"* ]]; then sucess=true; fi
            done
            if [[ sucess != true ]]; then (echo "No @snapshots volume found after edit.  Please manually check mount.conf" >> $log_path/log.txt) && exit 1; fi
    fi
fi 


