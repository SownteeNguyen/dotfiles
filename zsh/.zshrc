[ -f "$HOME/.cargo/env" ] && source "$HOME/.cargo/env"

while read file
do 
  source "/home/sowntee/.config/zsh/$file.zsh"
done <<-EOF
theme
alias
opts
plugs
prompt
EOF

for fun in ${(ok)functions[(I)[_][_][_][_][_]*]}; do 
  eval "alias ${${fun:5}//_/-}=\"${fun}\""
done

greet="xbl"
greet_path="$HOME/.bin/eyecandy/$greet"
[ -f "$greet_path" ] && eval "$greet_path" ||default_greeter
unset greet_path greet

rxfetch

export GTK_IM_MODULE=ibus: warning
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus
ibus-daemon -drx

export PATH=$PATH:/home/sowntee/.spicetify

# vim:ft=zsh:nowrap
