#!/bin/sh

ACCESS_TOKEN=#YOUR_TOKEN
DOMAIN=getln.net
RECORD_IDS=#(RECORD_ID_1 RECORD_ID_2 RECORD_ID_n)


# Check public IP: Likely the routers IP
IP=$(curl -s http://checkip.amazonaws.com/)

# For the listed record IDs, update the IP pointed to by the record
for ID in "${RECORD_IDS[@]}"
do
  curl \
    -fs -o /dev/null \
    -X PUT \
    -H "Content-Type: application/json" \
    -H "Authorization: Bearer $ACCESS_TOKEN" \
    -d "{\"data\":\"$IP\"}" \
    "https://api.digitalocean.com/v2/domains/$DOMAIN/records/$ID"
done
