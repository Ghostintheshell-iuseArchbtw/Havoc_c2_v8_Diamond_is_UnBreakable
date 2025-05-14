#!/bin/bash

set -e

echo "[*] Updating package lists..."
sudo apt update

echo "[*] Installing build dependencies..."
sudo apt install -y \
  build-essential \
  mingw-w64 \
  python3 \
  python3-pip \
  qtbase5-dev \
  qtchooser \
  qt5-qmake \
  qtbase5-dev-tools \
  git \
  cmake \
  pkg-config \
  libssl-dev \
  libz-dev

echo "[*] (Optional) Installing Python 3.10 if needed..."
sudo apt install -y python3.10 python3.10-venv python3.10-dev || true

echo "[*] Cloning your fork (if not already cloned)..."
if [ ! -d "Patched_Fork_Of_Havoc_C2" ]; then
  git clone https://github.com/Ghostintheshell-iuseArchbtw/Patched_Fork_Of_Havoc_C2.git
  cd Patched_Fork_Of_Havoc_C2
else
  cd Patched_Fork_Of_Havoc_C2
fi

echo "[*] Initializing submodules..."
git submodule update --init --recursive

echo "[*] Building Havoc..."
make

echo "[*] Done! If you see no errors, Havoc is ready to use on Kali."
