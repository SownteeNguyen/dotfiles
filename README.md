<div align="center">
    <h1>Arch Linux - Catppuccin Mocha Mauve</h1>
    <h1>by Nguyen Thanh Son | @SownteeNguyen</h1>
</div>

<div align="center">

![](https://img.shields.io/github/last-commit/SownteeNguyen/dotfiles?&style=for-the-badge&color=C9CBFF&logoColor=D9E0EE&labelColor=302D41)
![](https://img.shields.io/github/stars/SownteeNguyen/dotfiles?style=for-the-badge&logo=starship&color=8bd5ca&logoColor=D9E0EE&labelColor=302D41)
[![](https://img.shields.io/github/repo-size/SownteeNguyen/dotfiles?color=%23DDB6F2&label=SIZE&logo=codesandbox&style=for-the-badge&logoColor=D9E0EE&labelColor=302D41)](https://github.com/SownteeNguyen/dotfiles)
<a href="https://github.com/SownteeNguyen/dotfiles/issues">
<img alt="Issues" src="https://img.shields.io/github/issues/SownteeNguyen/dotfiles?style=for-the-badge&logo=bilibili&color=F5E0DC&logoColor=D9E0EE&labelColor=302D41" />
</a>

</div>

## More Screenshots

<img src="Screenshots/workspace1.png">

### Details

 <img alt="Sowntee" height="300px" Width="300px" src="neofetch/ascii/cat.png" align="right">

- **Window Manager**: I3
- **Window Manager Theme**: Catppuccin Mocha Mauve
- **OS**: Arch Linux
- **Terminal**: Kitty
- **Shell**: Zsh
- **Run Launcher**: Rofi
- **Audio Visualizer**: Cava
- **Notifications**: Dunst
- **System Monitor**: GTK 3
- **Editor**: Neovim

## Setup 🔧:

<details><summary>Package and Applications</summary><blockquote>

#### Font

    yay -S ttf-iosevka-nerd ttf-font-awesome ttf-jetbrains-mono-nerd nerd-fonts-sf-mono noto-fonts noto-fonts-cjk

#### Apps for Code

- Visual Studio Code
- Intelij IDea Ultimate Edition
- Webstorm
- NeoVim
  ```
  yay -S visual-studio-code-bin intellij-idea-ultimate-edition webstorm neovim
  ```

#### Other Apps

- Telegram
- Discord (BetterDiscord)
- Thunar
- OBS
- VLC
  ```
  sudo pacman -S discord vlc thunar obs-studio telegram-desktop
  ```
- Spotify (Spicetify)
- Chrome
- EDGE
  ```
  yay -S google-chrome microsoft-edge-stable-bin spotify
  ```

#### Library Support

    sudo pacman -S nodejs npm yarn python python-pip clang jdk-openjdk

#### Network

    sudo pacman -S netctl networkmanager network-manager-applet ifplugd dhcpcd dialog wpa_suppllicant wireless_tools

#### Audio

    sudo pacman -S pavucontrol pipewire pipewire-alsa pipewire-audio pulseaudio pulseaudio-bluetooth playerctl

    systemctl --user enable pipewire pipewire-pulse && systemctl --user start pipewire pipewire-pulse

#### Power

    sudo pacman -S acpi

#### Bluetooth

    sudo pacman -S bluez bluez-utils bluez-tools bluez-libs blueman

    sudo systemctl enable bluetooth.service

    power on > agent on > default-agent > scan on

    sudo echo AutoEnable = True >> /etc/bluetooth/main.conf

#### Brightness

    sudo pacman -S brightnessctl xorg-xbacklight

#### File Manager

    sudo pacman -S ranger ueberzug exa hightlight unzip

#### Monitor and Theme

    sudo pacman -S feh flameshot lxappearance catppuccin-gtk-theme-mocha catppuccin-cursors-mocha papirus-icon-theme papirus-folders-catppuccin-git neofetch rxfetch nitch imagemagick

#### Other

    sudo pacman -S gnome-keyring libsecret libgnome-keyring seahorse xf86-input-libinput pacman-contrib lightdm btop fontconfig ibus

    sudo systemctl enable lightdm

    lightdm --test-mode --debug

    source /etc/X11/xinit/xinitrc.d/50-systemd-user.sh
    eval $(/usr/bin/gnome-keyring-daemon --start)
    export SSH_AUTH_SOCK
    mkdir -p "$HOME"/.local/share/keyrings

    sudo nvim /etc/X11/xorg.conf.d/30-touchpad.conf
    Section "InputClass"
        Identifier "touchpad"
        Driver "libinput"
        MatchIsTouchpad "on"
        Option "Tapping" "on"
        Option "TappingButtonMap" "lrm"
        Option "NaturalScrolling" "true"
    EndSection

</blockquote></details>

## NeoVim

### Screenshoot

<img src="Screenshots/neovim1.png">
<img src="Screenshots/neovim2.png">
<img src="Screenshots/neovim3.png">
<img src="Screenshots/neovim4.png">

<details><summary>NeoVim</summary><blockquote>
- You probably notice you don't have support for copy and paste also that python and node haven't been setup
  
  - If you on X11 install xsel and xclip
    
    ```
    sudo pacman -S xsel xclip
    ```

- Next we need to install python support (Node is optional)
  - Neovim python support:
  ```
  pip install pynvim
  ```
  - Neovim Node support
  ```
  npm i -g neovim
  ```
- Other dependencies for formatting & finding text :

  - Prettier

  ```bash
  npm install -g prettier
  ```

  - Ripgrep Fzf Lazygit

  ```
  sudo pacman -S ripgrep fzf lazygit
  ```

</details>
</blockquote></details>

<details><summary>How to install Arch Linux</summary><blockquote>

### Make you have Internet

    iwctl

### Time sync and set keyboard

    ls /i386/qwerty/us.map.gz

    timedatectl set-ntp true

    timedatectl set-timezone Asia/Ho_Chi_Minh

### Reflector and Keyring

    pacman -Sy reflector archlinux-keyring

    reflector -c Vietnam -c Singapore -c Japan -c India -a 12 --sort rate --save /etc/pacman.d/mirrorlist

### Disk

    cfdisk /dev/sda

    mkswap /dev/sda2
    swapon /dev/sda2

    mkfs.ext4 /dev/sda3

    mount /dev/sda3 /mnt

    mkdir /mnt/efi
    mount /dev/sda1 /mnt/efi

### Install basic package

    pacstrap /mnt base base-devel linux linux-firmware linux-headers neovim

### Switch to /mnt

    genfstab -U /mnt >> /mnt/etc/fstab

    arch-chroot /mnt

### Set time and Languaue

    ln -sf /usr/share/zoneinfo/Asia/Ho_Chi_Minh /etc/localtime

    hwclock --systohc

    vim /etc/locale.gen

    Uncomment: en_US.UTF-8 UTF-8

    locale-gen

    echo LANG=en_US.UTF-8 > /etc/locale.conf

    export LANG=en_US.UTF-8

### Set hostname

    echo arch > /etc/hostname

    nvim /etc/hosts

    127.0.0.1[TAB]localhost
    ::1[TAB][TAB]localhost
    127.0.1.1[TAB]arch.localdomain[TAB]arch

### User add or password

    passwd

    useradd -m sowntee

    passwd sowntee

    usermod -aG wheel,audio,video,optical,storage,power sowntee

    EDITOR=vim visudo

    Add: sowntee ALL=(ALL) ALL
    sowntee ALL=(ALL:ALL) NOPASSWD: /usr/bin/systemctl reboot, /usr/bin/systemctl poweroff
    Uncomment: %wheel ALL=(ALL) ALL

### Grub and OsProber

    pacman -S grub osprober

    grub-install --target=x86_64-efi --efi-directory=/efi --bootloader-id=GRUB

    grub-mkconfig -o /boot/grub/grub.cfg

### Exit and Reboot

    exit

    reboot

</blockquote></details>
