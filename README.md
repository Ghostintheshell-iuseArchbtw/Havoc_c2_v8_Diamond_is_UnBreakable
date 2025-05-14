# Patched Fork of Havoc C2

This is my personal patched fork of the [Havoc C2 framework](https://github.com/HavocFramework/Havoc).

## Features & Changes

- All original Havoc features
- Custom patches and bugfixes for:
  - Indirect syscalls
  - Sleep obfuscation (Ekko)
  - Stack duplication
  - Proxy loading (RtlRegisterWait)
  - AMSI/ETW patching (hardware breakpoints)
  - WoW64 and pointer/integer cast fixes
  - Build and compatibility improvements

## Why this fork?

This fork exists to:
- Apply custom patches and enhancements
- Fix build issues on modern toolchains
- Serve as a stable, personal base for further research

## Usage

See the original [Havoc README](https://github.com/HavocFramework/Havoc#readme) for usage instructions.  
All build and usage steps are the same unless otherwise noted.

---

## Kali Linux Installation

To install and build this fork on Kali Linux, use the following script:

```bash
sudo apt update
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

git clone https://github.com/Ghostintheshell-iuseArchbtw/Patched_Fork_Of_Havoc_C2.git
cd Patched_Fork_Of_Havoc_C2
git submodule update --init --recursive
make
```

If you need Python 3.10:
```bash
sudo apt install -y python3.10 python3.10-venv python3.10-dev
```
# Patched Fork of Havoc C2

This is my personal patched fork of the [Havoc C2 framework](https://github.com/HavocFramework/Havoc).

## Features & Changes

- All original Havoc features
- Custom patches and bugfixes for:
  - Indirect syscalls
  - Sleep obfuscation (Ekko)
  - Stack duplication
  - Proxy loading (RtlRegisterWait)
  - AMSI/ETW patching (hardware breakpoints)
  - WoW64 and pointer/integer cast fixes
  - Build and compatibility improvements

## Why this fork?

This fork exists to:
- Apply custom patches and enhancements
- Fix build issues on modern toolchains
- Serve as a stable, personal base for further research

## Usage

See the original [Havoc README](https://github.com/HavocFramework/Havoc#readme) for usage instructions.  
All build and usage steps are the same unless otherwise noted.

## Credits

- [Havoc Framework](https://github.com/HavocFramework/Havoc)
- All original authors and contributors

---

**This repository is for research and educational purposes only.**

<div align="center">
  <img width="125px" src="assets/Havoc.png" />
  <h1>Havoc</h1>
  <br/>

  <p><i>Havoc is a modern and malleable post-exploitation command and control framework, created by <a href="https://twitter.com/C5pider">@C5pider</a>.</i></p>
  <br />

  <img src="assets/Screenshots/FullSessionGraph.jpeg" width="90%" /><br />
  <img src="assets/Screenshots/MultiUserAgentControl.png" width="90%" /><br />
  
</div>

> :warning: Havoc is in an early state of release. Breaking changes may be made to APIs/core structures as the framework matures.

### Support

Consider supporting C5pider on [Patreon](https://www.patreon.com/5pider)/[Github Sponsors](https://github.com/sponsors/Cracked5pider). Additional features are planned for supporters in the future, such as custom agents/plugins/commands/etc.

### Quick Start

> Please see the [Wiki](https://github.com/HavocFramework/Havoc/wiki) for complete documentation.

Havoc works well on Debian 10/11, Ubuntu 20.04/22.04 and Kali Linux. It's recommended to use the latest versions possible to avoid issues. You'll need a modern version of Qt and Python 3.10.x to avoid build issues.

See the [Installation](https://havocframework.com/docs/installation) docs for instructions. If you run into issues, check the [Known Issues](https://github.com/HavocFramework/Havoc/wiki#known-issues) page as well as the open/closed [Issues](https://github.com/HavocFramework/Havoc/issues) list.

---

### Features

#### Client

> Cross-platform UI written in C++ and Qt

- Modern, dark theme based on [Dracula](https://draculatheme.com/)


#### Teamserver

> Written in Golang

- Multiplayer
- Payload generation (exe/shellcode/dll)
- HTTP/HTTPS listeners
- Customizable C2 profiles 
- External C2

#### Demon

> Havoc's flagship agent written in C and ASM

- Sleep Obfuscation via [Ekko](https://github.com/Cracked5pider/Ekko), Ziliean or [FOLIAGE](https://github.com/SecIdiot/FOLIAGE)
- x64 return address spoofing
- Indirect Syscalls for Nt* APIs
- SMB support
- Token vault
- Variety of built-in post-exploitation commands
- Patching Amsi/Etw via Hardware breakpoints
- Proxy library loading
- Stack duplication during sleep. 

<div align="center">
  <img src="assets/Screenshots/SessionConsoleHelp.png" width="90%" /><br />
</div>

#### Extensibility

- [External C2](https://github.com/HavocFramework/Havoc/wiki#external-c2)
- Custom Agent Support
  - [Talon](https://github.com/HavocFramework/Talon)
- [Python API](https://github.com/HavocFramework/havoc-py)
- [Modules](https://github.com/HavocFramework/Modules)

---

### Community

You can join the official [Havoc Discord](https://discord.gg/z3PF3NRDE5) to chat with the community! 

### Contributing

To contribute to the Havoc Framework, please review the guidelines in [Contributing.md](https://github.com/HavocFramework/Havoc/blob/main/CONTRIBUTING.MD) and then open a pull-request! 

### Note

Please do not open any issues regarding detection. 

The Havoc Framework hasn't been developed to be evasive. Rather it has been designed to be as malleable & modular as possible. Giving the operator the capability to add custom features or modules that evades their targets detection system. 

### Sponsors 
JetBrains has sponsored this project by providing us with OSS licenses for Havoc development.

<img width="400" src="https://resources.jetbrains.com/storage/products/company/brand/logos/jetbrains.png" alt="JetBrains logo.">
---

## Credits

- [Havoc Framework](https://github.com/HavocFramework/Havoc)
- All original authors and contributors

---

**This repository is for research and educational purposes only.**

# Patched Fork of Havoc C2

This is my personal patched fork of the [Havoc C2 framework](https://github.com/HavocFramework/Havoc).

## Features & Changes

- All original Havoc features
- Custom patches and bugfixes for:
  - Indirect syscalls
  - Sleep obfuscation (Ekko)
  - Stack duplication
  - Proxy loading (RtlRegisterWait)
  - AMSI/ETW patching (hardware breakpoints)
  - WoW64 and pointer/integer cast fixes
  - Build and compatibility improvements

## Why this fork?

This fork exists to:
- Apply custom patches and enhancements
- Fix build issues on modern toolchains
- Serve as a stable, personal base for further research

## Usage

See the original [Havoc README](https://github.com/HavocFramework/Havoc#readme) for usage instructions.  
All build and usage steps are the same unless otherwise noted.

## Credits

- [Havoc Framework](https://github.com/HavocFramework/Havoc)
- All original authors and contributors

---
