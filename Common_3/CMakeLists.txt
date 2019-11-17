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
    ../The-Forge/Common_3/OS/Interfaces/IThread.h
    ../The-Forge/Common_3/OS/Interfaces/ITime.h
)

set(OS_INPUT_FILES
    ../The-Forge/Common_3/OS/Input/InputSystem.cpp
)

set(OS_FILESYSTEM_FILES
    ../The-Forge/Common_3/OS/Core/FileSystem.cpp
    ../The-Forge/Common_3/OS/Core/RingBuffer.h
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

set(OS_IMAGE_FILES
    ../The-Forge/Common_3/OS/Image/Image.cpp
    ../The-Forge/Common_3/OS/Image/Image.h
    ../The-Forge/Common_3/OS/Image/ImageHelper.h
)

set(RENDERER_FILES
    ../The-Forge/Common_3/ThirdParty/OpenSource/MicroProfile/ProfilerWidgetsUI.cpp
    ../The-Forge/Common_3/ThirdParty/OpenSource/MicroProfile/ProfilerWidgetsUI.h
    ../The-Forge/Common_3/ThirdParty/OpenSource/MicroProfile/Profiler.cpp
    ../The-Forge/Common_3/ThirdParty/OpenSource/MicroProfile/ProfilerBase.cpp
    ../The-Forge/Common_3/ThirdParty/OpenSource/MicroProfile/ProfilerBase.h
    ../The-Forge/Common_3/ThirdParty/OpenSource/MicroProfile/ProfilerHTML.h
    ../The-Forge/Common_3/Renderer/IRay.h
    ../The-Forge/Common_3/Renderer/CommonShaderReflection.cpp
    ../The-Forge/Common_3/Renderer/GpuProfiler.cpp
    ../The-Forge/Common_3/Renderer/GpuProfiler.h
    ../The-Forge/Common_3/Renderer/IRenderer.h
    ../The-Forge/Common_3/Renderer/IShaderReflection.h
    ../The-Forge/Common_3/Renderer/ResourceLoader.cpp
    ../The-Forge/Common_3/Renderer/ResourceLoader.h
)

set(LOGGING_FILES
    ../The-Forge/Common_3/OS/Logging/Log.cpp
    ../The-Forge/Common_3/OS/Logging/Log.h
)

set(CORE_FILES
    ../The-Forge/Common_3/OS/Core/ThreadSystem.cpp
    ../The-Forge/Common_3/OS/Core/Timer.cpp
)

set(THIRDPARTY_OSS_EASTL_FILES
    ../The-Forge/Common_3/ThirdParty/OpenSource/EASTL/assert.cpp
    ../The-Forge/Common_3/ThirdParty/OpenSource/EASTL/allocator_eastl.cpp
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

set(MIDDLEWARE_ECS_FILES
    ../The-Forge/Middleware_3/ECS/BaseComponent.cpp
    ../The-Forge/Middleware_3/ECS/BaseComponent.h
    ../The-Forge/Middleware_3/ECS/ComponentRepresentation.cpp
    ../The-Forge/Middleware_3/ECS/ComponentRepresentation.h
    ../The-Forge/Middleware_3/ECS/EntityManager.cpp
    ../The-Forge/Middleware_3/ECS/EntityManager.h
)

set(MIDDLEWARE_TEXT_FILES
    ../The-Forge/Middleware_3/Text/Fontstash.cpp
    ../The-Forge/Middleware_3/Text/Fontstash.h
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
