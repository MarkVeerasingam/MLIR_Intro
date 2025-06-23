#!/bin/bash
set -euo pipefail

BUILD_DIR="build"

if [ -d "$BUILD_DIR" ]; then
  echo "Cleaning up build directory."
  rm -rf "$BUILD_DIR"
else
  echo "$BUILD_DIR directory does not exist."
fi
