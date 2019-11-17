cmake_minimum_required(VERSION 3.15)
project(The-Forge-Workspace)
# Do some OS checks, and setup accordingly.

set(APPLE_PLATFORM OFF)
set(LINUX OFF)
set(WINDOWS OFF)
set(VULKAN OFF)

set(RENDER_LIBRARIES "")
set(RENDER_INCLUDES "")

set(GLOBAL_LIBRARIES "")
set(GLOBAL_INCLUDES "")
set(GLOBAL_DEFINES "")

if (${CMAKE_SYSTEM_NAME} MATCHES "Darwin")
    message("Apple platform detected. Generating macOS and iOS targets.")

    set(APPLE_PLATFORM ON)

    set(GLOBAL_DEFINES ${GLOBAL_DEFINES}
        "METAL"
    )

    find_library(APPLE_APPKIT AppKit)
	find_library(APPLE_QUARTZCORE QuartzCore)
    find_library(APPLE_METAL Metal)
    find_library(APPLE_METALKIT MetalKit)
    find_library(APPLE_METALPS MetalPerformanceShaders)

    set(RENDER_LIBRARIES    ${RENDER_LIBRARIES}
        ${APPLE_QUARTZCORE}
        ${APPLE_METAL}
        ${APPLE_METALKIT}
        ${MetalPerformanceShaders}
    )

    set(GLOBAL_LIBRARIES    ${GLOBAL_LIBRARIES}
        ${APPLE_APPKIT}
    )
    
    set(CMAKE_CXX_FLAGS "-x objective-c++")
endif()

if (${CMAKE_SYSTEM_NAME} MATCHES "Linux")
    message("Linux detected. Generating Linux targets.")
    set(${LINUX} ON)

    find_package(Vulkan REQUIRED)
    if (Vulkan_FOUND MATCHES True)
        set(RENDER_LIBRARIES ${GLOBAL_LIBRARIES} ${Vulkan_LIBRARIES})
        set(RENDER_INCLUDES ${GLOBAL_INCLUDES} ${Vulkan_INCLUDE_DIRS})
    endif()
endif()

if (${CMAKE_SYSTEM_NAME} MATCHES "Windows")
    message("Windows detected. Generating Windows targets.")
    set(${WINDOWS} ON)
endif()

add_subdirectory(The-Forge/Common_3/ThirdParty/OpenSource/gainput/)

set(GLOBAL_LIBRARIES ${GLOBAL_LIBRARIES}
    gainputstatic
)

add_subdirectory(Common_3)
