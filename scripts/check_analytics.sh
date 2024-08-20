#!/bin/bash

# Ensure the URL environment variable is set
if [ -z "$WEBHOOK_URL" ]; then
  echo "Error: WEBHOOK_URL environment variable is not set."
  exit 1
fi

# Fetch data from the provided URL
RESPONSE=$(curl -s "$WEBHOOK_URL")

# Check if the response is empty
if [ -z "$RESPONSE" ] || [ "$RESPONSE" = "[]" ]; then
  echo "Error: No data received or data is empty."
  exit 1
fi

# Check for specific events in the response
if echo "$RESPONSE" | grep -q "Application Opened" && \
   echo "$RESPONSE" | grep -q "identify" && \
   echo "$RESPONSE" | grep -q "login"; then
  echo "Success: Required events found in the response."
  exit 0
else
  echo "Error: Required events not found in the response."
  exit 1
fi
