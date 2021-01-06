#!/bin/bash
rm blocklist;
while read URL; do
curl -s -L "$URL" | gunzip -c >> blocklist
done < blocklisturls
ipset destroy blacklist
ipset create blacklist hash:net hashsize 131072
while read NET; do
    ipset -A blacklist $NET;
done < blocklist
iptables -A INPUT -m set --match-set blacklist src -j DROP
