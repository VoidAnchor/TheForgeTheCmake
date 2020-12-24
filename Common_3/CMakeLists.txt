add_subdirectory(Tools)

set(OS_INTERFACES_FILES
    ../The-Forge/Common_3/OS/Interfaces/IApp.h
    ../The-Forge/Common_3/OS/Interfaces/ICameraController.h
    ../The-Forge/Common_3/OS/Interfaces/IFileSystem.h
    ../The-Forge/Common_3/OS/Interfaces/IInput.h
    ../The-Forge/Common_3/OS/Interfaces/ILog.h
    ../The-Forge/Common_3/OS/Interfaces/IMemory.h
    ../The-Forge/Common_3/OS/Interfaces/IMiddleware.h
    ../The-Forge/Common_3/OS/Interfaces/IOperatingSystem.h
    ../The-Forge/Common_3/OS/Interfaces/IProfiler.h
    ../The-Forge/Common_3/OS/Interfaces/IScreenshot.h
    ../The-Forge/Common_3/OS/Interfaces/IThread.h
    ../The-Forge/Common_3/OS/Interfaces/ITime.h
)

set(OS_INPUT_FILES
    ../The-Forge/Common_3/OS/Input/InputSystem.cpp
)

set(OS_FILESYSTEM_FILES
    ../The-Forge/Common_3/OS/FileSystem/FileSystem.cpp
    ../The-Forge/Common_3/OS/FileSystem/SystemRun.cpp
)

set(OS_CORE_FILES
    ../The-Forge/Common_3/OS/Core/Atomics.h
    ../The-Forge/Common_3/OS/Core/Compiler.h
    ../The-Forge/Common_3/OS/Core/GPUConfig.h
    ../The-Forge/Common_3/OS/Core/RingBuffer.h
    ../The-Forge/Common_3/OS/Core/Screenshot.cpp
    ../The-Forge/Common_3/OS/Core/ThreadSystem.cpp
    ../The-Forge/Common_3/OS/Core/ThreadSystem.h
    ../The-Forge/Common_3/OS/Core/Timer.cpp
)

set(OS_MEMORYMANAGER_FILES
    ../The-Forge/Common_3/OS/MemoryTracking/MemoryTracking.cpp
)

set(OS_CAMERA_FILES
    ../The-Forge/Common_3/OS/Camera/CameraController.cpp
)

set(OS_MATH_FILES
    ../The-Forge/Common_3/OS/Math/MathTypes.h
)

set(RENDERER_FILES
    ../The-Forge/Common_3/Renderer/IRay.h
    ../The-Forge/Common_3/Renderer/CommonShaderReflection.cpp
    ../The-Forge/Common_3/Renderer/IRenderer.h
    ../The-Forge/Common_3/Renderer/IShaderReflection.h
    ../The-Forge/Common_3/Renderer/IResourceLoader.h
    ../The-Forge/Common_3/Renderer/ResourceLoader.cpp
    ../The-Forge/Common_3/ThirdParty/OpenSource/ags/AgsHelper.h
    ../The-Forge/Common_3/ThirdParty/OpenSource/nvapi/NvApiHelper.h
)

set(LOGGING_FILES
    ../The-Forge/Common_3/OS/Logging/Log.cpp
    ../The-Forge/Common_3/OS/Logging/Log.h
)

set(THIRDPARTY_OSS_EASTL_FILES
    ../The-Forge/Common_3/ThirdParty/OpenSource/EASTL/assert.cpp
    ../The-Forge/Common_3/ThirdParty/OpenSource/EASTL/allocator_forge.cpp
    ../The-Forge/Common_3/ThirdParty/OpenSource/EASTL/fixed_pool.cpp
    ../The-Forge/Common_3/ThirdParty/OpenSource/EASTL/hashtable.cpp
    ../The-Forge/Common_3/ThirdParty/OpenSource/EASTL/intrusive_list.cpp
    ../The-Forge/Common_3/ThirdParty/OpenSource/EASTL/numeric_limits.cpp
    ../The-Forge/Common_3/ThirdParty/OpenSource/EASTL/red_black_tree.cpp
    ../The-Forge/Common_3/ThirdParty/OpenSource/EASTL/string.cpp
    ../The-Forge/Common_3/ThirdParty/OpenSource/EASTL/thread_support.cpp
    ../The-Forge/Common_3/ThirdParty/OpenSource/EASTL/EAStdC/EAMemory.cpp
    ../The-Forge/Common_3/ThirdParty/OpenSource/EASTL/EAStdC/EASprintf.cpp
)

set(THIRDPARTY_OSS_TINYEXR_FILES
    ../The-Forge/Common_3/ThirdParty/OpenSource/TinyEXR/tinyexr.cpp
    ../The-Forge/Common_3/ThirdParty/OpenSource/TinyEXR/tinyexr.h
)

set(MIDDLEWARE_ANIMATION_FILES
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

set(MIDDLEWARE_TEXT_FILES
    ../The-Forge/Middleware_3/Text/Fontstash.cpp
    ../The-Forge/Middleware_3/Text/Fontstash.h
)

set(MIDDLEWARE_ECS_FILES
    ../The-Forge/Middleware_3/ECS/BaseComponent.cpp
    ../The-Forge/Middleware_3/ECS/BaseComponent.h
    ../The-Forge/Middleware_3/ECS/ComponentRepresentation.cpp
    ../The-Forge/Middleware_3/ECS/ComponentRepresentation.h
    ../The-Forge/Middleware_3/ECS/EntityManager.cpp
    ../The-Forge/Middleware_3/ECS/EntityManager.h
)

set(MIDDLEWARE_UI_FILES
    ../The-Forge/Middleware_3/UI/ImguiGUIDriver.cpp
    ../The-Forge/Middleware_3/UI/AppUI.cpp
    ../The-Forge/Middleware_3/UI/AppUI.h
    ../The-Forge/Common_3/ThirdParty/OpenSource/imgui/imconfig.h
    ../The-Forge/Common_3/ThirdParty/OpenSource/imgui/imgui_demo.cpp
    ../The-Forge/Common_3/ThirdParty/OpenSource/imgui/imgui_draw.cpp
    ../The-Forge/Common_3/ThirdParty/OpenSource/imgui/imgui_internal.h
    ../The-Forge/Common_3/ThirdParty/OpenSource/imgui/imgui_widgets.cpp
    ../The-Forge/Common_3/ThirdParty/OpenSource/imgui/imgui.cpp
    ../The-Forge/Common_3/ThirdParty/OpenSource/imgui/imgui.h
)

include(TheForge.cmake)
