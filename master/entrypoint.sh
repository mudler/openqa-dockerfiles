#!/bin/bash
export DBUS_STARTER_BUS_TYPE=system

# Dbus
dbus-daemon --print-address --system &

[ -n "$POSTGRESQL" ] && \
[ -e "/etc/openqa/database.ini.postgresql" ] && \
cp -rfv /etc/openqa/database.ini.postgresql /etc/openqa/database.ini && \
su - geekotest -c  "/usr/share/openqa/script/initdb --init_database"

# Components
su - geekotest -c  "/usr/share/openqa/script/openqa-resource-allocator" &
su - geekotest -c  "/usr/share/openqa/script/openqa-scheduler" &
su - geekotest -c  "/usr/share/openqa/script/openqa-websockets" &

# Webui
/usr/sbin/start_apache2 -DSYSTEMD -DFOREGROUND -k start &

su - geekotest -c  "/usr/share/openqa/script/openqa prefork -m production --proxy -i 100 -H 400 -w 20 -G 800" 

