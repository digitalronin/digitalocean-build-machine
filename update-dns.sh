#!/bin/bash

HOST=buildvm
DOMAIN=spikesolution.com
IP=$(cat .ip)

curl "https://dynamicdns.park-your-domain.com/update?host=$HOST&domain=$DOMAIN&password=$NAMECHEAP_DDNS_PASSWORD&ip=$IP"
