#!/bin/bash
service dbus start
bluetoothd --noplugin=input > /var/log/bluetoothd.log 2>&1 &

exec "$@"
