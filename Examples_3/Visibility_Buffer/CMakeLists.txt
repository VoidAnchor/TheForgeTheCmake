# Visibility_Buffer example - The-Forge v1.60+

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_CURRENT_BINARY_DIR}/bin")

set(VB_SRC_DIR ${CMAKE_CURRENT_SOURCE_DIR}/../../The-Forge/Examples_3/Visibility_Buffer/src)
set(FORGE_ROOT ${CMAKE_CURRENT_SOURCE_DIR}/../../The-Forge)
set(FORGE_COMMON ${FORGE_ROOT}/Common_3)

set(VB_SOURCES
    ${VB_SRC_DIR}/Visibility_Buffer.cpp
    ${VB_SRC_DIR}/SanMiguel.cpp
)

set(VB_HEADERS
    ${VB_SRC_DIR}/SanMiguel.h
    ${VB_SRC_DIR}/SanMiguelSDF.h
)

source_group("Source Files" FILES ${VB_SOURCES})
source_group("Header Files" FILES ${VB_HEADERS})

if(APPLE)
    # macOSAppDelegate.m is compiled in each example
    set(VB_MACOS_DELEGATE ${FORGE_COMMON}/OS/Darwin/macOSAppDelegate.m)
    set_source_files_properties(${VB_MACOS_DELEGATE} PROPERTIES COMPILE_FLAGS "-fobjc-arc")

    # MainMenu.xib - Xcode compiles to NIB automatically
    set(VB_XIB ${FORGE_ROOT}/Examples_3/Build_Props/XCode/MacOS/Base.lproj/MainMenu.xib)
    set_source_files_properties(${VB_XIB} PROPERTIES MACOSX_PACKAGE_LOCATION "Resources")

    add_executable(Visibility_Buffer MACOSX_BUNDLE ${VB_SOURCES} ${VB_HEADERS} ${VB_MACOS_DELEGATE} ${VB_XIB})
    set_target_properties(Visibility_Buffer PROPERTIES
        MACOSX_BUNDLE_GUI_IDENTIFIER "com.The-Forge.Examples.Visibility_Buffer"
        MACOSX_BUNDLE_BUNDLE_NAME "Visibility_Buffer"
        MACOSX_BUNDLE_BUNDLE_VERSION "1.0"
        MACOSX_BUNDLE_SHORT_VERSION_STRING "1.0"
        MACOSX_BUNDLE_COPYRIGHT "Copyright 2017 Confetti. All rights reserved."
        MACOSX_BUNDLE_NSMAIN_NIB_FILE "MainMenu"
    )
    set(VB_OUTPUT_DIR $<TARGET_BUNDLE_CONTENT_DIR:Visibility_Buffer>/Resources)
else()
    add_executable(Visibility_Buffer WIN32 ${VB_SOURCES} ${VB_HEADERS})
    set(VB_OUTPUT_DIR $<TARGET_FILE_DIR:Visibility_Buffer>)
endif()

target_link_libraries(Visibility_Buffer Renderer OS)
set_property(TARGET Visibility_Buffer PROPERTY CXX_STANDARD 17)
set_property(TARGET Visibility_Buffer PROPERTY VS_DEBUGGER_WORKING_DIRECTORY "${VB_OUTPUT_DIR}")

# On Apple platforms, example source files need OBJCXX with ARC
if(APPLE)
    set_source_files_properties(
        ${VB_SRC_DIR}/Visibility_Buffer.cpp
        ${VB_SRC_DIR}/SanMiguel.cpp
        PROPERTIES LANGUAGE OBJCXX COMPILE_FLAGS "-fobjc-arc"
    )
endif()

if(WIN32)
    target_link_libraries(Visibility_Buffer Xinput9_1_0.lib ws2_32.lib)
    target_link_options(Visibility_Buffer PRIVATE /ENTRY:mainCRTStartup)
    if(MSVC)
        target_link_options(Visibility_Buffer PRIVATE /FORCE:MULTIPLE)
    endif()

    add_custom_command(TARGET Visibility_Buffer POST_BUILD
        COMMAND ${CMAKE_COMMAND} -E copy_if_different $<TARGET_RUNTIME_DLLS:Visibility_Buffer> $<TARGET_FILE_DIR:Visibility_Buffer>
        COMMAND_EXPAND_LISTS
    )

    set(DXC_DIR ${FORGE_COMMON}/Graphics/ThirdParty/OpenSource/DirectXShaderCompiler/bin/x64)
    set(D3D12_DIR ${FORGE_COMMON}/Graphics/ThirdParty/OpenSource/Direct3d12Agility/bin/x64)
    add_custom_command(TARGET Visibility_Buffer POST_BUILD
        COMMAND ${CMAKE_COMMAND} -E copy_if_different "${DXC_DIR}/dxcompiler.dll" "${DXC_DIR}/dxil.dll" $<TARGET_FILE_DIR:Visibility_Buffer>
        COMMAND ${CMAKE_COMMAND} -E copy_if_different "${D3D12_DIR}/D3D12Core.dll" "${D3D12_DIR}/d3d12SDKLayers.dll" $<TARGET_FILE_DIR:Visibility_Buffer>
    )
endif()

# FSL shader compilation
if(DX12)
    set(FSL_LANG "DIRECT3D12")
elseif(VULKAN)
    set(FSL_LANG "VULKAN")
elseif(METAL)
    set(FSL_LANG "MACOS")
endif()

compile_fsl_shaders(
    TARGET Visibility_Buffer
    SHADERS ${VB_SRC_DIR}/Shaders/FSL/shaders.list
    OUTPUT_DIR ${VB_OUTPUT_DIR}
    LANGUAGE ${FSL_LANG}
)

compile_common_shaders(
    TARGET Visibility_Buffer
    OUTPUT_DIR ${VB_OUTPUT_DIR}
    LANGUAGE ${FSL_LANG}
)

# Copy resources
if(APPLE)
    add_custom_command(TARGET Visibility_Buffer POST_BUILD
        COMMAND ${CMAKE_COMMAND} -E make_directory "${VB_OUTPUT_DIR}/GPUCfg"
        COMMAND ${CMAKE_COMMAND} -E copy_if_different "${VB_SRC_DIR}/GPUCfg/gpu.cfg" "${VB_OUTPUT_DIR}/GPUCfg/gpu.cfg"
        COMMAND ${CMAKE_COMMAND} -E copy_if_different "${FORGE_ROOT}/Art/cameraPath.txt" "${VB_OUTPUT_DIR}/cameraPath.txt"
        COMMAND ${CMAKE_COMMAND} -E copy_if_different "${CMAKE_CURRENT_SOURCE_DIR}/../PathStatement.CMake.MacOS.txt" "${VB_OUTPUT_DIR}/PathStatement.txt"
        COMMAND ${CMAKE_COMMAND} -E copy_if_different "${FORGE_COMMON}/OS/Darwin/apple_gpu.data" "${VB_OUTPUT_DIR}/gpu.data"
        COMMAND ${CMAKE_COMMAND} -E make_directory "${VB_OUTPUT_DIR}/PipelineCaches"
        COMMAND ${CMAKE_COMMAND} -E make_directory "${VB_OUTPUT_DIR}/Screenshots"
        COMMAND ${CMAKE_COMMAND} -E make_directory "${VB_OUTPUT_DIR}/Debug"
        COMMAND ${CMAKE_COMMAND} -E make_directory "${VB_OUTPUT_DIR}/Scripts"
        COMMAND ${CMAKE_COMMAND} -E copy_directory "${FORGE_COMMON}/Scripts" "${VB_OUTPUT_DIR}/Scripts"
        COMMAND ${CMAKE_COMMAND} -E copy_directory "${VB_SRC_DIR}/Scripts" "${VB_OUTPUT_DIR}/Scripts"
    )
else()
    add_custom_command(TARGET Visibility_Buffer POST_BUILD
        COMMAND ${CMAKE_COMMAND} -E copy_if_different "${VB_SRC_DIR}/GPUCfg/gpu.cfg" "${VB_OUTPUT_DIR}/gpu.cfg"
        COMMAND ${CMAKE_COMMAND} -E copy_if_different "${FORGE_ROOT}/Art/cameraPath.txt" "${VB_OUTPUT_DIR}/cameraPath.txt"
        COMMAND ${CMAKE_COMMAND} -E copy_if_different "${FORGE_ROOT}/Art/PathStatement.Windows.txt" "${VB_OUTPUT_DIR}/PathStatement.txt"
        COMMAND ${CMAKE_COMMAND} -E copy_if_different "${FORGE_COMMON}/OS/Windows/pc_gpu.data" "${VB_OUTPUT_DIR}/gpu.data"
        COMMAND ${CMAKE_COMMAND} -E make_directory "${VB_OUTPUT_DIR}/PipelineCaches"
        COMMAND ${CMAKE_COMMAND} -E make_directory "${VB_OUTPUT_DIR}/Screenshots"
        COMMAND ${CMAKE_COMMAND} -E make_directory "${VB_OUTPUT_DIR}/Debug"
        COMMAND ${CMAKE_COMMAND} -E make_directory "${VB_OUTPUT_DIR}/Scripts"
        COMMAND ${CMAKE_COMMAND} -E copy_directory "${FORGE_COMMON}/Scripts" "${VB_OUTPUT_DIR}/Scripts"
        COMMAND ${CMAKE_COMMAND} -E copy_directory "${VB_SRC_DIR}/Scripts" "${VB_OUTPUT_DIR}/Scripts"
    )
endif()
