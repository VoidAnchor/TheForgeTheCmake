project(AssetPipeline)

include(rmem.cmake)
include(minizip.cmake)

set (ASSET_PIPELINE_FILES 
    ../../The-Forge/Common_3/OS/Logging/Log.c
    ../../The-Forge/Common_3/OS/Logging/Log.h
    ../../The-Forge/Common_3/OS/MemoryTracking/MemoryTracking.c
    ../../The-Forge/Common_3/OS/MemoryTracking/NoMemoryDefines.h
    ../../The-Forge/Common_3/OS/Core/Atomics.h
    ../../The-Forge/Common_3/OS/Core/DLL.h
    ../../The-Forge/Common_3/OS/Core/GPUConfig.h
    ../../The-Forge/Common_3/OS/Core/ThreadSystem.cpp
    ../../The-Forge/Common_3/OS/Core/ThreadSystem.h
    ../../The-Forge/Common_3/OS/Core/Timer.c
    ../../The-Forge/Common_3/OS/FileSystem/FileSystem.cpp
    ../../The-Forge/Common_3/OS/FileSystem/SystemRun.cpp
    ../../The-Forge/Common_3/OS/FileSystem/UnixFileSystem.cpp
    ../../The-Forge/Common_3/OS/FileSystem/ZipFileSystem.c
    ../../The-Forge/Common_3/Tools/FileSystem/IToolFileSystem.h
    ../../The-Forge/Common_3/ThirdParty/OpenSource/TressFX/TressFXAsset.cpp
    ../../The-Forge/Common_3/ThirdParty/OpenSource/TressFX/TressFXAsset.h
    ../../The-Forge/Common_3/ThirdParty/OpenSource/TressFX/TressFXFileFormat.h
    ../../The-Forge/Common_3/Tools/AssetPipeline/src/AssetPipeline.cpp
    ../../The-Forge/Common_3/Tools/AssetPipeline/src/AssetPipeline.h
    ../../The-Forge/Common_3/Tools/AssetPipeline/src/AssetPipelineCmd.cpp
    ../../The-Forge/Common_3/ThirdParty/OpenSource/EASTL/eastl.cpp
    ../../The-Forge/Common_3/ThirdParty/OpenSource/basis_universal/transcoder/basisu_transcoder.cpp
    ../../The-Forge/Common_3/ThirdParty/OpenSource/basis_universal/transcoder/basisu_transcoder.h
)

if(${APPLE_PLATFORM} MATCHES ON)
    set(ASSET_PIPELINE_FILES ${ASSET_PIPELINE_FILES}
        ../../The-Forge/Common_3/Tools/FileSystem/CocoaToolsFileSystem.mm
        ../../The-Forge/Common_3/OS/Darwin/macOSAppDelegate.m
        ../../The-Forge/Common_3/OS/Darwin/macOSBase.mm
        ../../The-Forge/Common_3/OS/Darwin/CocoaFileSystem.mm
        ../../The-Forge/Common_3/OS/Darwin/DarwinLog.c
        ../../The-Forge/Common_3/OS/Darwin/DarwinThread.c
    )
endif()

add_executable(AssetPipelineCmd ${ASSET_PIPELINE_FILES} ${RMEM_FILES} ${MINIZIP_FILES})
target_link_libraries(AssetPipelineCmd ozz_animation_offline ozz_animation ozz_base ${GLOBAL_LIBRARIES} ${RENDER_LIBRARIES})
set_property(TARGET AssetPipelineCmd PROPERTY CXX_STANDARD 17)


if (${APPLE_PLATFORM} MATCHES ON)
    set_property (TARGET AssetPipelineCmd APPEND_STRING PROPERTY COMPILE_FLAGS "-fobjc-arc")
endif()
