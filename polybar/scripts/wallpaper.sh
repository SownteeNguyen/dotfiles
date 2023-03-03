#!/bin/bash

wallpaper_dir=~/.config/wallpapers

files=($wallpaper_dir/*)

selected_wallpaper=$(printf "%s\n" "${files[@]}" | awk -F/ '{print $NF}' | rofi -dmenu -drun -theme "$HOME/.config/rofi/theme/wallpaper.rasi")

feh --bg-fill "$wallpaper_dir/$selected_wallpaper"
