set(WG_LIB_DIR "${CMAKE_CURRENT_LIST_DIR}/../WireGuard/src")
set(WRAPPER_DIR "${CMAKE_CURRENT_LIST_DIR}/../src")

# Create an INTERFACE library for our CPP module.
add_library(usermod_wireguard INTERFACE)

# Add the current directory as an include directory.
target_include_directories(usermod_wireguard INTERFACE
    ${WRAPPER_DIR}
    ${WG_LIB_DIR}
)

# Add our source files to the library.
target_sources(usermod_wireguard INTERFACE
    ${WG_LIB_DIR}/crypto/refc/blake2s.c
    ${WG_LIB_DIR}/crypto/refc/chacha20.c
    ${WG_LIB_DIR}/crypto/refc/chacha20poly1305.c
    ${WG_LIB_DIR}/crypto/refc/poly1305-donna.c
    ${WG_LIB_DIR}/crypto/refc/x25519.c
    ${WG_LIB_DIR}/crypto.c
    ${WG_LIB_DIR}/default_netif_ESP32.c
    ${WG_LIB_DIR}/wireguard.c
    ${WG_LIB_DIR}/WireGuard.cpp
    ${WG_LIB_DIR}/wireguardif.c
    ${WG_LIB_DIR}/wireguard-platform.c
    ${WRAPPER_DIR}/wireguard-mp-wrapper.cpp
    ${WRAPPER_DIR}/wireguard-mp-module.c
)

# Link our INTERFACE library to the usermod target.
target_link_libraries(usermod INTERFACE usermod_wireguard)
