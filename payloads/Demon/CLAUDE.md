# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Build Commands

### Primary Build Process
```bash
# Clean and rebuild from scratch (required after CMakeLists.txt changes)
rm -rf Build && mkdir Build
cd Build && cmake ..
make -C Build

# Quick clean using makefile
make clean
```

### Build Requirements
- MinGW-w64 cross-compiler (`x86_64-w64-mingw32-gcc`)
- NASM assembler for Windows assembly files
- CMake 3.19+

The build produces a Windows PE32+ executable: `Build/Demon.exe` (~270KB)

## Architecture Overview

### Core Architecture
This is a C2 (Command & Control) agent written in C with inline assembly, designed to run on Windows targets. The codebase follows a modular architecture centered around a global `INSTANCE` structure that maintains all runtime state.

### Key Components

**INSTANCE Structure** (`include/Demon.h:48-557`)
- Global singleton containing all agent state: session info, configuration, loaded modules, syscall tables, transport handles, and linked lists for jobs/tokens/pivots
- Contains nested structures for Session, Config.Transport, Win32 function pointers, and Syscall service numbers

**Transport Layer** (`src/core/Transport*.c`)
- Abstracted communication supporting HTTP/HTTPS and SMB named pipes
- `TransportSend()` handles AES-encrypted bidirectional communication
- HTTP uses WinHTTP API with proxy support; SMB uses named pipes for lateral movement

**Command Processing** (`src/core/Command.c`)
- Processes commands from C2 server (100+ command types defined in `include/core/Command.h`)
- Commands range from system info gathering, process manipulation, token management, to .NET assembly execution
- Uses `PPACKAGE` response structures for structured data return

**Package System** (`src/core/Package.c`)
- Serialization framework for C2 communication
- Functions like `PackageAddInt32()`, `PackageAddString()` build structured responses
- Handles request IDs, encryption flags, and automatic transmission

**Evasion Techniques**
- **Syscall Obfuscation**: `src/asm/Syscall.x64.asm` provides `SysInvoke()` for direct syscalls, bypassing userland hooks
- **Stack Spoofing**: `src/asm/Spoof.x64.asm` implements return address spoofing to evade stack-walking detection
- **API Resolution**: Dynamic resolution of Windows APIs to avoid static analysis (`src/core/Win32.c`)

### Entry Points and Build Targets
The CMakeLists.txt is configured to build different executable types by including different main files:
- `MainExe.c`: Standalone executable with `WinMain` 
- `MainSvc.c`: Windows service with service control handlers
- `MainDll.c`: DLL with `DllMain` and optional threading

**Critical**: Only include ONE main file per build to avoid linker conflicts.

### Assembly Integration
- Uses NASM with `-f win64` format for Windows x64 object files
- Assembly files provide low-level evasion primitives that can't be implemented in C
- `SysSetConfig()` and `SysInvoke()` enable indirect syscalls for API evasion

### Common Issues and Solutions

**Type Casting**: The codebase frequently requires explicit casting between Windows types:
- `PVOID` ↔ `UINT_PTR` for pointer arithmetic
- `LPSTR` ↔ `LPCWSTR` with conversion functions from `core/MiniStd.h`
- `UINT32` ↔ `DWORD`/`u_long` for API compatibility

**Linker Dependencies**: 
- Requires Windows libraries: `netapi32`, `ws2_32`, `winhttp`, `advapi32`, etc.
- Avoid .NET libraries (`mscoree`, `mscorlib`) that aren't available in MinGW

**Memory Management**:
- Uses custom heap functions `MmHeapAlloc()`, `MmHeapFree()` 
- `BUFFER` structure pattern: `{PVOID Buffer; UINT32 Length}`

### Development Notes
- Compile flags include evasion techniques: `-ffunction-sections`, `-fdata-sections` for smaller footprint
- `DEBUG` preprocessor flag enables console output via `PRINTF()` macros
- Transport protocols controlled by `TRANSPORT_HTTP` and `TRANSPORT_SMB` compile definitions