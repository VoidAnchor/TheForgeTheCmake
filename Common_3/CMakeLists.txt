# Dependencies

set(MIDDLEWARE_ECS_FILES
    ../The-Forge/Middleware_3/ECS/BaseComponent.cpp
    ../The-Forge/Middleware_3/ECS/BaseComponent.h
    ../The-Forge/Middleware_3/ECS/ComponentRepresentation.cpp
    ../The-Forge/Middleware_3/ECS/ComponentRepresentation.h
    ../The-Forge/Middleware_3/ECS/EntityManager.cpp
    ../The-Forge/Middleware_3/ECS/EntityManager.h
)
 
include(ozz.cmake)
include(SpirVTools.cmake)
include(Dependencies.cmake)
include(OS.cmake)
include(Renderer.cmake)
include(TheForge.cmake)
include(AssetPipeline.cmake)
  