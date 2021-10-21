cmake_minimum_required(VERSION 3.15)
project(The-Forge-Workspace)

# Do some OS checks, and setup accordingly.
set(APPLE_PLATFORM OFF)
set(LINUX OFF)
set(WINDOWS OFF)

set(METAL OFF)

# Make our APIs into options
option(DX12 "DirectX12 (Windows only)" OFF)
option(DX11 "DirectX11 (Windows only)" OFF)
option(VULKAN "Vulkan" OFF)

set(ASSIMP OFF)
set(OZZ OFF)

set(RENDER_LIBRARIES "")
set(RENDER_INCLUDES "")

set(GLOBAL_LIBRARIES "")
set(GLOBAL_INCLUDES "")
set(GLOBAL_DEFINES "")

set(PLATFORM_STATIC_EXT "")
set(PLATFORM_DYNAMIC_EXT "")

set(THE_FORGE_INCLUDE_DIRS "" CACHE PATH "The Forge's include directories.")
set(THE_FORGE_LIBRARIES "" CACHE PATH "The Forge's libraries.")

if (${CMAKE_SYSTEM_NAME} MATCHES "Darwin")
    message("Apple platform detected. Generating macOS and iOS targets.")

    set(APPLE_PLATFORM ON)

    find_library(APPLE_APPKIT AppKit)
    find_library(APPLE_QUARTZCORE QuartzCore)

    set(RENDER_LIBRARIES
        ${RENDER_LIBRARIES}
        ${APPLE_QUARTZCORE}
    )

    set(GLOBAL_LIBRARIES
        ${GLOBAL_LIBRARIES}
        ${APPLE_APPKIT}
    )

    set(CMAKE_CXX_FLAGS "-x objective-c++")
    set(PLATFORM_STATIC_EXT ".a")
    set(PLATFORM_DYNAMIC_EXT ".dylib")
endif()

if (${CMAKE_SYSTEM_NAME} MATCHES "Linux")
    message("Linux detected. Generating Linux targets.")
    set(LINUX ON)

    find_package(Vulkan REQUIRED)
    if (Vulkan_FOUND MATCHES "True")
        set(RENDER_LIBRARIES ${GLOBAL_LIBRARIES} ${Vulkan_LIBRARIES})
        set(RENDER_INCLUDES ${GLOBAL_INCLUDES} ${Vulkan_INCLUDE_DIRS})
        set(VULKAN ON)
    endif()
    
    set(PLATFORM_STATIC_EXT ".a")
    set(PLATFORM_DYNAMIC_EXT ".so")
endif()

if (${CMAKE_SYSTEM_NAME} MATCHES "Windows")
    message("Windows detected. Generating Windows targets.")
    set(WINDOWS ON)

    set(RENDER_LIBRARIES ${RENDER_LIBRARIES}
        "WinPixEventRuntime.lib"
        "amd_ags_x64.lib"
        "nvapi64.lib"
    )
    
    set(PLATFORM_STATIC_EXT ".lib")
    set(PLATFORM_DYNAMIC_EXT ".dll")
endif()

# Gather the switches, set up our required defines.
if(${WINDOWS} MATCHES ON)
    set(GLOBAL_DEFINES ${GLOBAL_DEFINES}
        "_WINDOWS"
    )
endif()

set(API_SELECTED ON)

if(${VULKAN} MATCHES OFF)
    if(${DX11} MATCHES OFF)
        if(${DX12} MATCHES OFF)
            if(${METAL} MATCHES OFF)
                set(API_SELECTED OFF)
            endif()
        endif()
    endif()
endif()

if (${API_SELECTED} MATCHES OFF)
    if(${APPLE_PLATFORM} MATCHES ON)
        set(METAL ON)
    endif()

    if(${LINUX} MATCHES ON)
        set(VULKAN ON)
    endif()

    if(${WINDOWS} MATCHES ON)
        set(DX12 ON)
    endif()
endif()

if(${VULKAN} MATCHES ON)
    find_package(Vulkan REQUIRED)
    if (Vulkan_FOUND MATCHES TRUE)
        set(RENDER_LIBRARIES ${GLOBAL_LIBRARIES} ${Vulkan_LIBRARIES})
        set(RENDER_INCLUDES ${GLOBAL_INCLUDES} ${Vulkan_INCLUDE_DIRS})
        set(GLOBAL_DEFINES ${GLOBAL_DEFINES}
             "VULKAN"
        )
     endif()
endif()

if(${METAL} MATCHES ON)
    find_library(APPLE_METAL Metal)
    find_library(APPLE_METALKIT MetalKit)
    find_library(APPLE_METALPS MetalPerformanceShaders)

    set(RENDER_LIBRARIES ${RENDER_LIBRARIES}
        ${APPLE_METAL}
        ${APPLE_METALKIT}
        ${MetalPerformanceShaders}
    )

    set(GLOBAL_DEFINES ${GLOBAL_DEFINES}
        "METAL"
    )
endif()

if(${DX11} MATCHES ON)
    set(GLOBAL_DEFINES ${GLOBAL_DEFINES}
        "DIRECT3D11"
    )

    set(RENDER_LIBRARIES ${RENDER_LIBRARIES}
        "dxcompiler.lib"
    )
endif()

if(${DX12} MATCHES ON)
    set(GLOBAL_DEFINES ${GLOBAL_DEFINES}
        "DIRECT3D12"
    )
    
    set(RENDER_LIBRARIES ${RENDER_LIBRARIES}
        "dxcompiler.lib"
    )
endif()

add_subdirectory(Common_3)
