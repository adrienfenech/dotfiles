# Set French keymap
setxkbmap us &

# export GTK_IM_MODULE_FILE=/etc/gtk-2.0/gtk.immodules
# ibus-daemon --xim -d

# Beep off
xset -b

# Launches randow wallpaper script
~/script/randomWallpaper.sh &

# Starts DBus
source /etc/X11/xinit/xinitrc.d/30-dbus &

# Loads Xresources
xrdb -load .config/Xresources

# Starts i3
exec i3
