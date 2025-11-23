set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_CURRENT_BINARY_DIR}/bin")

add_executable(Bootstrap main.cpp)
target_link_libraries(Bootstrap The-Forge)
set_property(TARGET Bootstrap PROPERTY CXX_STANDARD 17)

# Allow duplicate symbols from dxguid.lib
if(MSVC)
    target_link_options(Bootstrap PRIVATE /FORCE:MULTIPLE)
endif()

# Copy DLLs on Windows
if(WIN32)
    add_custom_command(TARGET Bootstrap POST_BUILD
        COMMAND ${CMAKE_COMMAND} -E copy_if_different
            $<TARGET_RUNTIME_DLLS:Bootstrap> $<TARGET_FILE_DIR:Bootstrap>
        COMMAND_EXPAND_LISTS
    )
endif()
