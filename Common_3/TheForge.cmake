# TheForge.cmake - The-Forge v1.60+
# Creates OS and Renderer libraries

set(FORGE_INCLUDES
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

# OS library
add_library(OS STATIC ${OS_FILES} ${APPLICATION_FILES} ${UTILITIES_FILES} ${GAME_FILES} ${ANIMATION_FILES})
target_include_directories(OS PUBLIC ${FORGE_INCLUDES})
target_link_libraries(OS PUBLIC ${THIRD_PARTY_DEPS})
target_compile_definitions(OS PUBLIC ${RENDER_DEFINES})
set_property(TARGET OS PROPERTY CXX_STANDARD 17)
if(WINDOWS)
    target_compile_definitions(OS PRIVATE _CRT_SECURE_NO_WARNINGS _CRT_NONSTDC_NO_DEPRECATE)
endif()

# Renderer library
add_library(Renderer STATIC ${RENDERER_SOURCE_FILES} ${RENDERER_FILES})
target_include_directories(Renderer PUBLIC ${FORGE_INCLUDES})
target_link_libraries(Renderer PUBLIC ${RENDER_LIBRARIES})
target_link_directories(Renderer PUBLIC ${RENDER_LIBRARY_PATHS})
target_compile_definitions(Renderer PUBLIC ${RENDER_DEFINES})
set_property(TARGET Renderer PROPERTY CXX_STANDARD 17)
if(DX12)
    target_compile_definitions(Renderer PUBLIC D3D12_AGILITY_SDK_VERSION=715)
endif()
if(WINDOWS)
    target_compile_definitions(Renderer PRIVATE _CRT_SECURE_NO_WARNINGS _CRT_NONSTDC_NO_DEPRECATE)
endif()
