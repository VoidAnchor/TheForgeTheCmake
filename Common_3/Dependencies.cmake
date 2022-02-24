# Dependencies

# Basis Universal

set(BASISU_FILES
    ../The-Forge/Common_3/ThirdParty/OpenSource/basis_universal/transcoder/basisu_transcoder.cpp
)

# EASTL

set(EASTL_FILES
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

# Dear IMGUI

set(IMGUI_FILES
    ../The-Forge/Common_3/ThirdParty/OpenSource/imgui/imconfig.h
    ../The-Forge/Common_3/ThirdParty/OpenSource/imgui/imgui_demo.cpp
    ../The-Forge/Common_3/ThirdParty/OpenSource/imgui/imgui_draw.cpp
    ../The-Forge/Common_3/ThirdParty/OpenSource/imgui/imgui_internal.h
    ../The-Forge/Common_3/ThirdParty/OpenSource/imgui/imgui_widgets.cpp
    ../The-Forge/Common_3/ThirdParty/OpenSource/imgui/imgui.cpp
    ../The-Forge/Common_3/ThirdParty/OpenSource/imgui/imgui.h
)

# LUA

set(LUA_FILES
    ../The-Forge/Common_3/ThirdParty/OpenSource/lua-5.3.5/src/lapi.c
    ../The-Forge/Common_3/ThirdParty/OpenSource/lua-5.3.5/src/lauxlib.c
    ../The-Forge/Common_3/ThirdParty/OpenSource/lua-5.3.5/src/lbaselib.c
    ../The-Forge/Common_3/ThirdParty/OpenSource/lua-5.3.5/src/lbitlib.c
    ../The-Forge/Common_3/ThirdParty/OpenSource/lua-5.3.5/src/lcode.c
    ../The-Forge/Common_3/ThirdParty/OpenSource/lua-5.3.5/src/lcorolib.c
    ../The-Forge/Common_3/ThirdParty/OpenSource/lua-5.3.5/src/lctype.c
    ../The-Forge/Common_3/ThirdParty/OpenSource/lua-5.3.5/src/ldblib.c
    ../The-Forge/Common_3/ThirdParty/OpenSource/lua-5.3.5/src/ldebug.c
    ../The-Forge/Common_3/ThirdParty/OpenSource/lua-5.3.5/src/ldo.c
    ../The-Forge/Common_3/ThirdParty/OpenSource/lua-5.3.5/src/ldump.c
    ../The-Forge/Common_3/ThirdParty/OpenSource/lua-5.3.5/src/lfunc.c
    ../The-Forge/Common_3/ThirdParty/OpenSource/lua-5.3.5/src/lgc.c
    ../The-Forge/Common_3/ThirdParty/OpenSource/lua-5.3.5/src/linit.c
    ../The-Forge/Common_3/ThirdParty/OpenSource/lua-5.3.5/src/liolib.c
    ../The-Forge/Common_3/ThirdParty/OpenSource/lua-5.3.5/src/llex.c
    ../The-Forge/Common_3/ThirdParty/OpenSource/lua-5.3.5/src/lmathlib.c
    ../The-Forge/Common_3/ThirdParty/OpenSource/lua-5.3.5/src/lmem.c
    ../The-Forge/Common_3/ThirdParty/OpenSource/lua-5.3.5/src/loadlib.c
    ../The-Forge/Common_3/ThirdParty/OpenSource/lua-5.3.5/src/lobject.c
    ../The-Forge/Common_3/ThirdParty/OpenSource/lua-5.3.5/src/lopcodes.c
    ../The-Forge/Common_3/ThirdParty/OpenSource/lua-5.3.5/src/loslib.c
    ../The-Forge/Common_3/ThirdParty/OpenSource/lua-5.3.5/src/lparser.c
    ../The-Forge/Common_3/ThirdParty/OpenSource/lua-5.3.5/src/lstate.c
    ../The-Forge/Common_3/ThirdParty/OpenSource/lua-5.3.5/src/lstring.c
    ../The-Forge/Common_3/ThirdParty/OpenSource/lua-5.3.5/src/lstrlib.c
    ../The-Forge/Common_3/ThirdParty/OpenSource/lua-5.3.5/src/ltable.c
    ../The-Forge/Common_3/ThirdParty/OpenSource/lua-5.3.5/src/ltablib.c
    ../The-Forge/Common_3/ThirdParty/OpenSource/lua-5.3.5/src/ltm.c
    ../The-Forge/Common_3/ThirdParty/OpenSource/lua-5.3.5/src/lundump.c
    ../The-Forge/Common_3/ThirdParty/OpenSource/lua-5.3.5/src/lutf8lib.c
    ../The-Forge/Common_3/ThirdParty/OpenSource/lua-5.3.5/src/lvm.c
    ../The-Forge/Common_3/ThirdParty/OpenSource/lua-5.3.5/src/lzio.c
)

# MiniZip

set(MINIZIP_FILES
    ../The-Forge/Common_3/ThirdParty/OpenSource/minizip/lib/brg/aes.h
    ../The-Forge/Common_3/ThirdParty/OpenSource/minizip/lib/brg/aescrypt.c
    ../The-Forge/Common_3/ThirdParty/OpenSource/minizip/lib/brg/aeskey.c
    ../The-Forge/Common_3/ThirdParty/OpenSource/minizip/lib/brg/aesopt.h
    ../The-Forge/Common_3/ThirdParty/OpenSource/minizip/lib/brg/aestab.c
    ../The-Forge/Common_3/ThirdParty/OpenSource/minizip/lib/brg/aestab.h
    ../The-Forge/Common_3/ThirdParty/OpenSource/minizip/lib/brg/brg_endian.h
    ../The-Forge/Common_3/ThirdParty/OpenSource/minizip/lib/brg/brg_types.h
    ../The-Forge/Common_3/ThirdParty/OpenSource/minizip/lib/brg/hmac.c
    ../The-Forge/Common_3/ThirdParty/OpenSource/minizip/lib/brg/hmac.h
    ../The-Forge/Common_3/ThirdParty/OpenSource/minizip/lib/brg/sha1.c
    ../The-Forge/Common_3/ThirdParty/OpenSource/minizip/lib/brg/sha1.h
    ../The-Forge/Common_3/ThirdParty/OpenSource/minizip/lib/brg/sha2.c
    ../The-Forge/Common_3/ThirdParty/OpenSource/minizip/lib/brg/sha2.h
    ../The-Forge/Common_3/ThirdParty/OpenSource/zip/miniz.h
    ../The-Forge/Common_3/ThirdParty/OpenSource/minizip/mz.h
    ../The-Forge/Common_3/ThirdParty/OpenSource/minizip/mz_crypt.c
    ../The-Forge/Common_3/ThirdParty/OpenSource/minizip/mz_crypt.h
    ../The-Forge/Common_3/ThirdParty/OpenSource/minizip/mz_crypt_brg.c
    ../The-Forge/Common_3/ThirdParty/OpenSource/minizip/mz_os.cpp
    ../The-Forge/Common_3/ThirdParty/OpenSource/minizip/mz_os.h
    ../The-Forge/Common_3/ThirdParty/OpenSource/minizip/mz_strm.h
    ../The-Forge/Common_3/ThirdParty/OpenSource/minizip/mz_strm_raw.c
    ../The-Forge/Common_3/ThirdParty/OpenSource/minizip/mz_strm_wzaes.c
    ../The-Forge/Common_3/ThirdParty/OpenSource/minizip/mz_strm_wzaes.h
    ../The-Forge/Common_3/ThirdParty/OpenSource/minizip/mz_strm_zlib.c
    ../The-Forge/Common_3/ThirdParty/OpenSource/minizip/mz_strm_zlib.h
    ../The-Forge/Common_3/ThirdParty/OpenSource/minizip/mz_zip.c
    ../The-Forge/Common_3/ThirdParty/OpenSource/minizip/mz_zip.h
)

# RMem

set(RMEM_FILES
    ../The-Forge/Common_3/ThirdParty/OpenSource/rmem/src/rmem_get_module_info.cpp
    ../The-Forge/Common_3/ThirdParty/OpenSource/rmem/src/rmem_hook.cpp
    ../The-Forge/Common_3/ThirdParty/OpenSource/rmem/src/rmem_lib.cpp
)

# MeshOptimizer

set(MESHOPTIMIZER_FILES
    ../The-Forge/Common_3/ThirdParty/OpenSource/meshoptimizer/src/vertexfilter.cpp
    ../The-Forge/Common_3/ThirdParty/OpenSource/meshoptimizer/src/allocator.cpp
    ../The-Forge/Common_3/ThirdParty/OpenSource/meshoptimizer/src/clusterizer.cpp
    ../The-Forge/Common_3/ThirdParty/OpenSource/meshoptimizer/src/indexcodec.cpp
    ../The-Forge/Common_3/ThirdParty/OpenSource/meshoptimizer/src/indexgenerator.cpp
    ../The-Forge/Common_3/ThirdParty/OpenSource/meshoptimizer/src/meshoptimizer.h
    ../The-Forge/Common_3/ThirdParty/OpenSource/meshoptimizer/src/overdrawanalyzer.cpp
    ../The-Forge/Common_3/ThirdParty/OpenSource/meshoptimizer/src/overdrawoptimizer.cpp
    ../The-Forge/Common_3/ThirdParty/OpenSource/meshoptimizer/src/simplifier.cpp
    ../The-Forge/Common_3/ThirdParty/OpenSource/meshoptimizer/src/spatialorder.cpp
    ../The-Forge/Common_3/ThirdParty/OpenSource/meshoptimizer/src/stripifier.cpp
    ../The-Forge/Common_3/ThirdParty/OpenSource/meshoptimizer/src/vcacheanalyzer.cpp
    ../The-Forge/Common_3/ThirdParty/OpenSource/meshoptimizer/src/vcacheoptimizer.cpp
    ../The-Forge/Common_3/ThirdParty/OpenSource/meshoptimizer/src/vertexcodec.cpp
    ../The-Forge/Common_3/ThirdParty/OpenSource/meshoptimizer/src/vfetchanalyzer.cpp
    ../The-Forge/Common_3/ThirdParty/OpenSource/meshoptimizer/src/vfetchoptimizer.cpp
)

# TinyEXR

set(THIRDPARTY_OSS_TINYEXR_FILES
    ../The-Forge/Common_3/ThirdParty/OpenSource/TinyEXR/tinyexr.cpp
    ../The-Forge/Common_3/ThirdParty/OpenSource/TinyEXR/tinyexr.h
)

# Gainput

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

set(GAINPUT_MACOS_FILES
    ../The-Forge/Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/GainputMac.mm
    ../The-Forge/Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/pad/GainputInputDevicePadMac.cpp
    ../The-Forge/Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/mouse/GainputInputDeviceMouseMac.mm
    ../The-Forge/Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/mouse/GainputInputDeviceMouseMacRaw.mm
    ../The-Forge/Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/keyboard/GainputInputDeviceKeyboardMac.cpp
)
 
set(GAINPUT_IOS_FILES
    ../The-Forge/Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/GainputIos.mm
)

source_group(Dependencies\\BasisU FILES ${BASISU_FILES})
source_group(Dependencies\\EASTL FILES ${EASTL_FILES})
source_group(Dependencies\\IMGUI FILES ${IMGUI_FILES})
source_group(Dependencies\\LUA FILES ${LUA_FILES})
source_group(Dependencies\\minizip FILES ${MINIZIP_FILES})
source_group(Dependencies\\rmem FILES ${RMEM_FILES})
source_group(Dependencies\\MeshOptimizer FILES ${MESHOPTIMIZER_FILES})
source_group(Dependencies\\TinyEXR FILES ${THIRDPARTY_OSS_TINYEXR_FILES})

if(${APPLE_PLATFORM} MATCHES ON) 
    set(GAINPUT_STATIC_FILES
        ${GAINPUT_STATIC_FILES}
        ${GAINPUT_MACOS_FILES}
    )
endif()

source_group(Dependencies\\gainput FILES ${GAINPUT_STATIC_FILES})

add_library(The-Forge-Dependencies STATIC
    ${BASISU_FILES}
    ${EASTL_FILES}
    ${IMGUI_FILES}
    ${LUA_FILES}
    ${MINIZIP_FILES}
    ${RMEM_FILES}
    ${THIRDPARTY_OSS_TINYEXR_FILES}
    ${GAINPUT_STATIC_FILES}
    ${MESHOPTIMIZER_FILES}
)

set_property(TARGET The-Forge-Dependencies PROPERTY CXX_STANDARD 17)