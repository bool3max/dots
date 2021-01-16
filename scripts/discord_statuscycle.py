#!/usr/bin/python3

import itertools
import requests as req
from time import sleep

# TODO: get data from CLI args, including the token and the actual status and emojis

ACC_TOKEN = "TOKEN_HERE"
STATUS_URL = "https://discordapp.com/api/v6/users/@me/settings"  

DELAY_SEC = 1

DATA = [(None, '👍🏿'), (None, '✌🏿'), (None, '👎🏿')]

req_headers = {
    "authorization": ACC_TOKEN,
    "Content-Type": "application/json"
}

once = False

for combo in itertools.cycle(DATA):
    result = req.patch(STATUS_URL, headers=req_headers, json={
        "custom_status": {
            "text": combo[0] or "",
            "emoji_name": combo[1] or ""
        }
    })

    if not once:
        print(result.request.headers)
        once = True

    sleep(DELAY_SEC)
