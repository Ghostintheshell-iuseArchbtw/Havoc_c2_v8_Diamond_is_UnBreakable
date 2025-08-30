<div align="center">
  <img width="125px" src="assets/Havoc.png" />
  <h1>Havoc</h1>
  <br/>

  <p><i>Havoc is a modern and malleable post-exploitation command and control framework, created by <a href="https://twitter.com/C5pider">@C5pider</a>.</i></p>
  <br />

  <img src="assets/Screenshots/FullSessionGraph.jpeg" width="90%" /><br />
  <img src="assets/Screenshots/MultiUserAgentControl.png" width="90%" /><br />
  
</div>

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

### Note

Please do not open any issues regarding detection. 


````markdown name=README.md
<div align="center">
  <img width="125px" src="assets/Havoc.png" />
  <h1>Patched Fork of Havoc C2 - <br/> <b>v0.8 "Diamond is Unbreakable"</b></h1>
  <br/>

  <p><i>
    <b>Havoc</b> is a modern, malleable post-exploitation command and control framework, originally created by <a href="https://twitter.com/C5pider">@C5pider</a>.<br/>
    This is a <b>patched and upgraded fork</b> featuring stability, security, and usability improvements, bringing Havoc to <b>version 0.8 "Diamond is Unbreakable"</b>.
  </i></p>
  <br />

  <img src="assets/Screenshots/FullSessionGraph.jpeg" width="90%" /><br />
  <img src="assets/Screenshots/MultiUserAgentControl.png" width="90%" /><br />
</div>

---

## 🚀 Quick Start

See the [Wiki](https://github.com/HavocFramework/Havoc/wiki) for full documentation.<br/>
For installation steps, visit the [Installation Guide](https://havocframework.com/docs/installation).

Havoc runs best on Debian 10/11, Ubuntu 20.04/22.04, Kali Linux, and other modern Linux distros. Ensure you use the latest Qt and Python 3.10.x. For troubleshooting, check [Known Issues](https://github.com/HavocFramework/Havoc/wiki#known-issues).

---

## ✨ What’s New in v0.8 "Diamond is Unbreakable"

This fork introduces several key patches and upgrades:

- **Stability & Security Upgrades:**  
  Improved error handling, hardened messaging between components, and patched known vulnerabilities.
- **Performance Optimizations:**  
  Faster payload generation and more efficient session management.
- **Extensive Logging & Audit Features:**  
  Enhanced session logs, operator activity tracking, and optional audit trail support.
- **Upgraded Demon Agent:**  
  - Improved sleep obfuscation (Ekko, Ziliean, FOLIAGE)
  - Enhanced indirect syscall support
  - Better patching for AMSI/ETW
  - Stack duplication improvements
- **New Modules & Integrations:**  
  - Additional Python API examples
  - Better support for [Talon](https://github.com/HavocFramework/Talon)
  - Support for more community modules
- **UI Tweaks:**  
  Refined dark mode, improved graphing in session view, and multi-agent controls.
- **General Fixes:**  
  - Fixed payload generation bugs on some platforms
  - Improved SMB support and token vault operations
  - Fixed minor UI glitches and improved responsiveness

See the [CHANGELOG](./CHANGELOG.md) for a complete list of patches.

---

## 🛠️ Main Features

### Client

> Cross-platform UI written in C++ and Qt

- Modern, dark theme based on [Dracula](https://draculatheme.com/)
- Multi-session and multi-user support
- Advanced session graphing and monitoring

### Teamserver

> Written in Go

- Multiplayer operations
- Payload generation (exe, shellcode, dll)
- HTTP/HTTPS listeners
- Customizable C2 profiles
- External C2 support

### Demon

> Havoc’s flagship agent (C & ASM)

- Sleep Obfuscation: [Ekko](https://github.com/Cracked5pider/Ekko), Ziliean, [FOLIAGE](https://github.com/SecIdiot/FOLIAGE)
- x64 return address spoofing
- Indirect Syscalls for Nt* APIs
- SMB support
- Token vault
- Broad post-exploitation command set
- AMSI/ETW patching via hardware breakpoints
- Proxy library loading
- Stack duplication during sleep

<div align="center">
  <img src="assets/Screenshots/SessionConsoleHelp.png" width="90%" /><br />
</div>

### Extensibility

- [External C2](https://github.com/HavocFramework/Havoc/wiki#external-c2)
- Custom Agent Support ([Talon](https://github.com/HavocFramework/Talon))
- [Python API](https://github.com/HavocFramework/havoc-py)
- [Modules](https://github.com/HavocFramework/Modules)
- Community-contributed extensions and scripts

---

## 🌐 Community

Join the official [Havoc Discord](https://discord.gg/z3PF3NRDE5) for discussions, support, and sharing custom modules.

---

## ⚠️ Note

**Detection/Evasion:**  
Do not open issues regarding AV/EDR detection. This framework is designed to be modular and malleable, not inherently evasive.  
Operators are encouraged to add their own features and modules as needed.

---

## 📦 Licensing & Attribution

Havoc is licensed under the original terms. All patches and enhancements in this fork are provided by [Ghostintheshell-iuseArchbtw](https://github.com/Ghostintheshell-iuseArchbtw).

---

## ❤️ Acknowledgements

- Original project by [@C5pider](https://github.com/HavocFramework)
- Thanks to all contributors and the Havoc community!

````

