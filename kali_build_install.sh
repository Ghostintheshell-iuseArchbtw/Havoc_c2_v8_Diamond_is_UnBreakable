#!/bin/bash

set -e

echo "[*] Updating package lists..."
sudo apt update

echo "[*] Installing build dependencies..."
sudo apt install -y \
  build-essential \
  apt-utils \
  mingw-w64 \
  python3 \
  python3-pip \
  python3-dev \
  qtbase5-dev \
  qtchooser \
  qt5-qmake \
  qtbase5-dev-tools \
  git \
  cmake \
  pkg-config \
  libssl-dev \
  libz-dev \
  libfontconfig1 \
  libglu1-mesa-dev \
  libgtest-dev \
  libspdlog-dev \
  libboost-all-dev \
  libncurses5-dev \
  libgdbm-dev \
  libreadline-dev \
  libffi-dev \
  libsqlite3-dev \
  libbz2-dev \
  mesa-common-dev \
  libqt5websockets5 \
  libqt5websockets5-dev \
  qtdeclarative5-dev \
  golang-go \
  nasm

echo "[*] (Optional) Installing Python 3.10 if needed..."
sudo apt install -y python3.10 python3.10-venv python3.10-dev || true

echo "[*] Cloning your fork (if not already cloned)..."
if [ ! -d "Patched_Fork_Of_Havoc_C2" ]; then
  git clone https://github.com/Ghostintheshell-iuseArchbtw/Patched_Fork_Of_Havoc_C2.git
  cd Patched_Fork_Of_Havoc_C2
else
  cd Patched_Fork_Of_Havoc_C2
  echo "[*] Repository already exists. Pulling the latest changes..."
  git pull
fi

echo "[*] Initializing submodules..."
git submodule update --init --recursive

echo "[*] Building Havoc..."
make

echo "[*] Cleaning up unnecessary packages..."
sudo apt autoremove -y
sudo apt clean

echo "[*] Done! If you see no errors, Havoc is ready to use on Kali."
