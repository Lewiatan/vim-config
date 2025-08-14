#!/bin/bash

# Angular Language Server Wrapper
# This script ensures TypeScript is properly found by the Angular language server

# Get global npm modules directory
GLOBAL_MODULES=$(npm root -g)

# Set NODE_PATH to include global modules
export NODE_PATH="$GLOBAL_MODULES:$NODE_PATH"

# Find TypeScript directory
TS_DIR="$GLOBAL_MODULES/typescript"

if [ -d "$TS_DIR" ]; then
    # Use TypeScript from global installation
    exec ngserver --stdio --tsProbeLocations "$TS_DIR" --ngProbeLocations "$TS_DIR" "$@"
else
    # Fallback without specific TypeScript path
    exec ngserver --stdio "$@"
fi
