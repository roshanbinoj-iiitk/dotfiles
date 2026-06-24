#!/bin/bash

THRESHOLD=20
CHECK_INTERVAL=30 # seconds

BATTERY_PATH=$(ls -d /sys/class/power_supply/BAT* | head -n1)

while true; do
    BATTERY_LEVEL=$(cat "$BATTERY_PATH/capacity")
    BATTERY_STATUS=$(cat "$BATTERY_PATH/status")

    if [ "$BATTERY_STATUS" = "Discharging" ] && [ "$BATTERY_LEVEL" -le "$THRESHOLD" ]; then
        logger "Battery ${BATTERY_LEVEL}% and discharging. Shutting down."
        shutdown -h now
        exit 0
    fi

    sleep "$CHECK_INTERVAL"
done