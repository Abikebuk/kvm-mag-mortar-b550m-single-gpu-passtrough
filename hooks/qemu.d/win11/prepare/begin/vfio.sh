#!/bin/bash
# Helpful to read output when debugging
set -x

# Stop display manager
systemctl stop display-manager.service
killall -9 latte-dock

# Just in case
while systemctl -q is-active "user@$sddm_uid.service"; do
    sleep 1
done

# Unbind EFI-Framebuffer not needed beacause of video=efifb:off kernel arg
echo efi-framebuffer.0 > /sys/bus/platform/drivers/efi-framebuffer/unbind

# Performance mode
cpupower frequency-set -g performance
