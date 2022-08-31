set(CMAKE_LIBRARY_OUTPUT_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/bin")
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/bin")

add_executable(Bootstrap main.cpp)
target_link_libraries(Bootstrap The-Forge)

add_custom_command(TARGET Bootstrap POST_BUILD
    COMMAND ${CMAKE_COMMAND} -E copy $<TARGET_RUNTIME_DLLS:Bootstrap> $<TARGET_FILE_DIR:Bootstrap>
    COMMAND_EXPAND_LISTS
)
