#!/usr/bin/osascript

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Tunnelblick: TrocaVPN
# @raycast.mode silent
# @raycast.packageName TunnelBlick Trocafone
#
# Optional parameters:
# @raycast.icon images/tunnelblick.png
# @raycast.needsConfirmation false
#
# Documentation:
# @raycast.description Connect a VPN configuration.
# @raycast.author Achille Lacoin
# @raycast.authorURL https://github.com/pomdtr

on run
	tell application "Tunnelblick" to connect "client"
	return # Discard Output
end run
