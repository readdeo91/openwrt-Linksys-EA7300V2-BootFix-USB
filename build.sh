#!/bin/bash

make clean
./scripts/feeds update -a
./scripts/feeds install -a
make menuconfig

read -p "Configuration complete. Do you want to start the build now? (y/N) " response

if [[ "$response" =~ ^[Yy]$ ]]; then
    echo "Starting build..."
    make -j$(nproc)
else
    echo "Build aborted."
fi
