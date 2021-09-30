add_subdirectory(Tools)


# OS

set(OS_CAMERA_FILES
../The-Forge/Common_3/OS/Camera/CameraController.cpp
)

set(OS_CORE_FILES
    ../The-Forge/Common_3/OS/Core/Atomics.h
    ../The-Forge/Common_3/OS/Core/Compiler.h
    ../The-Forge/Common_3/OS/Core/GPUConfig.h
    ../The-Forge/Common_3/OS/Core/RingBuffer.h
    ../The-Forge/Common_3/OS/Core/Screenshot.cpp
    ../The-Forge/Common_3/OS/Core/ThreadSystem.cpp
    ../The-Forge/Common_3/OS/Core/ThreadSystem.h
    ../The-Forge/Common_3/OS/Core/Timer.c
)

set(OS_FILESYSTEM_FILES
    ../The-Forge/Common_3/OS/FileSystem/FileSystem.cpp
    ../The-Forge/Common_3/OS/FileSystem/SystemRun.cpp
    ../The-Forge/Common_3/OS/FileSystem/ZipFileSystem.c
)

set(OS_FONT_FILES
    ../The-Forge/Common_3/OS/Fonts/FontSystem.cpp
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

set(OS_LOGGING_FILES
    ../The-Forge/Common_3/OS/Logging/Log.c
    ../The-Forge/Common_3/OS/Logging/Log.h
)

set(OS_MATH_FILES
    ../The-Forge/Common_3/OS/Math/MathTypes.h
)

set(OS_MEMORYTRACKING_FILES
    ../The-Forge/Common_3/OS/MemoryTracking/MemoryTracking.c
)

set(OS_MIDDLEWARE_FILES
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
    ../The-Forge/Middelware_3/Animation/Rig.cpp
    ../The-Forge/Middleware_3/Animation/Rig.h
    ../The-Forge/Middleware_3/Animation/SkeletonBatcher.cpp
    ../The-Forge/Middleware_3/Animation/SkeletonBatcher.h
)

set(OS_MIDDLEWARE_PANINI_SHADER_FILES
    ../The-Forge/Middleware_3/PaniniProjection/Shaders/FSL/panini_projection.frag.fsl
    ../The-Forge/Middleware_3/PaniniProjection/Shaders/FSL/panini_projection.vert.fsl
    ../The-Forge/Middleware_3/PaniniProjection/Shaders/FSL/resources.h
)

set(OS_PROFILER_FILES
    ../The-Forge/Common_3/Profiler/GpuProfiler.cpp
    ../The-Forge/Common_3/Profiler/GpuProfiler.h
    ../The-Forge/Common_3/Profiler/ProfilerBase.cpp
    ../The-Forge/Common_3/Profiler/ProfilerBase.h
    ../The-Forge/Common_3/Profiler/ProfilerHTML.h
)

set(OS_SCRIPTING_FILES
    ../The-Forge/Common_3/Scripting/LuaManager.cpp
    ../The-Forge/Common_3/Scripting/LuaManagerImpl.cpp
    ../The-Forge/Common_3/Scripting/LuaSystem.cpp
)

set(OS_UI_FILES
    ../The-Forge/Common_3/UI/UI.cpp
)

set(OS_UI_SHADER_FILES
    ../The-Forge/Common_3/UI/Shaders/FSL/imgui.frag.fsl
    ../The-Forge/Common_3/UI/Shaders/FSL/imgui.verg.fsl
    ../The-Forge/Common_3/UI/Shaders/FSL/textured_mesh.frag.fsl
    ../The-Forge/Common_3/UI/Shaders/FSL/textured_mesh.vert.fsl
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

set(OS_UTILS_FILES
    ../The-Forge/Common_3/ThirdParty/OpenSource/EASTL/EASTL.natvis
)

set(RMEM_FILES
    ../The-Forge/Common_3/ThirdParty/OpenSource/rmem/src/rmem_get_module_info.cpp
    ../The-Forge/Common_3/ThirdParty/OpenSource/rmem/src/rmem_hook.cpp
    ../The-Forge/Common_3/ThirdParty/OpenSource/rmem/src/rmem_lib.cpp
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

set(IMGUI_FILES
    ../The-Forge/Common_3/ThirdParty/OpenSource/imgui/imconfig.h
    ../The-Forge/Common_3/ThirdParty/OpenSource/imgui/imgui_demo.cpp
    ../The-Forge/Common_3/ThirdParty/OpenSource/imgui/imgui_draw.cpp
    ../The-Forge/Common_3/ThirdParty/OpenSource/imgui/imgui_internal.h
    ../The-Forge/Common_3/ThirdParty/OpenSource/imgui/imgui_widgets.cpp
    ../The-Forge/Common_3/ThirdParty/OpenSource/imgui/imgui.cpp
    ../The-Forge/Common_3/ThirdParty/OpenSource/imgui/imgui.h
)

set(GAINPUT_STATIC_FILES
    ../The-Forge/Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/gainput.cpp
    ../The-Forge/Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/GainputAllocator.cpp
    ../The-Forge/Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/gestures/GainputButtonStickGesture.cpp
    ../The-Forge/Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/dev/GainputDev.cpp
    ../The-Forge/Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/gestures/GainputDoubleClickGesture.cpp
    ../The-Forge/Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/gestures/GainputHoldGesture.cpp
    ../The-Forge/Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/GainputInputDeltaState.cpp
    ../The-Forge/Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/GainputInputDevice.cpp
    ../The-Forge/Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/builtin/GainputInputDeviceBuiltIn.cpp
    ../The-Forge/Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/keyboard/GainputInputDeviceKeyboard.cpp
    ../The-Forge/Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/mouse/GainputInputDeviceMouse.cpp
    ../The-Forge/Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/pad/GainputInputDevicePad.cpp
    ../The-Forge/Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/touch/GainputInputDeviceTouch.cpp
    ../The-Forge/Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/GainputInputManager.cpp
    ../The-Forge/Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/GainputInputMap.cpp
    ../The-Forge/Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/recorder/GainputInputPlayer.cpp
    ../The-Forge/Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/recorder/GainputInputRecorder.cpp
    ../The-Forge/Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/recorder/GainputInputRecording.cpp
    ../The-Forge/Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/GainputInputState.cpp
    ../The-Forge/Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/GainputMapFilters.cpp
    ../The-Forge/Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/dev/GainputMemoryStream.cpp
    ../The-Forge/Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/gestures/GainputPinchGesture.cpp
    ../The-Forge/Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/gestures/GainputRotateGesture.cpp
    ../The-Forge/Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/gestures/GainputSimultaneouslyDownGesture.cpp
    ../The-Forge/Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/gestures/GainputTapGesture.cpp
)

include(TheForge.cmake)
