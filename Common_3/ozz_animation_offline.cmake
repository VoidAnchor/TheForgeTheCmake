set(OZZ_ANIMATION_FILES
    ../The-Forge/Common_3/ThirdParty/OpenSource/ozz-animation/include/ozz/animation/offline/additive_animation_builder.h
    ../The-Forge/Common_3/ThirdParty/OpenSource/ozz-animation/include/ozz/animation/offline/animation_builder.h
    ../The-Forge/Common_3/ThirdParty/OpenSource/ozz-animation/include/ozz/animation/offline/animation_optimizer.h
    ../The-Forge/Common_3/ThirdParty/OpenSource/ozz-animation/include/ozz/animation/offline/raw_animation_utils.h
    ../The-Forge/Common_3/ThirdParty/OpenSource/ozz-animation/include/ozz/animation/offline/raw_animation.h
    ../The-Forge/Common_3/ThirdParty/OpenSource/ozz-animation/include/ozz/animation/offline/raw_skeleton.h
    ../The-Forge/Common_3/ThirdParty/OpenSource/ozz-animation/include/ozz/animation/offline/raw_track.h
    ../The-Forge/Common_3/ThirdParty/OpenSource/ozz-animation/include/ozz/animation/offline/skeleton_builder.h
    ../The-Forge/Common_3/ThirdParty/OpenSource/ozz-animation/include/ozz/animation/offline/track_builder.h
    ../The-Forge/Common_3/ThirdParty/OpenSource/ozz-animation/include/ozz/animation/offline/track_optimizer.h
    ../The-Forge/Common_3/ThirdParty/OpenSource/ozz-animation/src/animation/offline/additive_animation_builder.cc
    ../The-Forge/Common_3/ThirdParty/OpenSource/ozz-animation/src/animation/offline/animation_builder.cc
    ../The-Forge/Common_3/ThirdParty/OpenSource/ozz-animation/src/animation/offline/animation_optimizer.cc
    ../The-Forge/Common_3/ThirdParty/OpenSource/ozz-animation/src/animation/offline/raw_animation_archive.cc
    ../The-Forge/Common_3/ThirdParty/OpenSource/ozz-animation/src/animation/offline/raw_animation_utils.cc
    ../The-Forge/Common_3/ThirdParty/OpenSource/ozz-animation/src/animation/offline/raw_animation.cc
    ../The-Forge/Common_3/ThirdParty/OpenSource/ozz-animation/src/animation/offline/raw_skeleton_archive.cc
    ../The-Forge/Common_3/ThirdParty/OpenSource/ozz-animation/src/animation/offline/raw_skeleton.cc
    ../The-Forge/Common_3/ThirdParty/OpenSource/ozz-animation/src/animation/offline/raw_track.cc
    ../The-Forge/Common_3/ThirdParty/OpenSource/ozz-animation/src/animation/offline/skeleton_builder.cc
    ../The-Forge/Common_3/ThirdParty/OpenSource/ozz-animation/src/animation/offline/track_builder.cc
    ../The-Forge/Common_3/ThirdParty/OpenSource/ozz-animation/src/animation/offline/track_optimizer.cc
)

add_library(ozz_animation_offline STATIC ${OZZ_ANIMATION_FILES})

target_link_libraries(ozz_animation_offline ozz_base)

target_include_directories(ozz_animation_offline PUBLIC ../The-Forge/Common_3/ThirdParty/OpenSource/ozz-animation/include)

set_property(TARGET ozz_animation_offline PROPERTY CXX_STANDARD 17)
