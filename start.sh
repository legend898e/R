#!/bin/bash

echo "Starting tmate SSH session..."

# Create a new tmate session
tmate -S /tmp/tmate.sock new-session -d

# Wait for session to become ready
tmate -S /tmp/tmate.sock wait tmate-ready

# Print SSH and Web URLs to logs
echo "-----------------------------------------"
echo " SSH Access URL:"
tmate -S /tmp/tmate.sock display -p '#{tmate_ssh}'
echo
echo " Web Access URL:"
tmate -S /tmp/tmate.sock display -p '#{tmate_web}'
echo "-----------------------------------------"

# Keep container alive
tail -f /dev/null
