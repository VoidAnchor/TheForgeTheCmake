project(01_Transformations)

set(TRANFROMATIONS_FILES
    ../../../The-Forge/Examples_3/Unit_Tests/src/01_Transformations/01_Transformations.cpp
)

add_executable(01_Transformations ${TRANFROMATIONS_FILES})

target_link_libraries(01_Transformations The-Forge)

set_property(TARGET 01_Transformations PROPERTY CXX_STANDARD 17)
