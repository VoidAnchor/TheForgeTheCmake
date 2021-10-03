cmake_minimum_required(VERSION 3.15)
project(The-Forge-Workspace)
# Do some OS checks, and setup accordingly.

set(APPLE_PLATFORM OFF)
set(LINUX OFF)
set(WINDOWS OFF)
set(METAL OFF)
set(DX12 OFF)
set(DX11 OFF)
set(VULKAN OFF)

set(ASSIMP OFF)
set(OZZ OFF)

set(RENDER_LIBRARIES "")
set(RENDER_INCLUDES "")

set(GLOBAL_LIBRARIES "")
set(GLOBAL_INCLUDES "")
set(GLOBAL_DEFINES "")

set(THE_FORGE_INCLUDE_DIRS "" CACHE PATH "The Forge's include directories.")
set(THE_FORGE_LIBRARIES "" CACHE PATH "The Forge's libraries.")

if (${CMAKE_SYSTEM_NAME} MATCHES "Darwin")
    message("Apple platform detected. Generating macOS and iOS targets.")

    set(APPLE_PLATFORM ON)
    set(METAL ON)

    find_library(APPLE_APPKIT AppKit)
    find_library(APPLE_QUARTZCORE QuartzCore)
    find_library(APPLE_METAL Metal)
    find_library(APPLE_METALKIT MetalKit)
    find_library(APPLE_METALPS MetalPerformanceShaders)

    set(RENDER_LIBRARIES
        ${RENDER_LIBRARIES}
        ${APPLE_QUARTZCORE}
        ${APPLE_METAL}
        ${APPLE_METALKIT}
        ${MetalPerformanceShaders}
    )

    set(GLOBAL_LIBRARIES
        ${GLOBAL_LIBRARIES}
        ${APPLE_APPKIT}
    )

    set(CMAKE_CXX_FLAGS "-x objective-c++")
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
endif()

if (${CMAKE_SYSTEM_NAME} MATCHES "Windows")
    message("Windows detected. Generating Windows targets.")
    set(WINDOWS ON)
    set(DX11 ON)
    set(DX12 ON)

    find_package(Vulkan REQUIRED)
    if (Vulkan_FOUND MATCHES TRUE)
        set(RENDER_LIBRARIES ${GLOBAL_LIBRARIES} ${Vulkan_LIBRARIES})
        set(RENDER_INCLUDES ${GLOBAL_INCLUDES} ${Vulkan_INCLUDE_DIRS})
        set(VULKAN ON)
    endif()
endif()

# Gather the switches, set up our required defines.
if(${WINDOWS} MATCHES ON)
    set(GLOBAL_DEFINES ${GLOBAL_DEFINES}
        "_WINDOWS"
    )
endif()

if(${VULKAN} MATCHES ON)
    set(GLOBAL_DEFINES ${GLOBAL_DEFINES}
        "VULKAN"
    )
endif()

if(${METAL} MATCHES ON)
    set(GLOBAL_DEFINES ${GLOBAL_DEFINES}
        "METAL"
    )
endif()

if(${DX11} MATCHES ON)
    set(GLOBAL_DEFINES ${GLOBAL_DEFINES}
        "DIRECT3D11"
    )
endif()

if(${DX12} MATCHES ON)
    set(GLOBAL_DEFINES ${GLOBAL_DEFINES}
        "DIRECT3D12"
    )
endif()

add_subdirectory(The-Forge/Common_3/ThirdParty/OpenSource/gainput/)

set(GLOBAL_LIBRARIES ${GLOBAL_LIBRARIES}
        gainputstatic
        )

add_subdirectory(Common_3)
