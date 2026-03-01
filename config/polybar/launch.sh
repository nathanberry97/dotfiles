#!/usr/bin/env bash

# Kill existing Polybar instances
killall -q polybar

# Launch Polybar
polybar --reload main &
