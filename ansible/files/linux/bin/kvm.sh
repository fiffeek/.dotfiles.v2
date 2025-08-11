#!/bin/bash
# Name: kvm.sh
# Purpose : Control remote server/laptop/desktop using KVM and VNC client
# Author: nixCraft {https://www.cyberciti.biz/} under GPL v3.x
# ----------------------------------------------------------------------
# Adjusted from the above
# * ref: https://www.cyberciti.biz/faq/remotely-access-intel-amt-kvm-linux-desktop/

set -ex

xIP="$1"
xUSER='admin'
xPASSWORD="$2"
xVNC_PWD="$(openssl rand -hex 3)A@"
xVNC_PORT='5900'

wsman put http://intel.com/wbem/wscim/1/ips-schema/1/IPS_KVMRedirectionSettingData -h $xIP -P 16992 -u admin -p "${xPASSWORD}" -k RFBPassword="${xVNC_PWD}"
wsman put http://intel.com/wbem/wscim/1/ips-schema/1/IPS_KVMRedirectionSettingData -h $xIP -P 16992 -u admin -p "${xPASSWORD}" -k Is5900PortEnabled=true
wsman put http://intel.com/wbem/wscim/1/ips-schema/1/IPS_KVMRedirectionSettingData -h $xIP -P 16992 -u admin -p "${xPASSWORD}" -k OptInPolicy=false
wsman put http://intel.com/wbem/wscim/1/ips-schema/1/IPS_KVMRedirectionSettingData -h $xIP -P 16992 -u admin -p "${xPASSWORD}" -k SessionTimeout=0
wsman invoke -a RequestStateChange http://schemas.dmtf.org/wbem/wscim/1/cim-schema/2/CIM_KVMRedirectionSAP -h "${xIP}" -P 16992 -u "${xUSER}" -p "${xPASSWORD}" -k RequestedState=2

echo "Open Linux vnc client. Use \"$xIP:$xVNC_PORT\" as host and when promoted enter \"$xVNC_PWD\" as password"
