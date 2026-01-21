#!/bin/bash
# Put your roll number and password in the config section below and rename as iiitkwifi.sh
# ================== CONFIG ==================
URL="http://172.16.222.1:1000/"
ROLL_NUMBER="Roll no here"
PASSWORD="Password here"   # <<< SET PASSWORD HERE
TIMEOUT_DURATION=2
REQUEST_FREQUENCY=10

EXPECTED_HTML_REGEX='window\.location="http://172\.16\.222\.1:1000/fgtauth\?([0-9a-fA-F]+)"'

# ================== FUNCTIONS ==================
make_request() {
    local KEY="$1"

    # Initial GET request
    curl -s "${URL}fgtauth?${KEY}" > /dev/null

    # POST login request
    RESPONSE_CODE=$(curl -s -w "%{http_code}" -o /tmp/login_response.html \
        -X POST "$URL" \
        -d ""="" \
        -d "4Tredir=https://google.com" \
        -d "magic=${KEY}" \
        -d "username=${ROLL_NUMBER}" \
        -d "password=${PASSWORD}")

    if [[ "$RESPONSE_CODE" == "200" ]]; then
        echo "Logged in successfully! $(date)"
    else
        echo "Login failed (HTTP $RESPONSE_CODE)"
    fi
}

# ================== MAIN LOOP ==================
while true; do
    RESPONSE=$(curl -s --max-time "$TIMEOUT_DURATION" http://google.com/)

    if [[ $? -ne 0 ]]; then
        echo "Network request error"
    else
        if echo "$RESPONSE" | grep -qE "$EXPECTED_HTML_REGEX"; then
            HEX_CODE=$(echo "$RESPONSE" | sed -nE "s|.*$EXPECTED_HTML_REGEX.*|\1|p")

            if [[ -n "$HEX_CODE" ]]; then
                echo "Logged out. Re-authenticating with token: $HEX_CODE"
                make_request "$HEX_CODE"
            else
                echo "Auth token not found"
            fi
        fi
    fi

    sleep "$REQUEST_FREQUENCY"
done
