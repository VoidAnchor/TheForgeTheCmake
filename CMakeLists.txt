cmake_minimum_required(VERSION 3.15)

project(The-Forge)

# Platform detection
set(APPLE_PLATFORM OFF)
set(LINUX OFF)
set(WINDOWS OFF)
set(METAL OFF)

if(CMAKE_SYSTEM_NAME MATCHES "Darwin")
    message(STATUS "Apple platform detected")
    set(APPLE_PLATFORM ON)
    set(METAL ON)
endif()

if(CMAKE_SYSTEM_NAME MATCHES "Linux")
    message(STATUS "Linux platform detected")
    set(LINUX ON)
    set(VULKAN ON)
endif()

if(CMAKE_SYSTEM_NAME MATCHES "Windows")
    message(STATUS "Windows platform detected")
    set(WINDOWS ON)
endif()

# API options
option(DX12 "DirectX 12 (Windows only)" OFF)
option(VULKAN "Vulkan" OFF)
option(EXAMPLES "Build The Forge examples" OFF)
option(DYNAMIC_LIB "Build as dynamic library" OFF)

# Set API defaults if none specified
if(NOT DX12 AND NOT VULKAN AND NOT METAL)
    if(APPLE_PLATFORM)
        set(METAL ON)
    elseif(LINUX)
        set(VULKAN ON)
    elseif(WINDOWS)
        set(DX12 ON)
        set(VULKAN ON)  # Profiler links to Vulkan
    endif()
endif()

# Apple always uses Metal
if(APPLE_PLATFORM)
    set(METAL ON)
    set(VULKAN OFF)
    set(DX12 OFF)
endif()

# Print configuration
message(STATUS "")
message(STATUS "The-Forge Configuration:")
message(STATUS "  Platform: ${CMAKE_SYSTEM_NAME}")
if(METAL)
    message(STATUS "  API: Metal")
endif()
if(VULKAN)
    message(STATUS "  API: Vulkan")
endif()
if(DX12)
    message(STATUS "  API: DirectX 12")
endif()
if(DYNAMIC_LIB)
    message(STATUS "  Library: Dynamic")
else()
    message(STATUS "  Library: Static")
endif()
message(STATUS "")

add_subdirectory(Common_3)
add_subdirectory(Examples_3)
