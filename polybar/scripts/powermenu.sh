chosen=$(printf "  Power Off\n  Restart\n  Lock\n  Sleep" | rofi -dmenu -drun -theme "$HOME/.config/rofi/theme/powermenu.rasi")

case "$chosen" in
	"  Power Off") systemctl poweroff ;;
	"  Restart") systemctl reboot ;;
	"  Lock") systemctl lock ;;
	"  Sleep") systemctl suspend ;;
	*) exit 1 ;;
esac
