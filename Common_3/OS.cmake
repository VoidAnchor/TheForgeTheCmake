project(The-Forge)

set(OS_PLATFORM_SPECIFIC_FILES "")

source_group(OS\\Camera FILES ${OS_CAMERA_FILES})

source_group(OS\\Core FILES ${OS_CORE_FILES})

source_group(OS\\FileSystem FILES ${OS_FILESYSTEM_FILES})

source_group(OS\\Fonts FILES ${OS_FONT_FILES})
source_group(OS\\Fonts\\Shaders FILES ${OS_FONT_SHADER_FILES})

source_group(OS\\Input FILES ${OS_INPUT_FILES})

source_group(OS\\Interfaces FILES ${OS_INTERFACES_FILES})

source_group(OS\\Logging FILES ${OS_LOGGING_FILES})

source_group(OS\\Math FILES ${OS_MATH_FILES})

source_group(OS\\MemoryTracking FILES ${OS_MEMORYTRACKING_FILES})

source_group(OS\\Middleware FILES ${OS_MIDDLEWARE_FILES})
source_group(OS\\Middleware\\Panini FILES ${OS_MIDDLEWARE_PANINI_SHADER_FILES})

source_group(OS\\Profiler FILES ${OS_PROFILER_FILES})

source_group(OS\\Scripting FILES ${OS_SCRIPTING_FILES})

source_group(OS\\UI FILES ${OS_UI_FILES})
source_group(OS\\UI\\Shaders FILES ${OS_UI_SHADER_FILES})

if (APPLE_PLATFORM MATCHES ON)
    source_group(OS\\macOS FILES ${OS_MACOS_FILES})

    set(OS_PLATFORM_SPECIFIC_FILES ${OS_MACOS_FILES} ${OS_DARWIN_FILES})

    set(CMAKE_CXX_FLAGS "-x objective-c++")
endif()

if (WINDOWS MATCHES ON)
    source_group(OS\\Windows FILES ${OS_WINDOWS_FILES})

    set(OS_PLATFORM_SPECIFIC_FILES ${OS_WINDOWS_FILES})
endif()

add_library(The-Forge-Dependencies STATIC
        ${BASISU_FILES}
        ${EASTL_FILES}
        ${IMGUI_FILES}
        ${LUA_FILES}
        ${MINIZIP_FILES}
        ${RMEM_FILES}
        ${GAINPUT_STATIC_FILES}
)

set_property(TARGET The-Forge-Dependencies PROPERTY CXX_STANDARD 17)

