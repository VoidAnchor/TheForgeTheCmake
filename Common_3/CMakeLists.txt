# Dependencies

set(MIDDLEWARE_ECS_FILES
    ../The-Forge/Middleware_3/ECS/BaseComponent.cpp
    ../The-Forge/Middleware_3/ECS/BaseComponent.h
    ../The-Forge/Middleware_3/ECS/ComponentRepresentation.cpp
    ../The-Forge/Middleware_3/ECS/ComponentRepresentation.h
    ../The-Forge/Middleware_3/ECS/EntityManager.cpp
    ../The-Forge/Middleware_3/ECS/EntityManager.h
)

set (CMAKE_CXX_STANDARD 17)

if(${APPLE_PLATFORM} MATCHES ON)
    add_compile_options(-x objective-c++)
endif()

include(SpirVTools.cmake)
include(Dependencies.cmake)
include(OS.cmake)
include(Renderer.cmake)
include(TheForge.cmake)
include(AssetPipeline.cmake)
  