#!/usr/bin/env bash
# build-all.sh ── One-shot dependency installer & builder for Havoc teamserver + client
# Works on: Ubuntu 20.04/22.04, Kali, Debian 10/11, and Arch-based distros.
# Run as root or with sudo.

set -euo pipefail

#── Utility ────────────────────────────────────────────────────────────────
die() { echo "[-] $*" >&2; exit 1; }

need_root() {
  [[ $EUID -eq 0 ]] || die "Please run with sudo or as root."
}

have_cmd() { command -v "$1" &>/dev/null; }

#── Distro detection ───────────────────────────────────────────────────────
detect_distro() {
  [[ -f /etc/os-release ]] || die "Cannot detect OS (missing /etc/os-release)."
  . /etc/os-release
  case "$ID" in
    ubuntu|debian|kali)   echo "debian"  ;;
    arch|manjaro|endeavouros) echo "arch" ;;
    *) die "Unsupported distribution: $ID" ;;
  esac
}

#── Installers ─────────────────────────────────────────────────────────────
install_debian_family() {
  echo "[*] Installing dependencies for Debian/Ubuntu/Kali…"
  apt update

  # ── Ensure Python 3.10 availability ──
  if [[ $ID == "ubuntu" ]]; then
    add-apt-repository -y ppa:deadsnakes/ppa
  elif [[ $ID == "debian" ]]; then
    # Add bookworm repo for Python 3.10 on Debian 10/11
    grep -q '^deb .*bookworm' /etc/apt/sources.list || \
      echo 'deb http://ftp.de.debian.org/debian bookworm main' >> /etc/apt/sources.list
  fi
  apt update

  # Core build tools + libraries
  DEBIAN_FRONTEND=noninteractive \
  apt install -y --no-install-recommends \
      git build-essential apt-utils cmake \
      libfontconfig1 libglu1-mesa-dev libgtest-dev libspdlog-dev \
      libboost-all-dev libncurses5-dev libgdbm-dev libssl-dev \
      libreadline-dev libffi-dev libsqlite3-dev libbz2-dev \
      mesa-common-dev qtbase5-dev qtchooser qt5-qmake qtbase5-dev-tools \
      libqt5websockets5 libqt5websockets5-dev qtdeclarative5-dev \
      golang-go python3.10 python3.10-dev python3-dev \
      mingw-w64 nasm

  echo "[+] Debian-family dependencies installed."
}

install_arch_family() {
  echo "[*] Installing dependencies for Arch/Manjaro…"
  pacman -Sy --needed --noconfirm \
      git gcc base-devel cmake make fontconfig glu gtest spdlog \
      boost boost-libs ncurses gdbm openssl readline libffi sqlite \
      bzip2 mesa qt5-base qt5-websockets python python-pip nasm \
      mingw-w64-gcc go

  echo "[+] Arch-family dependencies installed."
}

#── Build steps ────────────────────────────────────────────────────────────
build_havoc() {
  local ROOT_DIR
  ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
  cd "$ROOT_DIR"

  echo "[*] Fetching Go modules for teamserver…"
  pushd teamserver >/dev/null
    go mod download golang.org/x/sys
    go mod download github.com/ugorji/go
  popd >/dev/null

  echo "[*] Building teamserver (musl static)…"
  make ts-build

  echo "[*] Building client…"
  make client-build

  echo "[✓] Build completed successfully!"
  echo
  echo "┌────────────────────────────────────────────────────────┐"
  echo "│  To start the teamserver:                              │"
  echo "│    ./havoc server --profile ./profiles/havoc.yaotl -v --debug │"
  echo "└────────────────────────────────────────────────────────┘"
}

#── Main ──────────────────────────────────────────────────────────────────
need_root
case "$(detect_distro)" in
  debian) install_debian_family ;;
  arch)   install_arch_family   ;;
esac

# Verify Go ≥ 1.18
if have_cmd go; then
  GOVERSION=$(go version | awk '{print $3}' | sed 's/go//')
  if [[ $(printf '%s\n1.18\n'"$GOVERSION" | sort -V | head -n1) != "1.18" ]]; then
    echo "[!] Go $GOVERSION detected; Havoc requires ≥ 1.18. Consider upgrading."
  fi
else
  die "Go not found after installation."
fi

build_havoc
