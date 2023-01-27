chosen=$(printf "  Power Off\n  Restart\n  Lock\n  Sleep" | rofi -dmenu -drun -theme "$HOME/.config/rofi/theme/catppuccin-mocha.rasi")

case "$chosen" in
	"  Power Off") kitty systemctl poweroff ;;
	"  Restart") kitty systemctl reboot ;;
	"  Lock") ;;
	"  Sleep") kitty systemctl suspend ;;
	*) exit 1 ;;
esac
