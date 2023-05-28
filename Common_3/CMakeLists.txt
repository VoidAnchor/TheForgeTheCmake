# Dependencies

set(MIDDLEWARE_ECS_FILES
    ../The-Forge/Middleware_3/ECS/BaseComponent.cpp
    ../The-Forge/Middleware_3/ECS/ComponentRepresentation.cpp
    ../The-Forge/Middleware_3/ECS/EntityManager.cpp
)

set(CMAKE_CXX_STANDARD 17)
# Fix behavior of CMAKE_CXX_STANDARD when targeting macOS.
if (POLICY CMP0025)
    cmake_policy(SET CMP0025 NEW)
endif ()

include(SpirVTools.cmake)
include(Dependencies.cmake)
include(OS.cmake)
include(Renderer.cmake)
include(TheForge.cmake)
include(AssetPipeline.cmake)
  