project(01_Transformations)

set(TRANSFORMATIONS_FILES
    ../../../The-Forge/Examples_3/Unit_Tests/src/01_Transformations/01_Transformations.cpp
)

if(APPLE_PLATFORM)
    add_executable(01_Transformations MACOSX_BUNDLE ${TRANSFORMATIONS_FILES})
else()
    add_executable(01_Transformations ${TRANSFORMATIONS_FILES})
endif()

target_link_libraries(01_Transformations The-Forge)
set_property(TARGET 01_Transformations PROPERTY CXX_STANDARD 17)
