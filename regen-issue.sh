#!/bin/sh -e
#
# Use with motdstat and crontab to generate the colored RPi logo
# # Message Of The Day - System Status && Regenerate /etc/issue
# */2 *   * * *   root    /usr/bin/motdstat --generate && /etc/issue-regen.sh


cat /etc/issue_rpi-logo > /etc/issue
cat /etc/motd >> /etc/issue
echo "My IP addresses are:" >> /etc/issue
/sbin/ifconfig | /usr/bin/awk '/eth/ || /wlan/ {getline; print $2}' | /usr/bin/cut -d: -f2 >> /etc/issue
echo >> /etc/issue

exit 0
