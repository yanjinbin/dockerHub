#!/bin/bash

# Get macOS version
macos_version=$(sw_vers -productVersion)

# Clone the LuaJIT repository
git clone https://luajit.org/git/luajit.git

# Navigate to the cloned directory
cd luajit || exit

# Build and install LuaJIT
make && make install

# Build and install LuaJIT with custom macOS version
MACOSX_DEPLOYMENT_TARGET=$macos_version make && make install
