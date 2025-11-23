# TheForge.cmake - The-Forge v1.60+
# Main library creation

# Combine all source files
set(FORGE_FILES
    ${RENDERER_SOURCE_FILES}
    ${RENDERER_FILES}
    ${OS_FILES}
    ${APPLICATION_FILES}
    ${UTILITIES_FILES}
    ${GAME_FILES}
    ${ANIMATION_FILES}
)

# Create library
if(DYNAMIC_LIB)
    add_library(The-Forge SHARED ${FORGE_FILES})
else()
    add_library(The-Forge STATIC ${FORGE_FILES})
endif()

# Include directories
target_include_directories(The-Forge PUBLIC
    ../The-Forge/Common_3/
    ../The-Forge/Common_3/Application/
    ../The-Forge/Common_3/Application/Interfaces/
    ../The-Forge/Common_3/Game/
    ../The-Forge/Common_3/Game/Interfaces/
    ../The-Forge/Common_3/Graphics/
    ../The-Forge/Common_3/Graphics/Interfaces/
    ../The-Forge/Common_3/OS/
    ../The-Forge/Common_3/OS/Interfaces/
    ../The-Forge/Common_3/Renderer/
    ../The-Forge/Common_3/Renderer/Interfaces/
    ../The-Forge/Common_3/Resources/
    ../The-Forge/Common_3/Resources/ResourceLoader/
    ../The-Forge/Common_3/Resources/ResourceLoader/Interfaces/
    ../The-Forge/Common_3/Resources/AnimationSystem/Animation/
    ../The-Forge/Common_3/Utilities/
    ../The-Forge/Common_3/Utilities/Interfaces/
    ../The-Forge/Common_3/Utilities/ThirdParty/OpenSource/
    ${RENDER_INCLUDES}
)

# Link libraries
target_link_libraries(The-Forge PUBLIC 
    ${RENDER_LIBRARIES} 
    ${THIRD_PARTY_DEPS}
)

# Link directories
target_link_directories(The-Forge PUBLIC ${RENDER_LIBRARY_PATHS})

# Compile definitions
target_compile_definitions(The-Forge PUBLIC ${RENDER_DEFINES})

# D3D12 Agility SDK version
if(DX12)
    target_compile_definitions(The-Forge PUBLIC D3D12_AGILITY_SDK_VERSION=715)
endif()

# C++ standard
set_property(TARGET The-Forge PROPERTY CXX_STANDARD 17)

# Platform-specific settings
if(APPLE_PLATFORM)
    target_compile_options(The-Forge PRIVATE "-fobjc-arc")
    set_source_files_properties(
        ${OS_DARWIN_FILES} ${OS_MACOS_FILES}
        PROPERTIES COMPILE_FLAGS "-x objective-c++"
    )
endif()

if(WINDOWS)
    target_compile_definitions(The-Forge PRIVATE
        _CRT_SECURE_NO_WARNINGS
        _CRT_NONSTDC_NO_DEPRECATE
    )
endif()
