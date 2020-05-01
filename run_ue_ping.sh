#!/bin/sh
sleep 5
ip route del default
srsue /config/uefake.conf --usim.imsi=901550000000011 --usim.k=8b369a37163d2ae11b0ad524fe3db063 --usim.algo=milenage --usim.opc=28b575aee0f3ec89f480238db0e3b0fc --nas.apn_protocol=ipv4 &
#let's wait till core network gives connectivity to UE
#tun_srsue is the device name of ue
UE_IFNAME="tun_srsue"
WAIT=1
[ "$WAIT" ] && {
  while true; do
    grep -q '^1$' "/sys/class/net/$UE_IFNAME/carrier" && break
    ip link ls dev "$UE_IFNAME" && break
    sleep 1
  done > /dev/null 2>&1
  WAIT=0
}
echo "pinging 10 times to the p-gw"
ping -c 10 45.45.0.1 
ip r a default dev tun_srsue
echo "pinging till I die to the internet"
ping  8.8.8.8
