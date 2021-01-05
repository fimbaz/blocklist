#!/bin/bash
rm blocklist;
while read URL; do
curl -s -L "$URL" | gunzip -c >> blocklist
done < blocklisturls

