# TheForge.cmake - The-Forge v1.60+
# Creates OS and Renderer libraries

set(FORGE_INCLUDES
    ${CMAKE_CURRENT_SOURCE_DIR}/../The-Forge/Common_3/
    ${CMAKE_CURRENT_SOURCE_DIR}/../The-Forge/Common_3/Application/
    ${CMAKE_CURRENT_SOURCE_DIR}/../The-Forge/Common_3/Application/Interfaces/
    ${CMAKE_CURRENT_SOURCE_DIR}/../The-Forge/Common_3/Game/
    ${CMAKE_CURRENT_SOURCE_DIR}/../The-Forge/Common_3/Game/Interfaces/
    ${CMAKE_CURRENT_SOURCE_DIR}/../The-Forge/Common_3/Graphics/
    ${CMAKE_CURRENT_SOURCE_DIR}/../The-Forge/Common_3/Graphics/Interfaces/
    ${CMAKE_CURRENT_SOURCE_DIR}/../The-Forge/Common_3/OS/
    ${CMAKE_CURRENT_SOURCE_DIR}/../The-Forge/Common_3/OS/Interfaces/
    ${CMAKE_CURRENT_SOURCE_DIR}/../The-Forge/Common_3/Renderer/
    ${CMAKE_CURRENT_SOURCE_DIR}/../The-Forge/Common_3/Renderer/Interfaces/
    ${CMAKE_CURRENT_SOURCE_DIR}/../The-Forge/Common_3/Resources/
    ${CMAKE_CURRENT_SOURCE_DIR}/../The-Forge/Common_3/Resources/ResourceLoader/
    ${CMAKE_CURRENT_SOURCE_DIR}/../The-Forge/Common_3/Resources/ResourceLoader/Interfaces/
    ${CMAKE_CURRENT_SOURCE_DIR}/../The-Forge/Common_3/Resources/AnimationSystem/Animation/
    ${CMAKE_CURRENT_SOURCE_DIR}/../The-Forge/Common_3/Utilities/
    ${CMAKE_CURRENT_SOURCE_DIR}/../The-Forge/Common_3/Utilities/Interfaces/
    ${CMAKE_CURRENT_SOURCE_DIR}/../The-Forge/Common_3/Utilities/ThirdParty/OpenSource/
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
