#!/usr/bin/fish

firefox --new-tab "https://last.fm/music/"(playerctl -p spotify metadata artist)"/_/"(playerctl -p spotify metadata title)
