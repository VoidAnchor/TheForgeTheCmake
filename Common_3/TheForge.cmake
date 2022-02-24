project(The-Forge)

# Handle library creation here.

set(FORGE_FILES
        ${RENDERER_SOURCE_FILES}
        ${RENDERER_INCLUDE_FILES}
        ${RENDERER_FILES}
        ${OS_CAMERA_FILES}
        ${OS_CORE_FILES}
        ${OS_FILESYSTEM_FILES}
        ${OS_FONT_FILES}
        ${OS_FONT_SHADER_FILES}
        ${OS_INPUT_FILES}
        ${OS_INTERFACES_FILES}
        ${OS_LOGGING_FILES}
        ${OS_MATH_FILES}
        ${OS_MEMORYTRACKING_FILES}
        ${OS_MIDDLEWARE_FILES}
        ${OS_MIDDLEWARE_PANINI_SHADER_FILES}
        ${OS_PROFILER_FILES}
        ${OS_SCRIPTING_FILES}
        ${OS_UI_FILES}
        ${OS_UI_SHADER_FILES}
        ${OS_MIDDLEWARE_ANIMATION_FILES}
        ${OS_MIDDLEWARE_PARALLEL_PRIMS_FILES}
        ${OS_PLATFORM_SPECIFIC_FILES}
)

if(${DYNAMIC_LIB} MATCHES OFF)
    add_library(The-Forge STATIC
        ${FORGE_FILES}
    )

else()
    add_library(The-Forge SHARED
        ${FORGE_FILES}
    )
endif()


set_property(TARGET The-Forge PROPERTY CXX_STANDARD 17)

target_link_libraries(The-Forge PUBLIC The-Forge-Dependencies ozz_animation ${GLOBAL_LIBRARIES} ${RENDER_LIBRARIES})

target_compile_definitions(The-Forge PUBLIC ${GLOBAL_DEFINES})

if (${APPLE_PLATFORM} MATCHES ON)
    set_property (TARGET The-Forge APPEND_STRING PROPERTY COMPILE_FLAGS "-fobjc-arc")
endif()