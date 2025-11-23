# Dependencies - The-Forge v1.60+
# Third party library imports

set(GRAPHICS_THIRD_PARTY_DIR ${CMAKE_CURRENT_SOURCE_DIR}/../The-Forge/Common_3/Graphics/ThirdParty/OpenSource)
set(RESOURCES_THIRD_PARTY_DIR ${CMAKE_CURRENT_SOURCE_DIR}/../The-Forge/Common_3/Resources)

# WinPixEventRuntime (Windows only)
if(WINDOWS)
    add_library(WinPixEventRuntime SHARED IMPORTED)
    set_property(TARGET WinPixEventRuntime PROPERTY IMPORTED_LOCATION
        ${GRAPHICS_THIRD_PARTY_DIR}/winpixeventruntime/bin/WinPixEventRuntime.dll
    )
    set_property(TARGET WinPixEventRuntime PROPERTY IMPORTED_IMPLIB
        ${GRAPHICS_THIRD_PARTY_DIR}/winpixeventruntime/bin/WinPixEventRuntime.lib
    )
endif()

# AGS (AMD GPU Services - Windows only)
if(WINDOWS)
    add_library(AGS SHARED IMPORTED)
    set_property(TARGET AGS PROPERTY IMPORTED_LOCATION
        ${GRAPHICS_THIRD_PARTY_DIR}/ags/ags_lib/lib/amd_ags_x64.dll
    )
    set_property(TARGET AGS PROPERTY IMPORTED_IMPLIB
        ${GRAPHICS_THIRD_PARTY_DIR}/ags/ags_lib/lib/amd_ags_x64.lib
    )
    target_include_directories(AGS INTERFACE ${GRAPHICS_THIRD_PARTY_DIR}/ags)
endif()

# Nvapi (NVIDIA API - Windows only)
if(WINDOWS)
    add_library(Nvapi STATIC IMPORTED)
    set_property(TARGET Nvapi PROPERTY IMPORTED_LOCATION
        ${GRAPHICS_THIRD_PARTY_DIR}/nvapi/amd64/nvapi64.lib
    )
    target_include_directories(Nvapi INTERFACE ${GRAPHICS_THIRD_PARTY_DIR}/nvapi)
endif()

# DirectX Shader Compiler (Windows only)
if(WINDOWS)
    add_library(DirectXShaderCompiler STATIC IMPORTED)
    set_property(TARGET DirectXShaderCompiler PROPERTY IMPORTED_LOCATION
        ${GRAPHICS_THIRD_PARTY_DIR}/DirectXShaderCompiler/lib/x64/dxcompiler.lib
    )
    target_include_directories(DirectXShaderCompiler INTERFACE 
        ${GRAPHICS_THIRD_PARTY_DIR}/DirectXShaderCompiler/inc
    )
endif()

# Vulkan Memory Allocator (header-only)
add_library(VulkanMemoryAllocator INTERFACE)
target_include_directories(VulkanMemoryAllocator INTERFACE
    ${GRAPHICS_THIRD_PARTY_DIR}/VulkanMemoryAllocator
)

# D3D12 Memory Allocator (header-only)
if(WINDOWS)
    add_library(D3D12MemoryAllocator INTERFACE)
    target_include_directories(D3D12MemoryAllocator INTERFACE
        ${GRAPHICS_THIRD_PARTY_DIR}/D3D12MemoryAllocator
    )
endif()

# ozz-animation (new location in v1.60)
set(OZZ_DIR ${RESOURCES_THIRD_PARTY_DIR}/AnimationSystem/ThirdParty/OpenSource/ozz-animation)
set(OZZ_INCLUDES ${OZZ_DIR}/include)

set(OZZ_BASE_FILES
    ${OZZ_DIR}/src/base/containers/string_archive.cc
    ${OZZ_DIR}/src/base/io/archive.cc
    ${OZZ_DIR}/src/base/maths/math_archive.cc
    ${OZZ_DIR}/src/base/maths/simd_math_archive.cc
    ${OZZ_DIR}/src/base/maths/soa_math_archive.cc
    ${OZZ_DIR}/src/base/memory/allocator.cc
    ${OZZ_DIR}/src/base/platform.cc
)

set(OZZ_ANIMATION_FILES
    ${OZZ_DIR}/src/animation/runtime/animation.cc
    ${OZZ_DIR}/src/animation/runtime/animation_utils.cc
    ${OZZ_DIR}/src/animation/runtime/blending_job.cc
    ${OZZ_DIR}/src/animation/runtime/ik_aim_job.cc
    ${OZZ_DIR}/src/animation/runtime/ik_two_bone_job.cc
    ${OZZ_DIR}/src/animation/runtime/local_to_model_job.cc
    ${OZZ_DIR}/src/animation/runtime/sampling_job.cc
    ${OZZ_DIR}/src/animation/runtime/skeleton.cc
    ${OZZ_DIR}/src/animation/runtime/skeleton_utils.cc
    ${OZZ_DIR}/src/animation/runtime/track.cc
    ${OZZ_DIR}/src/animation/runtime/track_sampling_job.cc
    ${OZZ_DIR}/src/animation/runtime/track_triggering_job.cc
)

set(OZZ_ANIMATION_OFFLINE_FILES
    ${OZZ_DIR}/src/animation/offline/additive_animation_builder.cc
    ${OZZ_DIR}/src/animation/offline/animation_builder.cc
    ${OZZ_DIR}/src/animation/offline/animation_optimizer.cc
    ${OZZ_DIR}/src/animation/offline/raw_animation.cc
    ${OZZ_DIR}/src/animation/offline/raw_animation_archive.cc
    ${OZZ_DIR}/src/animation/offline/raw_animation_utils.cc
    ${OZZ_DIR}/src/animation/offline/raw_skeleton.cc
    ${OZZ_DIR}/src/animation/offline/raw_skeleton_archive.cc
    ${OZZ_DIR}/src/animation/offline/raw_track.cc
    ${OZZ_DIR}/src/animation/offline/skeleton_builder.cc
    ${OZZ_DIR}/src/animation/offline/track_builder.cc
    ${OZZ_DIR}/src/animation/offline/track_optimizer.cc
)

source_group(ThirdParty/ozz/Base FILES ${OZZ_BASE_FILES})
source_group(ThirdParty/ozz/Animation FILES ${OZZ_ANIMATION_FILES})
source_group(ThirdParty/ozz/AnimationOffline FILES ${OZZ_ANIMATION_OFFLINE_FILES})

set(OZZ_FILES
    ${OZZ_BASE_FILES}
    ${OZZ_ANIMATION_FILES}
    ${OZZ_ANIMATION_OFFLINE_FILES}
)

add_library(Ozz STATIC ${OZZ_FILES})
target_include_directories(Ozz PUBLIC ${OZZ_INCLUDES})
set_property(TARGET Ozz PROPERTY CXX_STANDARD 17)

# Animation system files (new location in v1.60)
set(ANIMATION_DIR ${RESOURCES_THIRD_PARTY_DIR}/AnimationSystem/Animation)
set(ANIMATION_FILES
    ${ANIMATION_DIR}/AnimatedObject.cpp
    ${ANIMATION_DIR}/AnimatedObject.h
    ${ANIMATION_DIR}/Animation.cpp
    ${ANIMATION_DIR}/Animation.h
    ${ANIMATION_DIR}/Clip.cpp
    ${ANIMATION_DIR}/Clip.h
    ${ANIMATION_DIR}/ClipController.cpp
    ${ANIMATION_DIR}/ClipController.h
    ${ANIMATION_DIR}/ClipMask.cpp
    ${ANIMATION_DIR}/ClipMask.h
    ${ANIMATION_DIR}/Rig.cpp
    ${ANIMATION_DIR}/Rig.h
    ${ANIMATION_DIR}/SkeletonBatcher.cpp
    ${ANIMATION_DIR}/SkeletonBatcher.h
)
source_group(Resources/Animation FILES ${ANIMATION_FILES})

# Third party dependencies list
set(THIRD_PARTY_DEPS Ozz)
