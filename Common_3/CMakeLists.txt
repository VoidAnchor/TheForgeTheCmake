# Common_3 CMakeLists.txt - The-Forge v1.60+

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Fix behavior of CMAKE_CXX_STANDARD when targeting macOS
if(POLICY CMP0025)
    cmake_policy(SET CMP0025 NEW)
endif()

# Include all module definitions
include(Dependencies.cmake)
include(OS.cmake)
include(Utilities.cmake)
include(Application.cmake)
include(Game.cmake)
include(Renderer.cmake)
include(TheForge.cmake)
