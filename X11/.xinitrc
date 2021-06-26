xrdb -merge ~/.config/X11/.Xresources 
urxvtd -o -q -f
#setxkbmap -option 'caps:ctrl_modifier';xcape -e 'Caps_Lock=Escape'&
setxkbmap -option 'ctrl:swapcaps';xcape -e 'Caps_Lock=Escape'&
exec i3

