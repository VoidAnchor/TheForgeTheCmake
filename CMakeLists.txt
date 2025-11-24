cmake_minimum_required(VERSION 3.15)

project(The-Forge)

# Enable Objective-C/C++ for Apple platforms
if(APPLE)
    enable_language(OBJC)
    enable_language(OBJCXX)
endif()

# Platform detection
set(APPLE_PLATFORM OFF)
set(TARGET_MACOS OFF)
set(TARGET_IOS OFF)
set(LINUX OFF)
set(WINDOWS OFF)
set(METAL OFF)

if(CMAKE_SYSTEM_NAME MATCHES "Darwin")
    message(STATUS "macOS platform detected")
    set(APPLE_PLATFORM ON)
    set(TARGET_MACOS ON)
    set(METAL ON)
endif()

if(CMAKE_SYSTEM_NAME MATCHES "iOS")
    message(STATUS "iOS platform detected")
    set(APPLE_PLATFORM ON)
    set(TARGET_IOS ON)
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

# iOS code signing - set your team ID with -DCMAKE_XCODE_ATTRIBUTE_DEVELOPMENT_TEAM=XXXXXXXXXX
if(TARGET_IOS AND NOT CMAKE_XCODE_ATTRIBUTE_DEVELOPMENT_TEAM)
    message(WARNING "iOS builds require a development team. Set -DCMAKE_XCODE_ATTRIBUTE_DEVELOPMENT_TEAM=<your-team-id>")
endif()

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
