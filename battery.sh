#!/bin/bash
battery_info=$(acpi -b)
battery_status=$(echo $battery_info | grep -Po '([A-Z]*),')
battery_percentage=$(echo $battery_info | grep -Po '[0-9]+(?=%)')

echo "Battery Status: $battery_status $battery_percentage%"
