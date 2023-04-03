#!/bin/sh

ACCESS_TOKEN=#YOUR_TOKEN
DOMAIN=getln.net


# Fetch subdomain records for getln.net DOMAIN
response=$(curl \
  --silent \
  -X GET \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer $ACCESS_TOKEN" \
  "https://api.digitalocean.com/v2/domains/$DOMAIN/records?sub.getln.net")

echo $response | jq .
