# OS Files - The-Forge v1.60+

set(OS_DIR ${CMAKE_CURRENT_SOURCE_DIR}/../The-Forge/Common_3/OS)

# OS Interfaces
set(OS_INTERFACES_FILES
    ${OS_DIR}/Interfaces/IInput.h
    ${OS_DIR}/Interfaces/IOperatingSystem.h
)

# CPU Config
set(OS_CPUCONFIG_FILES
    ${OS_DIR}/CPUConfig.cpp
    ${OS_DIR}/CPUConfig.h
)

# Input/HID - Note: HIDInput.cpp and hidapi are NOT used on macOS (uses DarwinInput.mm instead)
set(OS_INPUT_HEADERS
    ${OS_DIR}/Input/HID/HIDInput.h
    ${OS_DIR}/Input/HID/HIDParserPS4Controller.h
    ${OS_DIR}/Input/HID/HIDParserPS5Controller.h
    ${OS_DIR}/Input/HID/HIDParserSwitchController.h
    ${OS_DIR}/Input/InputCommon.h
    ${OS_DIR}/Input/TouchInput.h
)

# HIDInput.cpp is only for Windows/Linux, not macOS
set(OS_INPUT_FILES ${OS_INPUT_HEADERS})
if(NOT APPLE_PLATFORM)
    list(APPEND OS_INPUT_FILES ${OS_DIR}/Input/HID/HIDInput.cpp)
endif()

# Window System
set(OS_WINDOWSYSTEM_FILES
    ${OS_DIR}/WindowSystem/WindowSystem.cpp
)

# Android platform files
set(OS_ANDROID_FILES
    ${OS_DIR}/Android/android_native_app_glue.c
    ${OS_DIR}/Android/AndroidBase.cpp
    ${OS_DIR}/Android/AndroidFileSystem.cpp
    ${OS_DIR}/Android/AndroidInput.cpp
    ${OS_DIR}/Android/AndroidLog.c
    ${OS_DIR}/Android/AndroidThread.c
    ${OS_DIR}/Android/AndroidTime.c
    ${OS_DIR}/Android/AndroidToolsFileSystem.cpp
    ${OS_DIR}/Android/AndroidWindow.cpp
)

# Linux platform files
set(OS_LINUX_FILES
    ${OS_DIR}/Linux/LinuxBase.cpp
    ${OS_DIR}/Linux/LinuxFileSystem.c
    ${OS_DIR}/Linux/LinuxInput.cpp
    ${OS_DIR}/Linux/LinuxLog.c
    ${OS_DIR}/Linux/LinuxThread.c
    ${OS_DIR}/Linux/LinuxTime.c
    ${OS_DIR}/Linux/LinuxToolsFileSystem.c
    ${OS_DIR}/Linux/LinuxWindow.cpp
)

# Windows platform files
set(OS_WINDOWS_FILES
    ${OS_DIR}/Windows/WindowsBase.cpp
    ${OS_DIR}/Windows/WindowsFileSystem.cpp
    ${OS_DIR}/Windows/WindowsInput.cpp
    ${OS_DIR}/Windows/WindowsLog.c
    ${OS_DIR}/Windows/WindowsStackTraceDump.cpp
    ${OS_DIR}/Windows/WindowsStackTraceDump.h
    ${OS_DIR}/Windows/WindowsThread.c
    ${OS_DIR}/Windows/WindowsTime.c
    ${OS_DIR}/Windows/WindowsToolsFileSystem.cpp
    ${OS_DIR}/Windows/WindowsWindow.cpp
)

# Darwin (macOS/iOS) common files
set(OS_DARWIN_FILES
    ${OS_DIR}/Darwin/CocoaFileSystem.mm
    ${OS_DIR}/Darwin/CocoaToolsFileSystem.mm
    ${OS_DIR}/Darwin/DarwinInput.mm
    ${OS_DIR}/Darwin/DarwinLog.c
    ${OS_DIR}/Darwin/DarwinThread.c
)

# macOS specific files
# Note: macOSAppDelegate.m is NOT in the library - it's compiled in each example
set(OS_MACOS_FILES
    ${OS_DIR}/Darwin/macOSBase.mm
    ${OS_DIR}/Darwin/macOSWindow.mm
)

# iOS specific files  
set(OS_IOS_FILES
    ${OS_DIR}/Darwin/iOSBase.mm
    ${OS_DIR}/Darwin/iOSAppDelegate.h
    ${OS_DIR}/Darwin/iOSAppDelegate.m
    ${OS_DIR}/Darwin/iOSToolsFileSystem.mm
    ${OS_DIR}/Darwin/iOSWindow.mm
)

# Third party - cpu_features
set(OS_CPU_FEATURES_DIR ${OS_DIR}/ThirdParty/OpenSource/cpu_features/src)
set(OS_CPU_FEATURES_COMMON
    ${OS_CPU_FEATURES_DIR}/bit_utils.h
    ${OS_CPU_FEATURES_DIR}/cpu_features_cache_info.h
    ${OS_CPU_FEATURES_DIR}/cpu_features_macros.h
    ${OS_CPU_FEATURES_DIR}/cpu_features_types.h
)

set(OS_CPU_FEATURES_WINDOWS
    ${OS_CPU_FEATURES_DIR}/impl_x86_windows.c
)

set(OS_CPU_FEATURES_LINUX
    ${OS_CPU_FEATURES_DIR}/impl_x86_linux_or_android.c
    ${OS_CPU_FEATURES_DIR}/impl_aarch64_linux_or_android.c
    ${OS_CPU_FEATURES_DIR}/hwcaps.c
    ${OS_CPU_FEATURES_DIR}/hwcaps.h
)

set(OS_CPU_FEATURES_MACOS
    ${OS_CPU_FEATURES_DIR}/impl_x86_macos.c
    ${OS_CPU_FEATURES_DIR}/impl_aarch64_iOS.c
)

# Third party - hidapi
set(OS_HIDAPI_DIR ${OS_DIR}/ThirdParty/OpenSource/hidapi)
set(OS_HIDAPI_WINDOWS ${OS_HIDAPI_DIR}/windows/hid.c)
set(OS_HIDAPI_LINUX ${OS_HIDAPI_DIR}/linux/hid.c)
set(OS_HIDAPI_MACOS ${OS_HIDAPI_DIR}/mac/hid.c)


# Source groups for IDE organization
source_group(OS/Interfaces FILES ${OS_INTERFACES_FILES})
source_group(OS/Input FILES ${OS_INPUT_FILES})
source_group(OS/WindowSystem FILES ${OS_WINDOWSYSTEM_FILES})

# Platform specific setup
set(OS_PLATFORM_SPECIFIC_FILES "")

if(APPLE_PLATFORM)
    source_group(OS/Darwin FILES ${OS_DARWIN_FILES} ${OS_MACOS_FILES})
    # Note: hidapi is NOT used on macOS - DarwinInput.mm uses native APIs
    set(OS_PLATFORM_SPECIFIC_FILES
        ${OS_DARWIN_FILES}
        ${OS_MACOS_FILES}
        ${OS_CPU_FEATURES_MACOS}
    )
endif()

if(WINDOWS)
    source_group(OS/Windows FILES ${OS_WINDOWS_FILES})
    set(OS_PLATFORM_SPECIFIC_FILES 
        ${OS_WINDOWS_FILES}
        ${OS_CPU_FEATURES_WINDOWS}
        ${OS_HIDAPI_WINDOWS}
    )
endif()

if(LINUX)
    source_group(OS/Linux FILES ${OS_LINUX_FILES})
    set(OS_PLATFORM_SPECIFIC_FILES 
        ${OS_LINUX_FILES}
        ${OS_CPU_FEATURES_LINUX}
        ${OS_HIDAPI_LINUX}
    )
endif()

# Combined OS files
set(OS_FILES
    ${OS_INTERFACES_FILES}
    ${OS_CPUCONFIG_FILES}
    ${OS_INPUT_FILES}
    ${OS_WINDOWSYSTEM_FILES}
    ${OS_CPU_FEATURES_COMMON}
    ${OS_PLATFORM_SPECIFIC_FILES}
)

# On Apple platforms, enable ARC for Objective-C/C++ files
if(APPLE_PLATFORM)
    set_source_files_properties(
        ${OS_DIR}/Darwin/CocoaFileSystem.mm
        ${OS_DIR}/Darwin/CocoaToolsFileSystem.mm
        ${OS_DIR}/Darwin/DarwinInput.mm
        ${OS_DIR}/Darwin/macOSBase.mm
        ${OS_DIR}/Darwin/macOSWindow.mm
        PROPERTIES COMPILE_FLAGS "-fobjc-arc"
    )

    # These C++ files include Metal/AppKit headers and must be compiled as Objective-C++
    # (based on Xcode project: explicitFileType = sourcecode.cpp.objcpp)
    set_source_files_properties(
        ${OS_DIR}/WindowSystem/WindowSystem.cpp
        PROPERTIES LANGUAGE OBJCXX COMPILE_FLAGS "-fobjc-arc"
    )
endif()
