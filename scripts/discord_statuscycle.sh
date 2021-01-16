#!/usr/bin/fish

set -g words $argv
set -g words_i 1
set -g emojis 👎🏿 👍🏿
set -g emojis_i 1

set TOKEN "TOKEN_HERE"

while true
    curl -X PATCH "https://discordapp.com/api/v6/users/@me/settings" -H "authorization: $TOKEN" -H "Content-Type: application/json" --data "{\"custom_status\":{\"text\":\"$words[$words_i]\", \"emoji_name\": \"$emojis[$emojis_i]\"}}"

    set -g words_i (math $words_i + 1)
    test $words_i -gt (count $words) && set -g words_i 1

    set -g emojis_i (math $emojis_i + 1)
    test $emojis_i -gt (count $emojis) && set -g emojis_i 1
    sleep 1
end
