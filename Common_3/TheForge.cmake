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

target_include_directories(The-Forge PUBLIC
    ../The-Forge/Common_3/
    ${RENDER_INCLUDES}
)

target_link_libraries(The-Forge PUBLIC ${RENDER_LIBRARIES} ${THIRD_PARTY_DEPS})

target_link_directories(The-Forge PUBLIC ${RENDER_LIBRARY_PATHS})

target_compile_definitions(The-Forge PUBLIC ${RENDER_DEFINES})

if (${APPLE_PLATFORM} MATCHES ON)

    macro (set_xcode_property TARGET XCODE_PROPERTY XCODE_VALUE)
        set_property (TARGET ${TARGET} PROPERTY
                XCODE_ATTRIBUTE_${XCODE_PROPERTY} ${XCODE_VALUE})
    endmacro (set_xcode_property)

    if (APPLE)
        set_xcode_property(The-Forge CLANG_CXX_LANGUAGE_STANDARD "c++17")
        set_xcode_property(The-Forge CLANG_CXX_LIBRARY "libc++")
    endif (APPLE)

    target_compile_options(The-Forge PRIVATE "-fobjc-arc")
endif()
