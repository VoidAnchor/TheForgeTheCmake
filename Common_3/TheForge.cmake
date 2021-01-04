project(The-Forge)

set(OS_PLATFORM_SPECIFIC_FILES "")

source_group(OS\\Interfaces FILES ${OS_INTERFACES_FILES})

source_group(OS\\Input FILES ${OS_INPUT_FILES})

source_group(OS\\FileSystem FILES ${OS_FILESYSTEM_FILES})

source_group(OS\\MemoryManager FILES ${OS_MEMORYMANAGER_FILES})

source_group(OS\\Camera FILES ${OS_CAMERA_FILES})

source_group(OS\\Math FILES ${OS_MATH_FILES})

set(OS_IMAGE_FILES
        ../The-Forge/Common_3/ThirdParty/OpenSource/basis_universal/transcoder/basisu_transcoder.cpp
        )

source_group(OS\\Image FILES ${OS_IMAGE_FILES})

set(OS_MACOS_FILES
        ../The-Forge/Common_3/OS/macOS/macOSBase.mm
        ../The-Forge/Common_3/OS/macOS/macOSFileSystem.mm
        ../The-Forge/Common_3/OS/macOS/macOSLog.cpp
        ../The-Forge/Common_3/OS/macOS/macOSThread.cpp
        )

if (APPLE_PLATFORM MATCHES ON)
    source_group(OS\\macOS FILES ${OS_MACOS_FILES})

    set(OS_PLATFORM_SPECIFIC_FILES ${OS_MACOS_FILES})

    set(RENDERER_FILES ${RENDERER_FILES}
            ../The-Forge/Common_3/Renderer/Metal/MetalRaytracing.mm
            ../The-Forge/Common_3/Renderer/Metal/MetalMemoryAllocator.h
            ../The-Forge/Common_3/Renderer/Metal/MetalRenderer.mm
            ../The-Forge/Common_3/Renderer/Metal/MetalShaderReflection.mm
            )

    set(CMAKE_CXX_FLAGS "-x objective-c++")
endif()

set(OS_WINDOWS_FILES
        ../The-Forge/Common_3/OS/Windows/WindowsBase.cpp
        ../The-Forge/Common_3/OS/Windows/WindowsFileSystem.cpp
        ../The-Forge/Common_3/OS/Windows/WindowsLog.cpp
        ../The-Forge/Common_3/OS/Windows/WindowsStackTraceDump.cpp
        ../The-Forge/Common_3/OS/Windows/WindowsStackTraceDump.h
        ../The-Forge/Common_3/OS/Windows/WindowsThread.cpp
        ../The-Forge/Common_3/OS/Windows/WindowsTime.cpp
        )

if (WINDOWS MATCHES ON)
    source_group(OS\\Windows FILES ${OS_WINDOWS_FILES})

    set(OS_PLATFORM_SPECIFIC_FILES ${OS_WINDOWS_FILES})

    set(RENDERER_FILES ${RENDERER_FILES}
            ../The-Forge/Common_3/Renderer/Vulkan/Vulkan.cpp
            ../The-Forge/Common_3/Renderer/Vulkan/VulkanCapsBuilder.h
            ../The-Forge/Common_3/Renderer/Vulkan/VulkanRaytracing.cpp
            ../The-Forge/Common_3/Renderer/Vulkan/VulkanShaderReflection.cpp
            )
endif()

source_group(Renderer FILES ${RENDERER_FILES})

source_group(Logging FILES ${LOGGING_FILES})

source_group(Core FILES ${CORE_FILES})

source_group(ThirdParty\\OpenSource\\EASTL FILES ${THIRDPARTY_OSS_EASTL_FILES})

source_group(ThirdParty\\OpenSource\\TinyEXR FILES ${THIRDPARTY_OSS_TINYEXR_FILES})

source_group(Middleware_3\\ECS FILES ${MIDDLEWARE_ECS_FILES})

source_group(Middleware_3\\UI FILES ${MIDDLEWARE_UI_FILES})

add_library(The-Forge STATIC
        ${OS_INTERFACES_FILES}
        ${OS_INPUT_FILES}
        ${OS_FILESYSTEM_FILES}
        ${OS_MEMORYMANAGER_FILES}
        ${OS_CAMERA_FILES}
        ${OS_MATH_FILES}
        ${OS_IMAGE_FILES}
        ${OS_PLATFORM_SPECIFIC_FILES}
        ${RENDERER_FILES}
        ${THIRDPARTY_OSS_EASTL_FILES}
        ${THIRDPARTY_OSS_TINYEXR_FILES}
        ${LOGGING_FILES}
        ${OS_CORE_FILES}
        ${MIDDLEWARE_ECS_FILES}
        ${MIDDLEWARE_UI_FILES}
        ${RMEM_FILES}
        ${GAINPUT_STATIC_FILES}
        )

set_property(TARGET The-Forge PROPERTY CXX_STANDARD 17)

target_link_libraries(The-Forge ${RENDER_LIBRARIES} ${GLOBAL_LIBRARIES})
target_include_directories(The-Forge PUBLIC ${RENDER_INCLUDES})

target_compile_definitions(The-Forge PUBLIC ${GLOBAL_DEFINES})

if (APPLE_PLATFORM MATCHES ON)
    set_property (TARGET The-Forge APPEND_STRING PROPERTY COMPILE_FLAGS "-fobjc-arc")
endif()
