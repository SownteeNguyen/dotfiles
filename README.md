# For Arch Linux - I3 - Catppuccin Mocha

## Screenshots

<img src="Screenshots/2023-01-04_01-24.png">
<img src="Screenshots/2023-01-04_01-27.png">
<img src="Screenshots/2023-01-04_01-27_1.png">

## Details

- **Window Manager**: I3
- **Window Manager Theme**: Catppuccin Mocha
- **OS**: Arch Linux
- **Terminal**: Kitty
- **Shell**: Zsh
- **Run Launcher**: Rofi
- **Audio Visualizer**: Cava
- **Notifications**: Dunst
- **System Monitor**: GTK 3
- **Editor**: Neovim

* Font : ttf-iosevka-nerd, ttf-font-awesome, nerd-fonts-complete, nerd-fonts-jetbrains-mono, ttf-jetbrains-mono, nerd-fonts-sf-mono
* Apps for Code : Visual Studio Code, Intelij Ultimate, Webstorm, NeoVim (NeoVide), Kitty, Zsh
* Other Apps : Telegram, Spotify (Spicetify), Discord (BetterDiscord), Chrome, Thunar, OBS, VLC, Picom, Ibus-bamboo, Dunst
* Other package : Btop, Nodejs (npm), Python (pip), Clang, Jdk-openjdk, Unzip, Feh, Rofi, Flameshot, Pavucontrol (Pipewire, Pipewire-pulse, Pipewire-alsa), Ripgrep, Lazygit, Fzf, Polybar, Lxappearance, Brightnessctl, Bluez, Bluez-utils, Github-cli, Catppuccin-gtk-theme-mocha, papirus-icon-theme, Neofetch, Eww, gnome-keyring libsecret libgnome-keyring, xf86-input-libinput,seahorse, exa, pacman-contrib, ncpi, xorg-xbacklight

Other Command :

- sudo systemctl enable lightdm
- lightdm --test-mode --debug

- sudo systemctl enable bluetooth.service
  sudo nvim /etc/bluetooth/main.conf
  #ADD
  AutoEnable=True
- systemctl --user enable pipewire pipewire-pulse
  systemctl --user start pipewire pipewire-pulse

- yay -S betterdiscord-installer
  betterdiscord-installer

- (\_commit=gc5f8b819)
  \_commit=gc5f8b819-2

(shasum512 line 36)
9ba6c2d155f683b9a38222d58a2a53a2a5f4b422ed1c0d603af87919ba8a68309aea3354278fd1d5d8142a1568d93b7e83b14c041e749b0c39f3bc155a633ef8

makepkg -si
cd ..
rm -fr spotify
curl -fsSL https://raw.githubusercontent.com/spicetify/spicetify-cli/master/install.sh | sh\ncurl -fsSL https://raw.githubusercontent.com/spicetify/spicetify-marketplace/main/resources/install.sh | sh
spicetify backup apply

# see https://unix.stackexchange.com/a/295652/332452

source /etc/X11/xinit/xinitrc.d/50-systemd-user.sh

# see https://wiki.archlinux.org/title/GNOME/Keyring#xinitrc

eval $(/usr/bin/gnome-keyring-daemon --start)
export SSH_AUTH_SOCK

# see https://github.com/NixOS/nixpkgs/issues/14966#issuecomment-520083836

mkdir -p "$HOME"/.local/share/keyrings

sowntee ALL=(ALL:ALL) NOPASSWD: /usr/bin/systemctl reboot, /usr/bin/systemctl poweroff
