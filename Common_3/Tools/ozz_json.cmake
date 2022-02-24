set(OZZ_JSON_FILES
    ../../The-Forge/Common_3/ThirdParty/OpenSource/ozz-animation/src/animation/offline/additive_animation_builder.cc
    ../../The-Forge/Common_3/ThirdParty/OpenSource/ozz-animation/src/animation/offline/raw_animation_utils.cc
    ../../The-Forge/Common_3/ThirdParty/OpenSource/ozz-animation/src/animation/offline/raw_animation.cc
    ../../The-Forge/Common_3/ThirdParty/OpenSource/ozz-animation/src/animation/offline/skeleton_builder.cc
    ../../The-Forge/Common_3/ThirdParty/OpenSource/ozz-animation/src/animation/offline/raw_track.cc
    ../../The-Forge/Common_3/ThirdParty/OpenSource/ozz-animation/src/animation/offline/raw_skeleton.cc
    ../../The-Forge/Common_3/ThirdParty/OpenSource/ozz-animation/src/animation/offline/track_optimizer.cc
    ../../The-Forge/Common_3/ThirdParty/OpenSource/ozz-animation/src/animation/offline/animation_optimizer.cc
    ../../The-Forge/Common_3/ThirdParty/OpenSource/ozz-animation/src/animation/offline/raw_animation_archive.cc
    ../../The-Forge/Common_3/ThirdParty/OpenSource/ozz-animation/src/animation/offline/animation_builder.cc
    ../../The-Forge/Common_3/ThirdParty/OpenSource/ozz-animation/src/animation/offline/raw_skeleton_archive.cc
    ../../The-Forge/Common_3/ThirdParty/OpenSource/ozz-animation/src/animation/offline/animation_builder.cc
    ../../The-Forge/Common_3/ThirdParty/OpenSource/ozz-animation/src/animation/offline/raw_skeleton_archive.cc
    ../../The-Forge/Common_3/ThirdParty/OpenSource/ozz-animation/src/animation/offline/track_builder.cc
)

add_library(ozz_json STATIC ${OZZ_JSON_FILES})
target_include_directories(ozz_json PUBLIC ../../The-Forge/Common_3/ThirdParty/OpenSource/ozz-animation/include)

set_property(TARGET ozz_json PROPERTY CXX_STANDARD 17)
