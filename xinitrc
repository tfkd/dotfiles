. ~/.xprofile

if [ -f "$HOME/.Xresources" ]; then
	xrdb -load ~/.Xresources &
fi
if [ -f "$HOME/.Xmodmap" ]; then
	xmodmap ~/.Xmodmap
fi

exec i3
