#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title ETH Price
# @raycast.mode inline
# @raycast.refreshTime 1h
# @raycast.packageName Dashboard

# Documentation:
# @raycast.description Checking ETH coin price
# @raycast.author Julian Murphy
# @raycast.authorURL https://github.com/fkmurphy


price=$(curl -s https://api.coingecko.com/api/v3/coins/ethereum | python -c "import json, sys; print(json.load(sys.stdin)['market_data']['current_price']['usd'])")

echo "\$${price}"
