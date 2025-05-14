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
