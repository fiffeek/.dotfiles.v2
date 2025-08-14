#!/bin/zsh

set -ex

gpu_level() { echo "$1" | sudo tee /sys/class/drm/card1/device/power_dpm_force_performance_level; }

aspm_level() { echo "$1" | sudo tee /sys/module/pcie_aspm/parameters/policy; }

display_backlight_level() { brightnessctl -d amdgpu_bl1 set "$1"; }

set_epp() {
  echo "$1" | sudo tee /sys/devices/system/cpu/cpu*/cpufreq/energy_performance_preference
}

wifi_level() {
  NM_CONFIG="/etc/NetworkManager/conf.d/wifi-powersave.conf"
  if [ "$1" = "powersave" ]; then
    sudo sed -i 's/2/3/' "$NM_CONFIG"
  fi
  if [ "$1" = "performance" ]; then
    sudo sed -i 's/3/2/' "$NM_CONFIG"
  fi

  CURRENT_WIFI=$( nmcli -t -f NAME,TYPE connection show --active | grep "wireless" | cut -d: -f1)
  if [ -z "$CURRENT_WIFI" ]; then
    echo "No active Wi-Fi connection found. Restarting network manager."
    sudo systemctl restart NetworkManager
  else
    echo "Active Wi-Fi connection: $CURRENT_WIFI"
    if [ "$1" = "powersave" ]; then
      sudo nmcli connection modify "$CURRENT_WIFI" 802-11-wireless.powersave 3
    fi
    if [ "$1" = "performance" ]; then
      sudo nmcli connection modify "$CURRENT_WIFI" 802-11-wireless.powersave 2
    fi
    sudo nmcli connection down "$CURRENT_WIFI"
    sudo nmcli connection up "$CURRENT_WIFI"
  fi
}

set_flag() {
  FLAG_LOCATION="$HOME/.config/power/flags"
  FLAG_FILENAME="$1"
  mkdir -p "$FLAG_LOCATION"
  for file in "$FLAG_LOCATION"/*; do echo 0 >"$file"; done
  touch "$FLAG_LOCATION/$FLAG_FILENAME"
  echo 1 >"$FLAG_LOCATION/$FLAG_FILENAME"
}

performance() {
  sudo cpupower frequency-set -g performance
  sudo cpupower set --turbo-boost 1
  sudo powerprofilesctl set performance
  # epp driver only supports performance for now...
  # but seems ppd set it anyway?
  set_epp "performance"
  gpu_level "auto"
  wifi_level "performance"
  aspm_level "default"
  display_backlight_level "25%"
  set_flag "performance" || true
  notify-send 'Performance mode' || true
}

powersaver() {
  sudo cpupower frequency-set -g powersave
  sudo cpupower set --turbo-boost 1
  sudo powerprofilesctl set power-saver
  sudo cpupower set --turbo-boost 0
  set_epp "power"
  gpu_level "low"
  wifi_level "powersave"
  aspm_level "powersupersave"
  display_backlight_level "1%"
  set_flag "powersave" || true
  notify-send 'Powersaver mode' || true
}

(
  typeset fd=
  exec {fd}>/tmp/set-power-profile.lock
  flock -w 30 $fd || exit 1
  case "$1" in
    performance) performance ;;
    powersaver) powersaver ;;
    *) echo "Please enter an action" ;;
  esac
)
