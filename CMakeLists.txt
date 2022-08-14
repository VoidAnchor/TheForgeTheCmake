cmake_minimum_required(VERSION 3.15)

project(The-Forge)

# Do some OS checks, and setup accordingly.
set(APPLE_PLATFORM OFF)
set(LINUX OFF)
set(WINDOWS OFF)

# On macOS, we always set Metal support to on.
set(METAL OFF)

# Make our APIs into options
option(DX12 "DirectX12 (Windows only)" OFF)
option(DX11 "DirectX11 (Windows only)" OFF)
option(EXAMPLES "The Forge examples" OFF)
option(VULKAN "Vulkan" OFF)
option(DYNAMIC_LIB "Dynamic Library" OFF)

set(ASSIMP OFF)
set(OZZ OFF)

set(RENDER_LIBRARIES "")
set(RENDER_LIBRARY_PATHS "")
set(RENDER_INCLUDES "")
set(RENDER_DEFINES "")

if (${CMAKE_SYSTEM_NAME} MATCHES "Darwin")
    message("Apple platform detected. Generating macOS and iOS targets.")

    set(APPLE_PLATFORM ON)

    find_library(APPLE_APPKIT AppKit)
    find_library(APPLE_QUARTZCORE QuartzCore)
    find_library(APPLE_IOKIT IOKit)

    set(RENDER_LIBRARIES
        ${RENDER_LIBRARIES}
        ${APPLE_QUARTZCORE}
        ${APPLE_APPKIT}
        ${APPLE_IOKIT}
    )

    set(CMAKE_CXX_FLAGS "-x objective-c++")
endif()

if (${CMAKE_SYSTEM_NAME} MATCHES "Linux")
    message("Linux detected. Generating Linux targets.")
    set(LINUX ON)

    set(VULKAN ON)
endif()

if (${CMAKE_SYSTEM_NAME} MATCHES "Windows")
    message("Windows detected. Generating Windows targets.")
    set(WINDOWS ON)

    set(RENDER_LIBRARY_PATHS
        "The-Forge/Common_3/ThirdParty/OpenSource/ags/ags_lib/lib"
        "The-Forge/Common_3/ThirdParty/OpenSource/nvapi/amd64"
        "The-Forge/Common_3/ThirdParty/OpenSource/DirectXShaderCompiler/lib/x64"
        "The-Forge/Common_3/ThirdParty/OpenSource/winpixeventruntime/bin"
    )

    set(RENDER_LIBRARIES ${RENDER_LIBRARIES}

        "WinPixEventRuntime.lib"
        "amd_ags_x64.lib"
        "nvapi64.lib"
        "Xinput9_1_0.lib"
        "ws2_32.lib"
    )
endif()

# Gather the switches, set up our required defines.
if(${WINDOWS} MATCHES ON)
    set(RENDER_DEFINES ${RENDER_DEFINES}
        "_WINDOWS"
    )
endif()


# Setup some sane API defaults.
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

# Apple platforms should always default to Metal.
if (${APPLE_PLATFORM} MATCHES ON)
    if(${METAL} MATCHES OFF)
        set(METAL ON)
    endif()

    if(${VULKAN} MATCHES ON)
        set(VULKAN OFF)
    endif()

    if(${DX11} MATCHES ON)
        set(DX11 OFF)
    endif()

    if(${DX12} MATCHES ON)
        set(DX12 OFF)
    endif()

    set(API_SELECTED ON)
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
        # Needed due to how the profiler in forge force-links to vulkan as well.
        set(VULKAN ON)
    endif()
endif()

if(${VULKAN} MATCHES ON)
    find_package(Vulkan REQUIRED)
    if (Vulkan_FOUND MATCHES TRUE)
        message("Vulkan SDK found.")
        set(RENDER_LIBRARIES ${RENDER_LIBRARIES} Vulkan::Vulkan)
    else()
        message("Vulkan SDK not found.  Please make sure it is installed and added to your path.")
    endif()
endif()

if(${METAL} MATCHES ON)
    find_library(APPLE_METAL Metal)
    find_library(APPLE_METALKIT MetalKit)
    find_library(APPLE_METALPS MetalPerformanceShaders)

    set(RENDER_LIBRARIES ${RENDER_LIBRARIES}
        ${APPLE_METAL}
        ${APPLE_METALKIT}
        ${APPLE_METALPS}
    )

    set(RENDER_DEFINES ${RENDER_DEFINES}
        "METAL"
    )
endif()

if(${DX12} MATCHES ON)

    set(RENDER_LIBRARIES ${RENDER_LIBRARIES}
            "dxcompiler.lib"
            "d3d12.lib"
            )
    set(DX11 ON)
endif()

if(${DX11} MATCHES ON)

    set(RENDER_LIBRARIES ${RENDER_LIBRARIES}
        "dxcompiler.lib"
        "d3d11.lib"
    )
endif()



message("The following options have been set to on:\n")
if(${APPLE_PLATFORM} MATCHES ON)
    message("Apple platform")
endif()

if(${LINUX} MATCHES ON)
    message("Linux platform")
endif()

if(${WINDOWS} MATCHES ON)
    message("Windows platform")
endif()

if(${METAL} MATCHES ON)
    message("Metal reendering API")
endif()

if(${VULKAN} MATCHES ON)
    message("Vulkan rendering API")
endif()

if(${DX11} MATCHES ON)
    message("DirectX 11 rendering API")
endif()

if(${DX12} MATCHES ON)
    message("DirectX 12 rendering API")
endif()

if(${DYNAMIC_LIB} MATCHES ON)
    message("Dynamic library")
endif()

message("\n")

add_subdirectory(Common_3)
add_subdirectory(Examples_3)
