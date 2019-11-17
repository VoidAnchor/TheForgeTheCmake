project(AssetPipeline)

set (ASSET_PIPELINE_FILES 
    ../../The-Forge/Common_3/Tools/AssetPipeline/src/AssetLoader.cpp
    ../../The-Forge/Common_3/Tools/AssetPipeline/src/AssetLoader.h
    ../../The-Forge/Common_3/Tools/AssetPipeline/src/AssetPipeline.cpp
    ../../The-Forge/Common_3/Tools/AssetPipeline/src/AssetPipeline.h
    ../../The-Forge/Common_3/Tools/AssetPipeline/src/gltfpack.cpp
    ../../The-Forge/Common_3/Tools/AssetPipeline/src/gltfpack.h
    ../../The-Forge/Common_3/Tools/AssetPipeline/src/TFXImporter.cpp
    ../../The-Forge/Common_3/Tools/AssetPipeline/src/TFXImporter.h
    ../../The-Forge/Common_3/Tools/AssetPipeline/src/TressFXAsset.cpp
    ../../The-Forge/Common_3/Tools/AssetPipeline/src/TressFXAsset.h
    ../../The-Forge/Common_3/Tools/AssetPipeline/src/TressFXFileFormat.h
)

add_library(AssetPipeline STATIC ${ASSET_PIPELINE_FILES})
target_link_libraries(AssetPipeline assimp MeshOptimizer IrrXML zlibstatic ozz_animation_offline ozz_animation ozz_base)