# Bootstrap example - minimal The-Forge app

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_CURRENT_BINARY_DIR}/bin")

set(FORGE_ROOT ${CMAKE_CURRENT_SOURCE_DIR}/../../The-Forge)
set(FORGE_COMMON ${FORGE_ROOT}/Common_3)

set(BOOTSTRAP_SOURCES main.cpp)

if(TARGET_MACOS)
    # macOSAppDelegate.m is compiled in each example
    set(BOOTSTRAP_MACOS_DELEGATE ${FORGE_COMMON}/OS/Darwin/macOSAppDelegate.m)
    set_source_files_properties(${BOOTSTRAP_MACOS_DELEGATE} PROPERTIES COMPILE_FLAGS "-fobjc-arc")

    # MainMenu.xib - Xcode compiles to NIB automatically
    set(BOOTSTRAP_XIB ${FORGE_ROOT}/Examples_3/Build_Props/XCode/MacOS/Base.lproj/MainMenu.xib)
    set_source_files_properties(${BOOTSTRAP_XIB} PROPERTIES MACOSX_PACKAGE_LOCATION "Resources")

    add_executable(Bootstrap MACOSX_BUNDLE ${BOOTSTRAP_SOURCES} ${BOOTSTRAP_MACOS_DELEGATE} ${BOOTSTRAP_XIB})
    set_target_properties(Bootstrap PROPERTIES
        MACOSX_BUNDLE_GUI_IDENTIFIER "com.The-Forge.Examples.Bootstrap"
        MACOSX_BUNDLE_BUNDLE_NAME "Bootstrap"
        MACOSX_BUNDLE_BUNDLE_VERSION "1.0"
        MACOSX_BUNDLE_SHORT_VERSION_STRING "1.0"
        MACOSX_BUNDLE_COPYRIGHT "Copyright 2017 Confetti. All rights reserved."
        MACOSX_BUNDLE_NSMAIN_NIB_FILE "MainMenu"
    )
    set(BOOTSTRAP_OUTPUT_DIR $<TARGET_BUNDLE_CONTENT_DIR:Bootstrap>/Resources)
elseif(TARGET_IOS)
    # iOSAppDelegate.m is compiled in each example (like macOS)
    set(BOOTSTRAP_IOS_DELEGATE ${FORGE_COMMON}/OS/Darwin/iOSAppDelegate.m)
    set_source_files_properties(${BOOTSTRAP_IOS_DELEGATE} PROPERTIES COMPILE_FLAGS "-fobjc-arc")

    # LaunchScreen.storyboard for iOS
    set(BOOTSTRAP_STORYBOARD ${FORGE_ROOT}/Examples_3/Build_Props/XCode/iOS/Base.lproj/LaunchScreen.storyboard)
    set_source_files_properties(${BOOTSTRAP_STORYBOARD} PROPERTIES MACOSX_PACKAGE_LOCATION "Resources")

    add_executable(Bootstrap MACOSX_BUNDLE ${BOOTSTRAP_SOURCES} ${BOOTSTRAP_IOS_DELEGATE} ${BOOTSTRAP_STORYBOARD})
    set_target_properties(Bootstrap PROPERTIES
        MACOSX_BUNDLE_GUI_IDENTIFIER "com.The-Forge.Examples.Bootstrap"
        MACOSX_BUNDLE_BUNDLE_NAME "Bootstrap"
        MACOSX_BUNDLE_BUNDLE_VERSION "1.0"
        MACOSX_BUNDLE_SHORT_VERSION_STRING "1.0"
        MACOSX_BUNDLE_INFO_PLIST "${FORGE_ROOT}/Examples_3/Build_Props/XCode/iOS/Info.plist"
        XCODE_ATTRIBUTE_TARGETED_DEVICE_FAMILY "1,2"
        XCODE_ATTRIBUTE_IPHONEOS_DEPLOYMENT_TARGET "14.0"
        XCODE_ATTRIBUTE_CODE_SIGN_IDENTITY "iPhone Developer"
        XCODE_ATTRIBUTE_CODE_SIGNING_REQUIRED "YES"
        XCODE_ATTRIBUTE_DEVELOPMENT_TEAM "${CMAKE_XCODE_ATTRIBUTE_DEVELOPMENT_TEAM}"
    )
    set(BOOTSTRAP_OUTPUT_DIR $<TARGET_BUNDLE_CONTENT_DIR:Bootstrap>)
else()
    add_executable(Bootstrap WIN32 ${BOOTSTRAP_SOURCES})
    set(BOOTSTRAP_OUTPUT_DIR $<TARGET_FILE_DIR:Bootstrap>)
endif()

target_link_libraries(Bootstrap Renderer OS)
set_property(TARGET Bootstrap PROPERTY CXX_STANDARD 17)
set_property(TARGET Bootstrap PROPERTY VS_DEBUGGER_WORKING_DIRECTORY "${BOOTSTRAP_OUTPUT_DIR}")

# On Apple platforms, main.cpp needs OBJCXX with ARC
if(APPLE_PLATFORM)
    set_source_files_properties(main.cpp PROPERTIES LANGUAGE OBJCXX COMPILE_FLAGS "-fobjc-arc")
endif()

if(WIN32)
    target_link_libraries(Bootstrap Xinput9_1_0.lib ws2_32.lib)
    target_link_options(Bootstrap PRIVATE /ENTRY:mainCRTStartup)
    if(MSVC)
        target_link_options(Bootstrap PRIVATE /FORCE:MULTIPLE)
    endif()

    add_custom_command(TARGET Bootstrap POST_BUILD
        COMMAND ${CMAKE_COMMAND} -E copy_if_different $<TARGET_RUNTIME_DLLS:Bootstrap> $<TARGET_FILE_DIR:Bootstrap>
        COMMAND_EXPAND_LISTS
    )

    set(DXC_DIR ${FORGE_COMMON}/Graphics/ThirdParty/OpenSource/DirectXShaderCompiler/bin/x64)
    set(D3D12_DIR ${FORGE_COMMON}/Graphics/ThirdParty/OpenSource/Direct3d12Agility/bin/x64)
    add_custom_command(TARGET Bootstrap POST_BUILD
        COMMAND ${CMAKE_COMMAND} -E copy_if_different "${DXC_DIR}/dxcompiler.dll" "${DXC_DIR}/dxil.dll" $<TARGET_FILE_DIR:Bootstrap>
        COMMAND ${CMAKE_COMMAND} -E copy_if_different "${D3D12_DIR}/D3D12Core.dll" "${D3D12_DIR}/d3d12SDKLayers.dll" $<TARGET_FILE_DIR:Bootstrap>
    )
endif()

# Copy resources
if(TARGET_MACOS)
    add_custom_command(TARGET Bootstrap POST_BUILD
        COMMAND ${CMAKE_COMMAND} -E copy_if_different "${CMAKE_CURRENT_SOURCE_DIR}/../PathStatement.CMake.MacOS.txt" "${BOOTSTRAP_OUTPUT_DIR}/PathStatement.txt"
        COMMAND ${CMAKE_COMMAND} -E copy_if_different "${FORGE_COMMON}/OS/Darwin/apple_gpu.data" "${BOOTSTRAP_OUTPUT_DIR}/gpu.data"
        COMMAND ${CMAKE_COMMAND} -E make_directory "${BOOTSTRAP_OUTPUT_DIR}/PipelineCaches"
        COMMAND ${CMAKE_COMMAND} -E make_directory "${BOOTSTRAP_OUTPUT_DIR}/Screenshots"
        COMMAND ${CMAKE_COMMAND} -E make_directory "${BOOTSTRAP_OUTPUT_DIR}/Debug"
        COMMAND ${CMAKE_COMMAND} -E make_directory "${BOOTSTRAP_OUTPUT_DIR}/Scripts"
        COMMAND ${CMAKE_COMMAND} -E copy_directory "${FORGE_COMMON}/Scripts" "${BOOTSTRAP_OUTPUT_DIR}/Scripts"
    )
elseif(TARGET_IOS)
    # iOS apps are sandboxed - ALL assets must be bundled
    add_custom_command(TARGET Bootstrap POST_BUILD
        COMMAND ${CMAKE_COMMAND} -E copy_if_different "${CMAKE_CURRENT_SOURCE_DIR}/../PathStatement.CMake.iOS.txt" "${BOOTSTRAP_OUTPUT_DIR}/PathStatement.txt"
        COMMAND ${CMAKE_COMMAND} -E copy_if_different "${FORGE_COMMON}/OS/Darwin/apple_gpu.data" "${BOOTSTRAP_OUTPUT_DIR}/gpu.data"
        COMMAND ${CMAKE_COMMAND} -E make_directory "${BOOTSTRAP_OUTPUT_DIR}/PipelineCaches"
        COMMAND ${CMAKE_COMMAND} -E make_directory "${BOOTSTRAP_OUTPUT_DIR}/Screenshots"
        COMMAND ${CMAKE_COMMAND} -E make_directory "${BOOTSTRAP_OUTPUT_DIR}/Debug"
        COMMAND ${CMAKE_COMMAND} -E make_directory "${BOOTSTRAP_OUTPUT_DIR}/Scripts"
        COMMAND ${CMAKE_COMMAND} -E copy_directory "${FORGE_COMMON}/Scripts" "${BOOTSTRAP_OUTPUT_DIR}/Scripts"
        # Bundle all required Art assets for iOS
        COMMAND ${CMAKE_COMMAND} -E make_directory "${BOOTSTRAP_OUTPUT_DIR}/Fonts"
        COMMAND ${CMAKE_COMMAND} -E copy_directory "${FORGE_ROOT}/Art/Fonts" "${BOOTSTRAP_OUTPUT_DIR}/Fonts"
        COMMAND ${CMAKE_COMMAND} -E make_directory "${BOOTSTRAP_OUTPUT_DIR}/Textures"
        COMMAND ${CMAKE_COMMAND} -E copy_directory "${FORGE_ROOT}/Art/Textures/dds" "${BOOTSTRAP_OUTPUT_DIR}/Textures"
    )
else()
    add_custom_command(TARGET Bootstrap POST_BUILD
        COMMAND ${CMAKE_COMMAND} -E copy_if_different "${FORGE_ROOT}/Art/PathStatement.Windows.txt" "${BOOTSTRAP_OUTPUT_DIR}/PathStatement.txt"
        COMMAND ${CMAKE_COMMAND} -E copy_if_different "${FORGE_COMMON}/OS/Windows/pc_gpu.data" "${BOOTSTRAP_OUTPUT_DIR}/gpu.data"
        COMMAND ${CMAKE_COMMAND} -E make_directory "${BOOTSTRAP_OUTPUT_DIR}/PipelineCaches"
        COMMAND ${CMAKE_COMMAND} -E make_directory "${BOOTSTRAP_OUTPUT_DIR}/Screenshots"
        COMMAND ${CMAKE_COMMAND} -E make_directory "${BOOTSTRAP_OUTPUT_DIR}/Debug"
        COMMAND ${CMAKE_COMMAND} -E make_directory "${BOOTSTRAP_OUTPUT_DIR}/Scripts"
        COMMAND ${CMAKE_COMMAND} -E copy_directory "${FORGE_COMMON}/Scripts" "${BOOTSTRAP_OUTPUT_DIR}/Scripts"
    )
endif()
