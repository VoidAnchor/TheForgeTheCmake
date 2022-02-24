set(OZZ_ANIMATION_FILES
    ../The-Forge/Common_3/ThirdParty/OpenSource/ozz-animation/include/ozz/animation/runtime/ik_aim_job.h
    ../The-Forge/Common_3/ThirdParty/OpenSource/ozz-animation/include/ozz/animation/runtime/ik_two_bone_job.h
    ../The-Forge/Common_3/ThirdParty/OpenSource/ozz-animation/include/ozz/animation/runtime/animation.h
    ../The-Forge/Common_3/ThirdParty/OpenSource/ozz-animation/include/ozz/animation/runtime/blending_job.h
    ../The-Forge/Common_3/ThirdParty/OpenSource/ozz-animation/include/ozz/animation/runtime/local_to_model_job.h
    ../The-Forge/Common_3/ThirdParty/OpenSource/ozz-animation/include/ozz/animation/runtime/sampling_job.h
    ../The-Forge/Common_3/ThirdParty/OpenSource/ozz-animation/include/ozz/animation/runtime/skeleton.h
    ../The-Forge/Common_3/ThirdParty/OpenSource/ozz-animation/include/ozz/animation/runtime/skeleton_utils.h
    ../The-Forge/Common_3/ThirdParty/OpenSource/ozz-animation/include/ozz/animation/runtime/track.h
    ../The-Forge/Common_3/ThirdParty/OpenSource/ozz-animation/include/ozz/animation/runtime/track_sampling_job.h
    ../The-Forge/Common_3/ThirdParty/OpenSource/ozz-animation/include/ozz/animation/runtime/track_triggering_job.h
    ../The-Forge/Common_3/ThirdParty/OpenSource/ozz-animation/include/ozz/animation/runtime/track_triggering_job_stl.h
    ../The-Forge/Common_3/ThirdParty/OpenSource/ozz-animation/src/animation/runtime/animation_keyframe.h
    ../The-Forge/Common_3/ThirdParty/OpenSource/ozz-animation/src/animation/runtime/ik_aim_job.cc
    ../The-Forge/Common_3/ThirdParty/OpenSource/ozz-animation/src/animation/runtime/ik_two_bone_job.cc
    ../The-Forge/Common_3/ThirdParty/OpenSource/ozz-animation/src/animation/runtime/animation.cc
    ../The-Forge/Common_3/ThirdParty/OpenSource/ozz-animation/src/animation/runtime/blending_job.cc
    ../The-Forge/Common_3/ThirdParty/OpenSource/ozz-animation/src/animation/runtime/local_to_model_job.cc
    ../The-Forge/Common_3/ThirdParty/OpenSource/ozz-animation/src/animation/runtime/sampling_job.cc
    ../The-Forge/Common_3/ThirdParty/OpenSource/ozz-animation/src/animation/runtime/skeleton.cc
    ../The-Forge/Common_3/ThirdParty/OpenSource/ozz-animation/src/animation/runtime/skeleton_utils.cc
    ../The-Forge/Common_3/ThirdParty/OpenSource/ozz-animation/src/animation/runtime/track.cc
    ../The-Forge/Common_3/ThirdParty/OpenSource/ozz-animation/src/animation/runtime/track_sampling_job.cc
    ../The-Forge/Common_3/ThirdParty/OpenSource/ozz-animation/src/animation/runtime/track_triggering_job.cc
)

add_library(ozz_animation STATIC ${OZZ_ANIMATION_FILES})

target_link_libraries(ozz_animation ozz_base)
target_include_directories(ozz_animation PUBLIC ../The-Forge/Common_3/ThirdParty/OpenSource/ozz-animation/include)

set_property(TARGET ozz_animation PROPERTY CXX_STANDARD 17)
