#!/bin/bash
set -x

# Not needed because not used in prepare  
echo "efi-framebuffer.0" > /sys/bus/platform/drivers/efi-framebuffer/bind

# Restart Display Manager
systemctl start display-manager.service

# Revert performance mode
cpupower frequency-set -g ondemand
