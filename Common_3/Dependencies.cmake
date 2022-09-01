set(CMAKE_CXX_STANDARD 17)

set(THIRD_PARTY_DIR ${CMAKE_CURRENT_SOURCE_DIR}/../The-Forge/Common_3/ThirdParty/OpenSource)

add_library(WinPixEventRuntime SHARED IMPORTED)
set_property(TARGET WinPixEventRuntime PROPERTY IMPORTED_LOCATION
    ${THIRD_PARTY_DIR}/winpixeventruntime/bin/WinPixEventRuntime.dll
)
set_property(TARGET WinPixEventRuntime PROPERTY IMPORTED_IMPLIB
    ${THIRD_PARTY_DIR}/winpixeventruntime/bin/WinPixEventRuntime.lib
)

add_library(AGS SHARED IMPORTED)
set_property(TARGET AGS PROPERTY IMPORTED_LOCATION
    ${THIRD_PARTY_DIR}/ags/ags_lib/lib/amd_ags_x64.dll
)
set_property(TARGET AGS PROPERTY IMPORTED_IMPLIB
    ${THIRD_PARTY_DIR}/ags/ags_lib/lib/amd_ags_x64.lib
)

add_library(Nvapi STATIC IMPORTED)
set_property(TARGET Nvapi PROPERTY IMPORTED_LOCATION
    ${THIRD_PARTY_DIR}/nvapi/amd64/nvapi64.lib
)

add_library(DirectXShaderCompiler STATIC IMPORTED)
set_property(TARGET DirectXShaderCompiler PROPERTY IMPORTED_LOCATION
    ${THIRD_PARTY_DIR}/DirectXShaderCompiler/lib/x64/dxcompiler.lib
)

set(BASISU_FILES
    ${THIRD_PARTY_DIR}/basis_universal/transcoder/basisu_transcoder.cpp
)
add_library(Basisu STATIC ${BASISU_FILES})

set(EASTL_FILES
     ${THIRD_PARTY_DIR}/EASTL/assert.cpp
     ${THIRD_PARTY_DIR}/EASTL/allocator_forge.cpp
     ${THIRD_PARTY_DIR}/EASTL/fixed_pool.cpp
     ${THIRD_PARTY_DIR}/EASTL/hashtable.cpp
     ${THIRD_PARTY_DIR}/EASTL/intrusive_list.cpp
     ${THIRD_PARTY_DIR}/EASTL/numeric_limits.cpp
     ${THIRD_PARTY_DIR}/EASTL/red_black_tree.cpp
     ${THIRD_PARTY_DIR}/EASTL/string.cpp
     ${THIRD_PARTY_DIR}/EASTL/thread_support.cpp
     ${THIRD_PARTY_DIR}/EASTL/EAStdC/EAMemory.cpp
     ${THIRD_PARTY_DIR}/EASTL/EAStdC/EASprintf.cpp
)
add_library(Eastl STATIC ${EASTL_FILES})

set(IMGUI_FILES
     ${THIRD_PARTY_DIR}/imgui/imconfig.h
     ${THIRD_PARTY_DIR}/imgui/imgui_demo.cpp
     ${THIRD_PARTY_DIR}/imgui/imgui_draw.cpp
     ${THIRD_PARTY_DIR}/imgui/imgui_internal.h
     ${THIRD_PARTY_DIR}/imgui/imgui_widgets.cpp
     ${THIRD_PARTY_DIR}/imgui/imgui.cpp
     ${THIRD_PARTY_DIR}/imgui/imgui.h
)
add_library(Imgui STATIC ${IMGUI_FILES})

set(LUA_FILES
     ${THIRD_PARTY_DIR}/lua-5.3.5/src/lapi.c
     ${THIRD_PARTY_DIR}/lua-5.3.5/src/lauxlib.c
     ${THIRD_PARTY_DIR}/lua-5.3.5/src/lbaselib.c
     ${THIRD_PARTY_DIR}/lua-5.3.5/src/lbitlib.c
     ${THIRD_PARTY_DIR}/lua-5.3.5/src/lcode.c
     ${THIRD_PARTY_DIR}/lua-5.3.5/src/lcorolib.c
     ${THIRD_PARTY_DIR}/lua-5.3.5/src/lctype.c
     ${THIRD_PARTY_DIR}/lua-5.3.5/src/ldblib.c
     ${THIRD_PARTY_DIR}/lua-5.3.5/src/ldebug.c
     ${THIRD_PARTY_DIR}/lua-5.3.5/src/ldo.c
     ${THIRD_PARTY_DIR}/lua-5.3.5/src/ldump.c
     ${THIRD_PARTY_DIR}/lua-5.3.5/src/lfunc.c
     ${THIRD_PARTY_DIR}/lua-5.3.5/src/lgc.c
     ${THIRD_PARTY_DIR}/lua-5.3.5/src/linit.c
     ${THIRD_PARTY_DIR}/lua-5.3.5/src/liolib.c
     ${THIRD_PARTY_DIR}/lua-5.3.5/src/llex.c
     ${THIRD_PARTY_DIR}/lua-5.3.5/src/lmathlib.c
     ${THIRD_PARTY_DIR}/lua-5.3.5/src/lmem.c
     ${THIRD_PARTY_DIR}/lua-5.3.5/src/loadlib.c
     ${THIRD_PARTY_DIR}/lua-5.3.5/src/lobject.c
     ${THIRD_PARTY_DIR}/lua-5.3.5/src/lopcodes.c
     ${THIRD_PARTY_DIR}/lua-5.3.5/src/loslib.c
     ${THIRD_PARTY_DIR}/lua-5.3.5/src/lparser.c
     ${THIRD_PARTY_DIR}/lua-5.3.5/src/lstate.c
     ${THIRD_PARTY_DIR}/lua-5.3.5/src/lstring.c
     ${THIRD_PARTY_DIR}/lua-5.3.5/src/lstrlib.c
     ${THIRD_PARTY_DIR}/lua-5.3.5/src/ltable.c
     ${THIRD_PARTY_DIR}/lua-5.3.5/src/ltablib.c
     ${THIRD_PARTY_DIR}/lua-5.3.5/src/ltm.c
     ${THIRD_PARTY_DIR}/lua-5.3.5/src/lundump.c
     ${THIRD_PARTY_DIR}/lua-5.3.5/src/lutf8lib.c
     ${THIRD_PARTY_DIR}/lua-5.3.5/src/lvm.c
     ${THIRD_PARTY_DIR}/lua-5.3.5/src/lzio.c
)
add_library(Lua STATIC ${LUA_FILES})

set(MINIZIP_FILES
     ${THIRD_PARTY_DIR}/minizip/lib/brg/aes.h
     ${THIRD_PARTY_DIR}/minizip/lib/brg/aescrypt.c
     ${THIRD_PARTY_DIR}/minizip/lib/brg/aeskey.c
     ${THIRD_PARTY_DIR}/minizip/lib/brg/aesopt.h
     ${THIRD_PARTY_DIR}/minizip/lib/brg/aestab.c
     ${THIRD_PARTY_DIR}/minizip/lib/brg/aestab.h
     ${THIRD_PARTY_DIR}/minizip/lib/brg/brg_endian.h
     ${THIRD_PARTY_DIR}/minizip/lib/brg/brg_types.h
     ${THIRD_PARTY_DIR}/minizip/lib/brg/hmac.c
     ${THIRD_PARTY_DIR}/minizip/lib/brg/hmac.h
     ${THIRD_PARTY_DIR}/minizip/lib/brg/sha1.c
     ${THIRD_PARTY_DIR}/minizip/lib/brg/sha1.h
     ${THIRD_PARTY_DIR}/minizip/lib/brg/sha2.c
     ${THIRD_PARTY_DIR}/minizip/lib/brg/sha2.h
     ${THIRD_PARTY_DIR}/zip/miniz.h
     ${THIRD_PARTY_DIR}/minizip/mz.h
     ${THIRD_PARTY_DIR}/minizip/mz_crypt.c
     ${THIRD_PARTY_DIR}/minizip/mz_crypt.h
     ${THIRD_PARTY_DIR}/minizip/mz_crypt_brg.c
     ${THIRD_PARTY_DIR}/minizip/mz_os.cpp
     ${THIRD_PARTY_DIR}/minizip/mz_os.h
     ${THIRD_PARTY_DIR}/minizip/mz_strm.h
     ${THIRD_PARTY_DIR}/minizip/mz_strm_raw.c
     ${THIRD_PARTY_DIR}/minizip/mz_strm_wzaes.c
     ${THIRD_PARTY_DIR}/minizip/mz_strm_wzaes.h
     ${THIRD_PARTY_DIR}/minizip/mz_strm_zlib.c
     ${THIRD_PARTY_DIR}/minizip/mz_strm_zlib.h
     ${THIRD_PARTY_DIR}/minizip/mz_zip.c
     ${THIRD_PARTY_DIR}/minizip/mz_zip.h
)
add_library(MiniZip STATIC ${MINIZIP_FILES})

set(RMEM_FILES
     ${THIRD_PARTY_DIR}/rmem/src/rmem_get_module_info.cpp
     ${THIRD_PARTY_DIR}/rmem/src/rmem_hook.cpp
     ${THIRD_PARTY_DIR}/rmem/src/rmem_lib.cpp
)
add_library(RMem STATIC ${RMEM_FILES})

set(MESHOPTIMIZER_FILES
     ${THIRD_PARTY_DIR}/meshoptimizer/src/vertexfilter.cpp
     ${THIRD_PARTY_DIR}/meshoptimizer/src/allocator.cpp
     ${THIRD_PARTY_DIR}/meshoptimizer/src/clusterizer.cpp
     ${THIRD_PARTY_DIR}/meshoptimizer/src/indexcodec.cpp
     ${THIRD_PARTY_DIR}/meshoptimizer/src/indexgenerator.cpp
     ${THIRD_PARTY_DIR}/meshoptimizer/src/meshoptimizer.h
     ${THIRD_PARTY_DIR}/meshoptimizer/src/overdrawanalyzer.cpp
     ${THIRD_PARTY_DIR}/meshoptimizer/src/overdrawoptimizer.cpp
     ${THIRD_PARTY_DIR}/meshoptimizer/src/simplifier.cpp
     ${THIRD_PARTY_DIR}/meshoptimizer/src/spatialorder.cpp
     ${THIRD_PARTY_DIR}/meshoptimizer/src/stripifier.cpp
     ${THIRD_PARTY_DIR}/meshoptimizer/src/vcacheanalyzer.cpp
     ${THIRD_PARTY_DIR}/meshoptimizer/src/vcacheoptimizer.cpp
     ${THIRD_PARTY_DIR}/meshoptimizer/src/vertexcodec.cpp
     ${THIRD_PARTY_DIR}/meshoptimizer/src/vfetchanalyzer.cpp
     ${THIRD_PARTY_DIR}/meshoptimizer/src/vfetchoptimizer.cpp
)
add_library(MeshOptimizer STATIC ${MESHOPTIMIZER_FILES})

set(THIRDPARTY_OSS_TINYEXR_FILES
     ${THIRD_PARTY_DIR}/TinyEXR/tinyexr.cpp
     ${THIRD_PARTY_DIR}/TinyEXR/tinyexr.h
)
add_library(TinyEXR STATIC ${THIRDPARTY_OSS_TINYEXR_FILES})

set(GAINPUT_STATIC_FILES
     ${THIRD_PARTY_DIR}/gainput/lib/source/gainput/gainput.cpp
     ${THIRD_PARTY_DIR}/gainput/lib/source/gainput/GainputAllocator.cpp
     ${THIRD_PARTY_DIR}/gainput/lib/source/gainput/gestures/GainputButtonStickGesture.cpp
     ${THIRD_PARTY_DIR}/gainput/lib/source/gainput/dev/GainputDev.cpp
     ${THIRD_PARTY_DIR}/gainput/lib/source/gainput/gestures/GainputDoubleClickGesture.cpp
     ${THIRD_PARTY_DIR}/gainput/lib/source/gainput/gestures/GainputHoldGesture.cpp
     ${THIRD_PARTY_DIR}/gainput/lib/source/gainput/GainputInputDeltaState.cpp
     ${THIRD_PARTY_DIR}/gainput/lib/source/gainput/GainputInputDevice.cpp
     ${THIRD_PARTY_DIR}/gainput/lib/source/gainput/builtin/GainputInputDeviceBuiltIn.cpp
     ${THIRD_PARTY_DIR}/gainput/lib/source/gainput/keyboard/GainputInputDeviceKeyboard.cpp
     ${THIRD_PARTY_DIR}/gainput/lib/source/gainput/mouse/GainputInputDeviceMouse.cpp
     ${THIRD_PARTY_DIR}/gainput/lib/source/gainput/pad/GainputInputDevicePad.cpp
     ${THIRD_PARTY_DIR}/gainput/lib/source/gainput/touch/GainputInputDeviceTouch.cpp
     ${THIRD_PARTY_DIR}/gainput/lib/source/gainput/GainputInputManager.cpp
     ${THIRD_PARTY_DIR}/gainput/lib/source/gainput/GainputInputMap.cpp
     ${THIRD_PARTY_DIR}/gainput/lib/source/gainput/recorder/GainputInputPlayer.cpp
     ${THIRD_PARTY_DIR}/gainput/lib/source/gainput/recorder/GainputInputRecorder.cpp
     ${THIRD_PARTY_DIR}/gainput/lib/source/gainput/recorder/GainputInputRecording.cpp
     ${THIRD_PARTY_DIR}/gainput/lib/source/gainput/GainputInputState.cpp
     ${THIRD_PARTY_DIR}/gainput/lib/source/gainput/GainputMapFilters.cpp
     ${THIRD_PARTY_DIR}/gainput/lib/source/gainput/dev/GainputMemoryStream.cpp
     ${THIRD_PARTY_DIR}/gainput/lib/source/gainput/gestures/GainputPinchGesture.cpp
     ${THIRD_PARTY_DIR}/gainput/lib/source/gainput/gestures/GainputRotateGesture.cpp
     ${THIRD_PARTY_DIR}/gainput/lib/source/gainput/gestures/GainputSimultaneouslyDownGesture.cpp
     ${THIRD_PARTY_DIR}/gainput/lib/source/gainput/gestures/GainputTapGesture.cpp
)
set(GAINPUT_MACOS_FILES
     ${THIRD_PARTY_DIR}/gainput/lib/source/gainput/GainputMac.mm
     ${THIRD_PARTY_DIR}/gainput/lib/source/gainput/pad/GainputInputDevicePadMac.cpp
     ${THIRD_PARTY_DIR}/gainput/lib/source/gainput/mouse/GainputInputDeviceMouseMac.mm
     ${THIRD_PARTY_DIR}/gainput/lib/source/gainput/mouse/GainputInputDeviceMouseMacRaw.mm
     ${THIRD_PARTY_DIR}/gainput/lib/source/gainput/keyboard/GainputInputDeviceKeyboardMac.cpp
)
set(GAINPUT_IOS_FILES
     ${THIRD_PARTY_DIR}/gainput/lib/source/gainput/GainputIos.mm
)
source_group(Core FILES ${GAINPUT_STATIC_FILES})
source_group(MacOS FILES ${GAINPUT_MACOS_FILES})
if(${APPLE_PLATFORM} MATCHES ON) 
    set(GAINPUT_STATIC_FILES
        ${GAINPUT_STATIC_FILES}
        ${GAINPUT_MACOS_FILES}
    )
endif()
add_library(GaInput STATIC ${GAINPUT_STATIC_FILES})

set(OZZ_INCLUDES
    ${THIRD_PARTY_DIR}/ozz-animation/include
)
set(OZZ_BASE_FILES
    ${THIRD_PARTY_DIR}/ozz-animation/include/ozz/base/containers/map.h
    ${THIRD_PARTY_DIR}/ozz-animation/include/ozz/base/containers/set.h
    ${THIRD_PARTY_DIR}/ozz-animation/include/ozz/base/containers/string.h
    ${THIRD_PARTY_DIR}/ozz-animation/include/ozz/base/containers/string_archive.h
    ${THIRD_PARTY_DIR}/ozz-animation/include/ozz/base/containers/vector.h
    ${THIRD_PARTY_DIR}/ozz-animation/include/ozz/base/containers/vector_archive.h
    ${THIRD_PARTY_DIR}/ozz-animation/include/ozz/base/endianness.h
    ${THIRD_PARTY_DIR}/ozz-animation/include/ozz/base/gtest_helper.h
    ${THIRD_PARTY_DIR}/ozz-animation/include/ozz/base/io/archive.h
    ${THIRD_PARTY_DIR}/ozz-animation/include/ozz/base/io/archive_traits.h
    ${THIRD_PARTY_DIR}/ozz-animation/include/ozz/base/maths/gtest_math_helper.h
    ${THIRD_PARTY_DIR}/ozz-animation/include/ozz/base/maths/math_archive.h
    ${THIRD_PARTY_DIR}/ozz-animation/include/ozz/base/maths/math_constant.h
    ${THIRD_PARTY_DIR}/ozz-animation/include/ozz/base/maths/math_ex.h
    ${THIRD_PARTY_DIR}/ozz-animation/include/ozz/base/maths/simd_math_archive.h
    ${THIRD_PARTY_DIR}/ozz-animation/include/ozz/base/maths/soa_math_archive.h
    ${THIRD_PARTY_DIR}/ozz-animation/include/ozz/base/memory/allocator.h
    ${THIRD_PARTY_DIR}/ozz-animation/include/ozz/base/platform.h
    ${THIRD_PARTY_DIR}/ozz-animation/src/base/containers/string_archive.cc
    ${THIRD_PARTY_DIR}/ozz-animation/src/base/io/archive.cc
    ${THIRD_PARTY_DIR}/ozz-animation/src/base/maths/math_archive.cc
    ${THIRD_PARTY_DIR}/ozz-animation/src/base/maths/simd_math_archive.cc
    ${THIRD_PARTY_DIR}/ozz-animation/src/base/maths/soa_math_archive.cc
    ${THIRD_PARTY_DIR}/ozz-animation/src/base/memory/allocator.cc
    ${THIRD_PARTY_DIR}/ozz-animation/src/base/platform.cc
)
source_group(Base FILES ${OZZ_BASE_FILES})
set(OZZ_ANIMATION_FILES
    ${THIRD_PARTY_DIR}/ozz-animation/include/ozz/animation/runtime/ik_aim_job.h
    ${THIRD_PARTY_DIR}/ozz-animation/include/ozz/animation/runtime/ik_two_bone_job.h
    ${THIRD_PARTY_DIR}/ozz-animation/include/ozz/animation/runtime/animation.h
    ${THIRD_PARTY_DIR}/ozz-animation/include/ozz/animation/runtime/blending_job.h
    ${THIRD_PARTY_DIR}/ozz-animation/include/ozz/animation/runtime/local_to_model_job.h
    ${THIRD_PARTY_DIR}/ozz-animation/include/ozz/animation/runtime/sampling_job.h
    ${THIRD_PARTY_DIR}/ozz-animation/include/ozz/animation/runtime/skeleton.h
    ${THIRD_PARTY_DIR}/ozz-animation/include/ozz/animation/runtime/skeleton_utils.h
    ${THIRD_PARTY_DIR}/ozz-animation/include/ozz/animation/runtime/track.h
    ${THIRD_PARTY_DIR}/ozz-animation/include/ozz/animation/runtime/track_sampling_job.h
    ${THIRD_PARTY_DIR}/ozz-animation/include/ozz/animation/runtime/track_triggering_job.h
    ${THIRD_PARTY_DIR}/ozz-animation/include/ozz/animation/runtime/track_triggering_job_stl.h
    ${THIRD_PARTY_DIR}/ozz-animation/src/animation/runtime/animation_keyframe.h
    ${THIRD_PARTY_DIR}/ozz-animation/src/animation/runtime/animation.cc
    ${THIRD_PARTY_DIR}/ozz-animation/src/animation/runtime/blending_job.cc
    ${THIRD_PARTY_DIR}/ozz-animation/src/animation/runtime/ik_aim_job.cc
    ${THIRD_PARTY_DIR}/ozz-animation/src/animation/runtime/ik_two_bone_job.cc
    ${THIRD_PARTY_DIR}/ozz-animation/src/animation/runtime/local_to_model_job.cc
    ${THIRD_PARTY_DIR}/ozz-animation/src/animation/runtime/sampling_job.cc
    ${THIRD_PARTY_DIR}/ozz-animation/src/animation/runtime/skeleton_utils.cc
    ${THIRD_PARTY_DIR}/ozz-animation/src/animation/runtime/skeleton.cc
    ${THIRD_PARTY_DIR}/ozz-animation/src/animation/runtime/track_sampling_job.cc
    ${THIRD_PARTY_DIR}/ozz-animation/src/animation/runtime/track_triggering_job.cc
    ${THIRD_PARTY_DIR}/ozz-animation/src/animation/runtime/track.cc
)
source_group(Animation/runtime FILES ${OZZ_ANIMATION_FILES})
set(OZZ_ANIMATION_OFFLINE_FILES
    ${THIRD_PARTY_DIR}/ozz-animation/include/ozz/animation/offline/additive_animation_builder.h
    ${THIRD_PARTY_DIR}/ozz-animation/include/ozz/animation/offline/animation_builder.h
    ${THIRD_PARTY_DIR}/ozz-animation/include/ozz/animation/offline/animation_optimizer.h
    ${THIRD_PARTY_DIR}/ozz-animation/include/ozz/animation/offline/raw_animation_utils.h
    ${THIRD_PARTY_DIR}/ozz-animation/include/ozz/animation/offline/raw_animation.h
    ${THIRD_PARTY_DIR}/ozz-animation/include/ozz/animation/offline/raw_skeleton.h
    ${THIRD_PARTY_DIR}/ozz-animation/include/ozz/animation/offline/raw_track.h
    ${THIRD_PARTY_DIR}/ozz-animation/include/ozz/animation/offline/skeleton_builder.h
    ${THIRD_PARTY_DIR}/ozz-animation/include/ozz/animation/offline/track_builder.h
    ${THIRD_PARTY_DIR}/ozz-animation/include/ozz/animation/offline/track_optimizer.h
    ${THIRD_PARTY_DIR}/ozz-animation/src/animation/offline/additive_animation_builder.cc
    ${THIRD_PARTY_DIR}/ozz-animation/src/animation/offline/animation_builder.cc
    ${THIRD_PARTY_DIR}/ozz-animation/src/animation/offline/animation_optimizer.cc
    ${THIRD_PARTY_DIR}/ozz-animation/src/animation/offline/raw_animation_archive.cc
    ${THIRD_PARTY_DIR}/ozz-animation/src/animation/offline/raw_animation_utils.cc
    ${THIRD_PARTY_DIR}/ozz-animation/src/animation/offline/raw_animation.cc
    ${THIRD_PARTY_DIR}/ozz-animation/src/animation/offline/raw_skeleton_archive.cc
    ${THIRD_PARTY_DIR}/ozz-animation/src/animation/offline/raw_skeleton.cc
    ${THIRD_PARTY_DIR}/ozz-animation/src/animation/offline/raw_track.cc
    ${THIRD_PARTY_DIR}/ozz-animation/src/animation/offline/skeleton_builder.cc
    ${THIRD_PARTY_DIR}/ozz-animation/src/animation/offline/track_builder.cc
    ${THIRD_PARTY_DIR}/ozz-animation/src/animation/offline/track_optimizer.cc
)
source_group(Animation/Offline FILES ${OZZ_ANIMATION_OFFLINE_FILES})
set(OZZ_FILES
    ${OZZ_BASE_FILES}
    ${OZZ_ANIMATION_FILES}
    ${OZZ_ANIMATION_OFFLINE_FILES}
)
add_library(Ozz STATIC ${OZZ_FILES})
target_include_directories(Ozz PUBLIC ${OZZ_INCLUDES})

set(THIRD_PARTY_DEPS
    Basisu
    Eastl
    Imgui
    Lua
    MiniZip
    RMem
    MeshOptimizer
    TinyEXR
    GaInput
    Ozz
)
