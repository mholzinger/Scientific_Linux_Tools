#!/bin/bash

### Other noblank features
cat <<EOF >/etc/X11/xinit/xinitrc.d/noblank.sh
echo "Disable screen blanking for $TERM and $DISPLAY"
setterm -powersave off -blank 0
#xset -dpms
xset dpms 0 0 0
xset s noblank
xset s off
EOF

chmod 0755 /etc/X11/xinit/xinitrc.d/noblank.sh
