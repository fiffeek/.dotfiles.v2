#!/bin/bash

WIREGUARD_CONN_NAME=${1:-homelab}
VPN_GET_STATUS=$(nmcli -f STATE,TYPE,NAME conn show | grep "$WIREGUARD_CONN_NAME")
VPN_STATUS=$(echo "$VPN_GET_STATUS" | awk '/wireguard/ { print $1 }')

if [ "$VPN_STATUS" != "activated" ]; then
  VPN_STATUS="deactivated"
fi

echo "{\"text\": \"$VPN_STATUS\", \"class\": \"$VPN_STATUS\"}"
