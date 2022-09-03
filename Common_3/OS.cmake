# OS Files
set(OS_ANDROID_FILES
    ../The-Forge/Common_3/OS/Android/android_native_app_glue.c
    ../The-Forge/Common_3/OS/Android/AndroidBase.cpp
    ../The-Forge/Common_3/OS/Android/AndroidFileSystem.cpp
    ../The-Forge/Common_3/OS/Android/AndroidLog.c
    ../The-Forge/Common_3/OS/Android/AndroidThread.c
    ../The-Forge/Common_3/OS/Android/AndroidTime.c
)

set(OS_CAMERA_FILES
    ../The-Forge/Common_3/OS/Camera/CameraController.cpp
)

set(OS_CORE_FILES
    ../The-Forge/Common_3/OS/Core/Atomics.h
    ../The-Forge/Common_3/OS/Core/GPUConfig.h
    ../The-Forge/Common_3/OS/Core/RingBuffer.h
    ../The-Forge/Common_3/OS/Core/Config.h
    ../The-Forge/Common_3/OS/Core/DLL.h
    ../The-Forge/Common_3/OS/Core/RingBuffer.h
    ../The-Forge/Common_3/OS/Core/Screenshot.cpp
    ../The-Forge/Common_3/OS/Core/TextureContainers.h
    ../The-Forge/Common_3/OS/Core/ThreadSystem.cpp
    ../The-Forge/Common_3/OS/Core/ThreadSystem.h
    ../The-Forge/Common_3/OS/Core/Timer.c
    ../The-Forge/Common_3/OS/Core/UnixThreadID.h
    ../The-Forge/Common_3/OS/Core/CPUConfig.cpp
)

set(OS_FILESYSTEM_FILES
    ../The-Forge/Common_3/OS/FileSystem/FileSystem.cpp
    ../The-Forge/Common_3/OS/FileSystem/SystemRun.cpp
    ../The-Forge/Common_3/OS/FileSystem/ZipFileSystem.c
)

set(OS_FONT_FILES
    ../The-Forge/Common_3/OS/Fonts/FontSystem.cpp
    ../The-Forge/Common_3/OS/Fonts/stbtt.cpp
)

set(OS_FONT_SHADER_FILES
    ../The-Forge/Common_3/OS/Fonts/Shaders/FSL/fontstash.frag.fsl
    ../The-Forge/Common_3/OS/Fonts/Shaders/FSL/fontstash2D.vert.fsl
    ../The-Forge/Common_3/OS/Fonts/Shaders/FSL/fontstash3D.vert.fsl
    ../The-Forge/Common_3/OS/Fonts/Shaders/FSL/resources.h
)

set(OS_INPUT_FILES
    ../The-Forge/Common_3/OS/Input/InputSystem.cpp
)

set(OS_INTERFACES_FILES
    ../The-Forge/Common_3/OS/Interfaces/IApp.h
    ../The-Forge/Common_3/OS/Interfaces/ICameraController.h
    ../The-Forge/Common_3/OS/Interfaces/IFileSystem.h
    ../The-Forge/Common_3/OS/Interfaces/IFont.h
    ../The-Forge/Common_3/OS/Interfaces/IInput.h
    ../The-Forge/Common_3/OS/Interfaces/ILog.h
    ../The-Forge/Common_3/OS/Interfaces/IMemory.h
    ../The-Forge/Common_3/OS/Interfaces/IMiddleware.h
    ../The-Forge/Common_3/OS/Interfaces/IOperatingSystem.h
    ../The-Forge/Common_3/OS/Interfaces/IProfiler.h
    ../The-Forge/Common_3/OS/Interfaces/IScreenshot.h
    ../The-Forge/Common_3/OS/Interfaces/IScripting.h
    ../The-Forge/Common_3/OS/Interfaces/IThread.h
    ../The-Forge/Common_3/OS/Interfaces/ITime.h
    ../The-Forge/Common_3/OS/Interfaces/IUI.h
)

set(OS_LINUX_FILES
    ../The-Forge/Common_3/OS/Linux/LinuxBase.cpp
    ../The-Forge/Common_3/OS/Linux/LinuxFileSystem.cpp
    ../The-Forge/Common_3/OS/Linux/LinuxLog.cpp
    ../The-Forge/Common_3/OS/Linux/LinuxThread.cpp
    ../The-Forge/Common_3/OS/Linux/LinuxTime.cpp
)

set(OS_LOGGING_FILES
    ../The-Forge/Common_3/OS/Logging/Log.c
    ../The-Forge/Common_3/OS/Logging/Log.h
)

set(OS_MATH_FILES
    ../The-Forge/Common_3/OS/Math/MathTypes.h
    ../The-Forge/Common_3/OS/Math/RTree.h
)

set(OS_MEMORYTRACKING_FILES
    ../The-Forge/Common_3/OS/MemoryTracking/MemoryTracking.c
    ../The-Forge/Common_3/OS/MemoryTracking/NoMemoryDefines.h
)

set(OS_PROFILER_FILES
    ../The-Forge/Common_3/OS/Profiler/GpuProfiler.cpp
    ../The-Forge/Common_3/OS/Profiler/GpuProfiler.h
    ../The-Forge/Common_3/OS/Profiler/ProfilerBase.cpp
    ../The-Forge/Common_3/OS/Profiler/ProfilerBase.h
    ../The-Forge/Common_3/OS/Profiler/ProfilerHTML.h
)

set(OS_QUEST_FILES
    ../The-Forge/Common_3/OS/Quest/VrApi.cpp
    ../The-Forge/Common_3/OS/Quest/VrApi.h
)

set(OS_MIDDLEWARE_PANINI_SHADER_FILES
    ../The-Forge/Middleware_3/PaniniProjection/Shaders/FSL/panini_projection.frag.fsl
    ../The-Forge/Middleware_3/PaniniProjection/Shaders/FSL/panini_projection.vert.fsl
    ../The-Forge/Middleware_3/PaniniProjection/Shaders/FSL/resources.h
)

set(OS_SCRIPTING_FILES
    ../The-Forge/Common_3/OS/Scripting/LuaManager.cpp
    ../The-Forge/Common_3/OS/Scripting/LuaManager.h
    ../The-Forge/Common_3/OS/Scripting/LuaManagerCommon.h
    ../The-Forge/Common_3/OS/Scripting/LuaManagerImpl.cpp
    ../The-Forge/Common_3/OS/Scripting/LuaManagerImpl.h
    ../The-Forge/Common_3/OS/Scripting/LuaSystem.cpp
    ../The-Forge/Common_3/OS/Scripting/LunaV.hpp
)

set(OS_UI_FILES
    ../The-Forge/Common_3/OS/UI/UI.cpp
)

set(OS_UI_SHADER_FILES
    ../The-Forge/Common_3/OS/UI/Shaders/FSL/imgui.frag.fsl
    ../The-Forge/Common_3/OS/UI/Shaders/FSL/imgui.vert.fsl
    ../The-Forge/Common_3/OS/UI/Shaders/FSL/textured_mesh.frag.fsl
    ../The-Forge/Common_3/OS/UI/Shaders/FSL/textured_mesh.vert.fsl
)

set(OS_WINDOWS_FILES
    ../The-Forge/Common_3/OS/Windows/WindowsBase.cpp
    ../The-Forge/Common_3/OS/Windows/WindowsFileSystem.cpp
    ../The-Forge/Common_3/OS/Windows/WindowsLog.c
    ../The-Forge/Common_3/OS/Windows/WindowsStackTraceDump.cpp
    ../The-Forge/Common_3/OS/Windows/WindowsStackTraceDump.h
    ../The-Forge/Common_3/OS/Windows/WindowsThread.c
    ../The-Forge/Common_3/OS/Windows/WindowsTime.c
)

set(OS_DARWIN_FILES
    ../The-Forge/Common_3/OS/Darwin/CocoaFileSystem.mm
    ../The-Forge/Common_3/OS/Darwin/DarwinLog.c
    ../The-Forge/Common_3/OS/Darwin/DarwinThread.c
    ../The-Forge/Common_3/OS/FileSystem/UnixFileSystem.cpp
)

set(OS_MACOS_FILES 
    ../The-Forge/Common_3/OS/Darwin/macOSBase.mm
    ../The-Forge/Common_3/OS/Darwin/macOSAppDelegate.m
    ../The-Forge/Common_3/OS/Darwin/macOSAppDelegate.h
    ../The-Forge/Common_3/OS/Darwin/macOSWindow.mm
)

set(OS_UTILS_FILES
    ../The-Forge/Common_3/ThirdParty/OpenSource/EASTL/EASTL.natvis
)

set(OS_MIDDLEWARE_ANIMATION_FILES
    ../The-Forge/Middleware_3/Animation/AnimatedObject.cpp
    ../The-Forge/Middleware_3/Animation/AnimatedObject.h
    ../The-Forge/Middleware_3/Animation/Animation.cpp
    ../The-Forge/Middleware_3/Animation/Animation.h
    ../The-Forge/Middleware_3/Animation/Clip.cpp
    ../The-Forge/Middleware_3/Animation/Clip.h
    ../The-Forge/Middleware_3/Animation/ClipController.cpp
    ../The-Forge/Middleware_3/Animation/ClipController.h
    ../The-Forge/Middleware_3/Animation/ClipMask.cpp
    ../The-Forge/Middleware_3/Animation/ClipMask.h
    ../The-Forge/Middleware_3/Animation/Rig.cpp
    ../The-Forge/Middleware_3/Animation/Rig.h
    ../The-Forge/Middleware_3/Animation/SkeletonBatcher.cpp
    ../The-Forge/Middleware_3/Animation/SkeletonBatcher.h
)

set(OS_MIDDLEWARE_PARALLEL_PRIMS_FILES
    ../The-Forge/Middleware_3/ParallelPrimitives/ParallelPrimitives.cpp
    ../The-Forge/Middleware_3/ParallelPrimitives/ParallelPrimitives.h
)

set(OS_WINDOWSYSTEM_FILES
    ../The-Forge/Common_3/OS/WindowSystem/WindowSystem.cpp
)

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
source_group(OS\\Profiler FILES ${OS_PROFILER_FILES})
source_group(OS\\Scripting FILES ${OS_SCRIPTING_FILES})
source_group(OS\\UI FILES ${OS_UI_FILES})
source_group(OS\\UI\\Shaders FILES ${OS_UI_SHADER_FILES})
source_group(OS\\WindowSystem FILES ${OS_WINDOWSYSTEM_FILES})
source_group(Middleware_3\\Animation FILES ${OS_MIDDLEWARE_ANIMATION_FILES})
source_group(Middleware_3\\ParallelPrimitives FILES ${OS_MIDDLEWARE_PARALLEL_PRIMS_FILES})

if (${APPLE_PLATFORM} MATCHES ON)
    source_group(OS\\macOS FILES ${OS_MACOS_FILES} ${OS_DARWIN_FILES})

    set(OS_PLATFORM_SPECIFIC_FILES ${OS_MACOS_FILES} ${OS_DARWIN_FILES})
    set(GAINPUT_STATIC_FILES ${GAINPUT_STATIC_FILES} ${GAINPUT_MACOS_FILES})
    set(CMAKE_CXX_FLAGS "-x objective-c++")
endif()

if (WINDOWS MATCHES ON)
    source_group(OS\\Windows FILES ${OS_WINDOWS_FILES})

    set(OS_PLATFORM_SPECIFIC_FILES ${OS_WINDOWS_FILES})
endif()

