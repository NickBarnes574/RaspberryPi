#!/bin/bash

# This script is used for building the project, with options for debug, testing, and cleaning.

# Initialize flags
DEBUG=0
CLEAN=0

# Function to display the usage of the script
usage() {
  echo "USAGE: $0 [ debug | test | clean ]"
  exit 1
}

# Function to clean build directories
clean() {
  rm -rf build bin
}

# Parse command line arguments
if [ $# -eq 1 ]; then
  case $1 in
    debug)
      DEBUG=1
      ;;
    clean)
      clean
      exit 0
      ;;
    *)
      usage
      ;;
  esac
elif [ $# -gt 1 ]; then
  usage
fi

# Create build directory and navigate into it
mkdir -p build
cd build || exit 1 # Exit if cd fails

# Stop on error
set -e

cmake .. -DCMAKE_BUILD_TYPE=${1}

# Build the project
make -j$(nproc)

# Return to project root directory
cd .. || exit 1 # Exit if cd fails
