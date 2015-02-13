#!/usr/bin/env bash

### INPUT ###
echo "Enter month of birthday: "
read MONTH
echo "Enter day of birthday: "
read DAY
echo "Enter name to say: "
read NAME

### MAKE PATHS & CREATE OR CLEAR FILES ###
FILEPATH="$( cd ~/Library/LaunchAgents/ && pwd )"
PLISTNAME="/com.bhekman.happybirthday.plist"
PLIST=$FILEPATH$PLISTNAME
touch $PLIST
> $PLIST
SCRIPTNAME="/happybirthday.sh"
SCRIPT=$FILEPATH$SCRIPTNAME
touch $SCRIPT
> $SCRIPT
LABEL="com.bhekman.happybirthday"

### CREATE PLIST ###
echo '<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
  <key>Label</key>
  <string>com.bhekman.happybirthday</string>
  <key>Program</key>
  <string>' >> $PLIST

echo "$SCRIPT" >> $PLIST

echo '</string>
  <key>StartCalendarInterval</key>
  <dict>
    <key>Month</key>
    <integer>' >> $PLIST

echo "$MONTH" >> $PLIST

echo '</integer>
    <key>Day</key>
    <integer>' >> $PLIST

echo "$DAY" >> $PLIST

echo '</integer>
    <key>Minute</key>
    <integer>0</integer>
  </dict></integer>
  <key>KeepAlive</key>
  <dict>
    <key>SuccessfulExit</key>
    <false/>
  </dict></key>
</dict>
</plist>' >> $PLIST

### CREATE SCRIPT ###
echo "#!/usr/bin/env bash" >> $SCRIPT
echo "osascript -e 'set Volume 10'" >> $SCRIPT
echo "say -v 'Good News' 'happy birthday, $NAME'" >> $SCRIPT

### LOAD IT UP ###
launchctl load $PLIST
launchctl start $LABEL
