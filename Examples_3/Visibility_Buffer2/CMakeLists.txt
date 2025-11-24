# Visibility_Buffer2 example - The-Forge v1.60+

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_CURRENT_BINARY_DIR}/bin")

set(VB2_SRC_DIR ${CMAKE_CURRENT_SOURCE_DIR}/../../The-Forge/Examples_3/Visibility_Buffer2/src)
set(FORGE_ROOT ${CMAKE_CURRENT_SOURCE_DIR}/../../The-Forge)
set(FORGE_COMMON ${FORGE_ROOT}/Common_3)

set(VB2_SOURCES
    ${VB2_SRC_DIR}/Visibility_Buffer.cpp
    ${VB2_SRC_DIR}/SanMiguel.cpp
    ${VB2_SRC_DIR}/SanMiguelSDF.cpp
)

set(VB2_HEADERS
    ${VB2_SRC_DIR}/SanMiguel.h
    ${VB2_SRC_DIR}/SanMiguelSDF.h
)

source_group("Source Files" FILES ${VB2_SOURCES})
source_group("Header Files" FILES ${VB2_HEADERS})

# VisibilityBuffer2.cpp is example-specific, add it to sources
set(VB2_RENDERER_DIR ${FORGE_COMMON}/Renderer)
list(APPEND VB2_SOURCES ${VB2_RENDERER_DIR}/VisibilityBuffer2/VisibilityBuffer2.cpp)

if(TARGET_MACOS)
    # macOSAppDelegate.m is compiled in each example, not in the library
    set(VB2_MACOS_DELEGATE ${FORGE_COMMON}/OS/Darwin/macOSAppDelegate.m)
    set_source_files_properties(${VB2_MACOS_DELEGATE} PROPERTIES COMPILE_FLAGS "-fobjc-arc")

    # MainMenu.xib - Xcode compiles to NIB automatically
    set(VB2_XIB ${FORGE_ROOT}/Examples_3/Build_Props/XCode/MacOS/Base.lproj/MainMenu.xib)
    set_source_files_properties(${VB2_XIB} PROPERTIES MACOSX_PACKAGE_LOCATION "Resources")

    add_executable(Visibility_Buffer2 MACOSX_BUNDLE ${VB2_SOURCES} ${VB2_HEADERS} ${VB2_MACOS_DELEGATE} ${VB2_XIB})
    set_target_properties(Visibility_Buffer2 PROPERTIES
        MACOSX_BUNDLE_GUI_IDENTIFIER "com.The-Forge.Examples.Visibility_Buffer2"
        MACOSX_BUNDLE_BUNDLE_NAME "Visibility_Buffer2"
        MACOSX_BUNDLE_BUNDLE_VERSION "1.0"
        MACOSX_BUNDLE_SHORT_VERSION_STRING "1.0"
        MACOSX_BUNDLE_COPYRIGHT "Copyright 2017 Confetti. All rights reserved."
        MACOSX_BUNDLE_NSMAIN_NIB_FILE "MainMenu"
    )
    # Output dir is bundle's Resources folder
    set(VB2_OUTPUT_DIR $<TARGET_BUNDLE_CONTENT_DIR:Visibility_Buffer2>/Resources)
elseif(TARGET_IOS)
    # iOSAppDelegate.m is compiled in each example (like macOS)
    set(VB2_IOS_DELEGATE ${FORGE_COMMON}/OS/Darwin/iOSAppDelegate.m)
    set_source_files_properties(${VB2_IOS_DELEGATE} PROPERTIES COMPILE_FLAGS "-fobjc-arc")

    # LaunchScreen.storyboard for iOS
    set(VB2_STORYBOARD ${FORGE_ROOT}/Examples_3/Build_Props/XCode/iOS/Base.lproj/LaunchScreen.storyboard)
    set_source_files_properties(${VB2_STORYBOARD} PROPERTIES MACOSX_PACKAGE_LOCATION "Resources")

    add_executable(Visibility_Buffer2 MACOSX_BUNDLE ${VB2_SOURCES} ${VB2_HEADERS} ${VB2_IOS_DELEGATE} ${VB2_STORYBOARD})
    set_target_properties(Visibility_Buffer2 PROPERTIES
        MACOSX_BUNDLE_GUI_IDENTIFIER "com.The-Forge.Examples.Visibility_Buffer2"
        MACOSX_BUNDLE_BUNDLE_NAME "Visibility_Buffer2"
        MACOSX_BUNDLE_BUNDLE_VERSION "1.0"
        MACOSX_BUNDLE_SHORT_VERSION_STRING "1.0"
        MACOSX_BUNDLE_INFO_PLIST "${FORGE_ROOT}/Examples_3/Build_Props/XCode/iOS/Info.plist"
        XCODE_ATTRIBUTE_TARGETED_DEVICE_FAMILY "1,2"
        XCODE_ATTRIBUTE_IPHONEOS_DEPLOYMENT_TARGET "14.0"
        XCODE_ATTRIBUTE_CODE_SIGN_IDENTITY "iPhone Developer"
        XCODE_ATTRIBUTE_CODE_SIGNING_REQUIRED "YES"
        XCODE_ATTRIBUTE_DEVELOPMENT_TEAM "${CMAKE_XCODE_ATTRIBUTE_DEVELOPMENT_TEAM}"
    )
    # Output dir is bundle's Resources folder (iOS uses same structure)
    set(VB2_OUTPUT_DIR $<TARGET_BUNDLE_CONTENT_DIR:Visibility_Buffer2>)
else()
    add_executable(Visibility_Buffer2 WIN32 ${VB2_SOURCES} ${VB2_HEADERS})
    set(VB2_OUTPUT_DIR $<TARGET_FILE_DIR:Visibility_Buffer2>)
endif()

target_link_libraries(Visibility_Buffer2 Renderer OS)
set_property(TARGET Visibility_Buffer2 PROPERTY CXX_STANDARD 17)
set_property(TARGET Visibility_Buffer2 PROPERTY VS_DEBUGGER_WORKING_DIRECTORY "${VB2_OUTPUT_DIR}")

# On Apple platforms, example source files need OBJCXX with ARC
if(APPLE_PLATFORM)
    set_source_files_properties(
        ${VB2_SRC_DIR}/Visibility_Buffer.cpp
        ${VB2_SRC_DIR}/SanMiguel.cpp
        ${VB2_SRC_DIR}/SanMiguelSDF.cpp
        ${VB2_RENDERER_DIR}/VisibilityBuffer2/VisibilityBuffer2.cpp
        PROPERTIES LANGUAGE OBJCXX COMPILE_FLAGS "-fobjc-arc"
    )
endif()

if(WIN32)
    target_link_libraries(Visibility_Buffer2 Xinput9_1_0.lib ws2_32.lib)
    target_link_options(Visibility_Buffer2 PRIVATE /ENTRY:mainCRTStartup)
    if(MSVC)
        target_link_options(Visibility_Buffer2 PRIVATE /FORCE:MULTIPLE)
    endif()

    add_custom_command(TARGET Visibility_Buffer2 POST_BUILD
        COMMAND ${CMAKE_COMMAND} -E copy_if_different $<TARGET_RUNTIME_DLLS:Visibility_Buffer2> $<TARGET_FILE_DIR:Visibility_Buffer2>
        COMMAND_EXPAND_LISTS
    )

    set(DXC_DIR ${FORGE_COMMON}/Graphics/ThirdParty/OpenSource/DirectXShaderCompiler/bin/x64)
    set(D3D12_DIR ${FORGE_COMMON}/Graphics/ThirdParty/OpenSource/Direct3d12Agility/bin/x64)
    add_custom_command(TARGET Visibility_Buffer2 POST_BUILD
        COMMAND ${CMAKE_COMMAND} -E copy_if_different "${DXC_DIR}/dxcompiler.dll" "${DXC_DIR}/dxil.dll" $<TARGET_FILE_DIR:Visibility_Buffer2>
        COMMAND ${CMAKE_COMMAND} -E copy_if_different "${D3D12_DIR}/D3D12Core.dll" "${D3D12_DIR}/d3d12SDKLayers.dll" $<TARGET_FILE_DIR:Visibility_Buffer2>
    )
endif()

# FSL shader compilation
if(DX12)
    set(FSL_LANG "DIRECT3D12")
elseif(VULKAN)
    set(FSL_LANG "VULKAN")
elseif(TARGET_MACOS)
    set(FSL_LANG "MACOS")
elseif(TARGET_IOS)
    set(FSL_LANG "IOS")
endif()

compile_fsl_shaders(
    TARGET Visibility_Buffer2
    SHADERS ${VB2_SRC_DIR}/Shaders/FSL/shaders.list
    OUTPUT_DIR ${VB2_OUTPUT_DIR}
    LANGUAGE ${FSL_LANG}
)

compile_common_shaders(
    TARGET Visibility_Buffer2
    OUTPUT_DIR ${VB2_OUTPUT_DIR}
    LANGUAGE ${FSL_LANG}
)

# Copy resources
if(TARGET_MACOS)
    add_custom_command(TARGET Visibility_Buffer2 POST_BUILD
        COMMAND ${CMAKE_COMMAND} -E make_directory "${VB2_OUTPUT_DIR}/GPUCfg"
        COMMAND ${CMAKE_COMMAND} -E copy_if_different "${VB2_SRC_DIR}/GPUCfg/gpu.cfg" "${VB2_OUTPUT_DIR}/GPUCfg/gpu.cfg"
        COMMAND ${CMAKE_COMMAND} -E copy_if_different "${FORGE_ROOT}/Art/cameraPath.txt" "${VB2_OUTPUT_DIR}/cameraPath.txt"
        COMMAND ${CMAKE_COMMAND} -E copy_if_different "${CMAKE_CURRENT_SOURCE_DIR}/../PathStatement.CMake.MacOS.txt" "${VB2_OUTPUT_DIR}/PathStatement.txt"
        COMMAND ${CMAKE_COMMAND} -E copy_if_different "${FORGE_COMMON}/OS/Darwin/apple_gpu.data" "${VB2_OUTPUT_DIR}/gpu.data"
        COMMAND ${CMAKE_COMMAND} -E make_directory "${VB2_OUTPUT_DIR}/PipelineCaches"
        COMMAND ${CMAKE_COMMAND} -E make_directory "${VB2_OUTPUT_DIR}/Screenshots"
        COMMAND ${CMAKE_COMMAND} -E make_directory "${VB2_OUTPUT_DIR}/Debug"
        COMMAND ${CMAKE_COMMAND} -E make_directory "${VB2_OUTPUT_DIR}/Scripts"
        COMMAND ${CMAKE_COMMAND} -E copy_directory "${FORGE_COMMON}/Scripts" "${VB2_OUTPUT_DIR}/Scripts"
    )
elseif(TARGET_IOS)
    # iOS apps are sandboxed - ALL assets must be bundled
    add_custom_command(TARGET Visibility_Buffer2 POST_BUILD
        COMMAND ${CMAKE_COMMAND} -E make_directory "${VB2_OUTPUT_DIR}/GPUCfg"
        COMMAND ${CMAKE_COMMAND} -E copy_if_different "${VB2_SRC_DIR}/GPUCfg/gpu.cfg" "${VB2_OUTPUT_DIR}/GPUCfg/gpu.cfg"
        COMMAND ${CMAKE_COMMAND} -E copy_if_different "${FORGE_ROOT}/Art/cameraPath.txt" "${VB2_OUTPUT_DIR}/cameraPath.txt"
        COMMAND ${CMAKE_COMMAND} -E copy_if_different "${CMAKE_CURRENT_SOURCE_DIR}/../PathStatement.CMake.iOS.txt" "${VB2_OUTPUT_DIR}/PathStatement.txt"
        COMMAND ${CMAKE_COMMAND} -E copy_if_different "${FORGE_COMMON}/OS/Darwin/apple_gpu.data" "${VB2_OUTPUT_DIR}/gpu.data"
        COMMAND ${CMAKE_COMMAND} -E make_directory "${VB2_OUTPUT_DIR}/PipelineCaches"
        COMMAND ${CMAKE_COMMAND} -E make_directory "${VB2_OUTPUT_DIR}/Screenshots"
        COMMAND ${CMAKE_COMMAND} -E make_directory "${VB2_OUTPUT_DIR}/Debug"
        COMMAND ${CMAKE_COMMAND} -E make_directory "${VB2_OUTPUT_DIR}/Scripts"
        COMMAND ${CMAKE_COMMAND} -E copy_directory "${FORGE_COMMON}/Scripts" "${VB2_OUTPUT_DIR}/Scripts"
        # Bundle all required Art assets for iOS
        COMMAND ${CMAKE_COMMAND} -E make_directory "${VB2_OUTPUT_DIR}/Fonts"
        COMMAND ${CMAKE_COMMAND} -E copy_directory "${FORGE_ROOT}/Art/Fonts" "${VB2_OUTPUT_DIR}/Fonts"
        COMMAND ${CMAKE_COMMAND} -E make_directory "${VB2_OUTPUT_DIR}/Textures"
        COMMAND ${CMAKE_COMMAND} -E copy_directory "${FORGE_ROOT}/Art/Textures/dds" "${VB2_OUTPUT_DIR}/Textures"
        COMMAND ${CMAKE_COMMAND} -E make_directory "${VB2_OUTPUT_DIR}/Meshes"
        COMMAND ${CMAKE_COMMAND} -E copy_directory "${FORGE_ROOT}/Art/Meshes" "${VB2_OUTPUT_DIR}/Meshes"
        COMMAND ${CMAKE_COMMAND} -E make_directory "${VB2_OUTPUT_DIR}/Animation"
        COMMAND ${CMAKE_COMMAND} -E copy_directory "${FORGE_ROOT}/Art/Animation" "${VB2_OUTPUT_DIR}/Animation"
    )
else()
    add_custom_command(TARGET Visibility_Buffer2 POST_BUILD
        COMMAND ${CMAKE_COMMAND} -E copy_if_different "${VB2_SRC_DIR}/GPUCfg/gpu.cfg" "${VB2_OUTPUT_DIR}/gpu.cfg"
        COMMAND ${CMAKE_COMMAND} -E copy_if_different "${FORGE_ROOT}/Art/cameraPath.txt" "${VB2_OUTPUT_DIR}/cameraPath.txt"
        COMMAND ${CMAKE_COMMAND} -E copy_if_different "${FORGE_ROOT}/Art/PathStatement.Windows.txt" "${VB2_OUTPUT_DIR}/PathStatement.txt"
        COMMAND ${CMAKE_COMMAND} -E copy_if_different "${FORGE_COMMON}/OS/Windows/pc_gpu.data" "${VB2_OUTPUT_DIR}/gpu.data"
        COMMAND ${CMAKE_COMMAND} -E make_directory "${VB2_OUTPUT_DIR}/PipelineCaches"
        COMMAND ${CMAKE_COMMAND} -E make_directory "${VB2_OUTPUT_DIR}/Screenshots"
        COMMAND ${CMAKE_COMMAND} -E make_directory "${VB2_OUTPUT_DIR}/Debug"
        COMMAND ${CMAKE_COMMAND} -E make_directory "${VB2_OUTPUT_DIR}/Scripts"
        COMMAND ${CMAKE_COMMAND} -E copy_directory "${FORGE_COMMON}/Scripts" "${VB2_OUTPUT_DIR}/Scripts"
    )
endif()
