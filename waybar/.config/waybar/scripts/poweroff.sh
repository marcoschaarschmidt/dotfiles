#!/bin/bash
case $(
  wofi -d -L 6 -l 3 -W 100 -x -100 -y 10 \
    -D dynamic_lines=true <<EOF | sed 's/^ *//'
    Shutdown
    Reboot
    Log off
    Sleep
    Lock
    Cancel
EOF
) in
"Shutdown")
  #systemctl poweroff
  sudo shutdown now
  ;;
"Reboot")
  #systemctl reboot
  sudo reboot now
  ;;
"Sleep")
  systemctl suspend
  ;;
"Lock")
  #loginctl lock-session
  hyprlock
  ;;
"Log off")
  swaymsg exit
  ;;
esac
