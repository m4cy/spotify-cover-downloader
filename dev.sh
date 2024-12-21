#!/bin/bash

TOKEN=`curl -X POST "https://accounts.spotify.com/api/token" \
     -H "Content-Type: application/x-www-form-urlencoded" \
     -d "grant_type=client_credentials&client_id=$CLIENT_ID&client_secret=$CLIENT_SECRET" | jq -r '.access_token'`

mkdir covers

ITEMS=`curl --request GET \
  --url https://api.spotify.com/v1/playlists/4VkUgiKioP7uJFOUj7ixiR/tracks \
  --header "Authorization: Bearer ${TOKEN}" | jq '[.items[].track.album.images[0].url]'`

INDEX=0

echo "$ITEMS" | jq -r '.[]' | while read -r song; do curl $song -o covers/$INDEX.png; ((INDEX++)); done