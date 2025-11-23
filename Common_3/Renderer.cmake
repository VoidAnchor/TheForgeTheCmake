# Graphics/Renderer - The-Forge v1.60+
# This file defines the graphics backend files and dependencies

set(GRAPHICS_DIR ${CMAKE_CURRENT_SOURCE_DIR}/../The-Forge/Common_3/Graphics)
set(RENDERER_DIR ${CMAKE_CURRENT_SOURCE_DIR}/../The-Forge/Common_3/Renderer)
set(RESOURCES_DIR ${CMAKE_CURRENT_SOURCE_DIR}/../The-Forge/Common_3/Resources)
set(TOOLS_DIR ${CMAKE_CURRENT_SOURCE_DIR}/../The-Forge/Common_3/Tools)

# Core Graphics files
set(GRAPHICS_CORE_FILES
    ${GRAPHICS_DIR}/GraphicsConfig.cpp
    ${GRAPHICS_DIR}/GraphicsConfig.h
    ${GRAPHICS_DIR}/Interfaces/IGraphics.h
    ${GRAPHICS_DIR}/Interfaces/IRay.h
    ${GRAPHICS_DIR}/Interfaces/IShaderReflection.h
)

# Resource Loader
set(RESOURCE_LOADER_FILES
    ${RESOURCES_DIR}/ResourceLoader/ResourceLoader.cpp
    ${RESOURCES_DIR}/ResourceLoader/Interfaces/IResourceLoader.h
    ${RESOURCES_DIR}/ResourceLoader/TextureContainers.h
)

# Renderer subsystems
set(RENDERER_PARTICLE_FILES
    ${RENDERER_DIR}/ParticleSystem/ParticleSystem.cpp
    ${RENDERER_DIR}/Interfaces/IParticleSystem.h
)

set(RENDERER_VISBUFFER_FILES
    ${RENDERER_DIR}/VisibilityBuffer/VisibilityBuffer.cpp
    ${RENDERER_DIR}/Interfaces/IVisibilityBuffer.h
)

# Tools
set(TOOLS_NETWORK_FILES
    ${TOOLS_DIR}/Network/Network.c
    ${TOOLS_DIR}/Network/Network.h
    ${TOOLS_DIR}/ReloadServer/ReloadClient.cpp
    ${TOOLS_DIR}/ReloadServer/ReloadClient.h
)

# Metal backend (macOS/iOS)
set(METAL_FILES
    ${GRAPHICS_DIR}/Metal/MetalAvailabilityMacros.h
    ${GRAPHICS_DIR}/Metal/MetalCapBuilder.h
    ${GRAPHICS_DIR}/Metal/MetalConfig.h
    ${GRAPHICS_DIR}/Metal/MetalMemoryAllocatorImpl.h
    ${GRAPHICS_DIR}/Metal/MetalRaytracing.mm
    ${GRAPHICS_DIR}/Metal/MetalRenderer.mm
)

# DirectX 12 backend
set(DX12_FILES
    ${GRAPHICS_DIR}/Direct3D12/Direct3D12.c
    ${GRAPHICS_DIR}/Direct3D12/Direct3D12_Cxx.cpp
    ${GRAPHICS_DIR}/Direct3D12/Direct3D12_Cxx.h
    ${GRAPHICS_DIR}/Direct3D12/Direct3D12CapBuilder.h
    ${GRAPHICS_DIR}/Direct3D12/Direct3D12Config.h
    ${GRAPHICS_DIR}/Direct3D12/Direct3D12Hooks.c
    ${GRAPHICS_DIR}/Direct3D12/Direct3D12Hooks.h
    ${GRAPHICS_DIR}/Direct3D12/Direct3D12Raytracing.c
)

# Vulkan backend
set(VULKAN_FILES
    ${GRAPHICS_DIR}/Vulkan/Vulkan.c
    ${GRAPHICS_DIR}/Vulkan/VulkanCapsBuilder.h
    ${GRAPHICS_DIR}/Vulkan/VulkanConfig.h
    ${GRAPHICS_DIR}/Vulkan/VulkanRaytracing.c
)

# FSL headers
set(FSL_HEADERS
    ${GRAPHICS_DIR}/FSL/d3d12_srt.h
    ${GRAPHICS_DIR}/FSL/defaults.h
    ${GRAPHICS_DIR}/FSL/fsl_srt.h
    ${GRAPHICS_DIR}/FSL/metal_srt.h
    ${GRAPHICS_DIR}/FSL/vulkan_srt.h
)

# Combine renderer files
set(RENDERER_SOURCE_FILES
    ${GRAPHICS_CORE_FILES}
    ${RESOURCE_LOADER_FILES}
    ${RENDERER_PARTICLE_FILES}
    ${RENDERER_VISBUFFER_FILES}
    ${TOOLS_NETWORK_FILES}
    ${FSL_HEADERS}
)

# Metal backend
if(METAL)
    find_library(APPLE_METAL Metal)
    find_library(APPLE_METALKIT MetalKit)
    find_library(APPLE_METALPS MetalPerformanceShaders)

    list(APPEND RENDER_LIBRARIES
        ${APPLE_METAL}
        ${APPLE_METALKIT}
        ${APPLE_METALPS}
    )

    list(APPEND RENDERER_FILES ${METAL_FILES})
endif()

# Vulkan backend
if(VULKAN)
    find_package(Vulkan REQUIRED)
    if(Vulkan_FOUND)
        message(STATUS "Vulkan SDK found.")
        list(APPEND RENDER_LIBRARIES Vulkan::Vulkan)
    else()
        message(FATAL_ERROR "Vulkan SDK not found.")
    endif()

    list(APPEND RENDER_LIBRARIES VulkanMemoryAllocator)
    list(APPEND RENDERER_FILES ${VULKAN_FILES})
endif()

# DirectX 12 backend
if(DX12)
    list(APPEND RENDER_LIBRARIES
        D3D12MemoryAllocator
        DirectXShaderCompiler
        d3d12.lib
        dxgi.lib
    )
    list(APPEND RENDERER_FILES ${DX12_FILES})
    list(APPEND RENDER_DEFINES "DIRECT3D12")
endif()

# Apple platform libraries
if(APPLE_PLATFORM)
    find_library(APPLE_APPKIT AppKit)
    find_library(APPLE_QUARTZCORE QuartzCore)
    find_library(APPLE_IOKIT IOKit)

    list(APPEND RENDER_LIBRARIES
        ${APPLE_QUARTZCORE}
        ${APPLE_APPKIT}
        ${APPLE_IOKIT}
    )
endif()

# Windows platform libraries
if(WINDOWS)
    list(APPEND RENDER_LIBRARIES
        WinPixEventRuntime
        AGS
        Nvapi
        Xinput9_1_0.lib
        ws2_32.lib
    )

    list(APPEND RENDER_DEFINES "_WINDOWS")

    list(APPEND RENDER_INCLUDES
        ${GRAPHICS_DIR}/ThirdParty/OpenSource/ags
        ${GRAPHICS_DIR}/ThirdParty/OpenSource/nvapi
        ${GRAPHICS_DIR}/ThirdParty/OpenSource/DirectXShaderCompiler/inc
        ${GRAPHICS_DIR}/ThirdParty/OpenSource/Direct3d12Agility/include
    )
endif()
