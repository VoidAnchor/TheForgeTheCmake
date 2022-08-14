project(AssetPipeline)

set (ASSET_PIPELINE_FILES
    ../The-Forge/Common_3/Tools/FileSystem/IToolFileSystem.h
    ../The-Forge/Common_3/ThirdParty/OpenSource/TressFX/TressFXAsset.cpp
    ../The-Forge/Common_3/ThirdParty/OpenSource/TressFX/TressFXAsset.h
    ../The-Forge/Common_3/ThirdParty/OpenSource/TressFX/TressFXFileFormat.h
    ../The-Forge/Common_3/Tools/AssetPipeline/src/AssetPipeline.cpp
    ../The-Forge/Common_3/Tools/AssetPipeline/src/AssetPipeline.h
    ../The-Forge/Common_3/Tools/AssetPipeline/src/AssetPipelineCmd.cpp
    ../The-Forge/Common_3/ThirdParty/OpenSource/EASTL/eastl.cpp
)

if(${APPLE_PLATFORM} MATCHES ON)
    set(ASSET_PIPELINE_FILES ${ASSET_PIPELINE_FILES}
        ../The-Forge/Common_3/Tools/FileSystem/CocoaToolsFileSystem.mm
    )
endif()

if(${WINDOWS} MATCHES ON)
    set(ASSET_PIPELINE_FILES ${ASSET_PIPELINE_FILES}
        ../The-Forge/Common_3/Tools/FileSystem/WindowsToolsFileSystem.cpp
    )
endif()

if(${LINUX} MATCHES ON)
    set(ASSET_PIPELINE_FILES ${ASSET_PIPELINE_FILES}
        ../The-Forge/Common_3/Tools/FileSystem/LinuxToolsFileSystem.cpp
    )
endif()

add_executable(AssetPipelineCmd ${ASSET_PIPELINE_FILES})
target_link_libraries(AssetPipelineCmd ozz_animation_offline ozz_animation ozz_base The-Forge ${RENDER_LIBRARIES})
set_property(TARGET AssetPipelineCmd PROPERTY CXX_STANDARD 17)


if (${APPLE_PLATFORM} MATCHES ON)
    set_property (TARGET AssetPipelineCmd APPEND_STRING PROPERTY COMPILE_FLAGS "-fobjc-arc")
endif()
