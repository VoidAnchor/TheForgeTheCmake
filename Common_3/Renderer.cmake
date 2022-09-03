# Renderers

set(RENDERER_DIR ${CMAKE_CURRENT_SOURCE_DIR}/../The-Forge/Common_3/Renderer)

set(RENDERER_SOURCE_FILES
    ${RENDERER_DIR}/ResourceLoader.cpp
    ${RENDERER_DIR}/Renderer.cpp
    ${RENDERER_DIR}/CommonShaderReflection.cpp
)

set(RENDERER_INCLUDE_FILES
    ${RENDERER_DIR}/IRay.h
    ${RENDERER_DIR}/IRenderer.h
    ${RENDERER_DIR}/IResourceLoader.h
    ${RENDERER_DIR}/IShaderReflection.h
)

set(METAL_FILES
    ${RENDERER_DIR}/Metal/MetalAvailabilityMacros.h
    ${RENDERER_DIR}/Metal/MetalCapBuilder.h
    ${RENDERER_DIR}/Metal/MetalConfig.h
    ${RENDERER_DIR}/Metal/MetalMemoryAllocator.h
    ${RENDERER_DIR}/Metal/MetalMemoryAllocatorImpl.h
    ${RENDERER_DIR}/Metal/MetalRaytracing.mm
    ${RENDERER_DIR}/Metal/MetalRenderer.mm
    ${RENDERER_DIR}/Metal/MetalShaderReflection.mm
)

set(RENDER_QUEST_FILES
    ${RENDERER_DIR}/Quest/VrApiHooks.cpp
    ${RENDERER_DIR}/Quest/VrApiHooks.h
)

set(DX11_FILES
    ${RENDERER_DIR}/Direct3D11/Direct3D11.cpp
    ${RENDERER_DIR}/Direct3D11/Direct3D11CapBuilder.h
    ${RENDERER_DIR}/Direct3D11/Direct3D11Config.h
    ${RENDERER_DIR}/Direct3D11/Direct3D11Raytracing.cpp
    ${RENDERER_DIR}/Direct3D11/Direct3D11ShaderReflection.cpp
)

set(DX12_FILES
    ${RENDERER_DIR}/Direct3D12/Direct3D12.cpp
    ${RENDERER_DIR}/Direct3D12/Direct3D12CapBuilder.h
    ${RENDERER_DIR}/Direct3D12/Direct3D12Hooks.cpp
    ${RENDERER_DIR}/Direct3D12/Direct3D12Hooks.h
    ${RENDERER_DIR}/Direct3D12/Direct3D12Raytracing.cpp
    ${RENDERER_DIR}/Direct3D12/Direct3D12ShaderReflection.cpp
)

set(VULKAN_FILES
    ${RENDERER_DIR}/Vulkan/Vulkan.cpp
    ${RENDERER_DIR}/Vulkan/VulkanCapsBuilder.h
    ${RENDERER_DIR}/Vulkan/VulkanConfig.h
    ${RENDERER_DIR}/Vulkan/VulkanRaytracing.cpp
    ${RENDERER_DIR}/Vulkan/VulkanShaderReflection.cpp
)

if(${METAL} MATCHES ON)
    find_library(APPLE_METAL Metal)
    find_library(APPLE_METALKIT MetalKit)
    find_library(APPLE_METALPS MetalPerformanceShaders)

    set(RENDER_LIBRARIES ${RENDER_LIBRARIES}
        ${APPLE_METAL}
        ${APPLE_METALKIT}
        ${APPLE_METALPS}
    )

    set(RENDERER_FILES ${RENDERER_FILES} ${METAL_FILES})
endif()

if(${VULKAN} MATCHES ON)
    find_package(Vulkan REQUIRED)
    if (Vulkan_FOUND MATCHES TRUE)
        message("Vulkan SDK found.")
        set(RENDER_LIBRARIES ${RENDER_LIBRARIES} Vulkan::Vulkan)
    else()
        message("Vulkan SDK not found.  Please make sure it is installed and added to your path.")
    endif()
    
    set(RENDER_LIBRARIES ${RENDER_LIBRARIES}
        VulkanMemoryAllocator
        SpirvTools
    )

    set(RENDERER_FILES ${RENDERER_FILES} ${VULKAN_FILES})
endif()

if(${DX11} MATCHES ON)
    set(RENDER_LIBRARIES ${RENDER_LIBRARIES}
        DirectXShaderCompiler
        "d3d11.lib"
    )
    set(RENDERER_FILES ${RENDERER_FILES} ${DX11_FILES})
endif()

if(${DX12} MATCHES ON)
    set(RENDER_LIBRARIES ${RENDER_LIBRARIES}
        D3D12MemoryAllocator
    )

    set(RENDER_LIBRARIES ${RENDER_LIBRARIES}
        "d3d12.lib"
    )

    set(RENDERER_FILES ${RENDERER_FILES} ${DX12_FILES})
endif()

if(${APPLE_PLATFORM} MATCHES ON)
    find_library(APPLE_APPKIT AppKit)
    find_library(APPLE_QUARTZCORE QuartzCore)
    find_library(APPLE_IOKIT IOKit)

    set(RENDER_LIBRARIES
        ${RENDER_LIBRARIES}
        ${APPLE_QUARTZCORE}
        ${APPLE_APPKIT}
        ${APPLE_IOKIT}
    )
endif()

if(${WINDOWS} MATCHES ON)
    set(RENDER_LIBRARIES ${RENDER_LIBRARIES}
        WinPixEventRuntime
        AGS
        Nvapi
    )

    set(RENDER_LIBRARIES ${RENDER_LIBRARIES}
        "Xinput9_1_0.lib"
        "ws2_32.lib"
    )

    set(RENDER_DEFINES ${RENDER_DEFINES}
        "_WINDOWS"
    )
endif()
