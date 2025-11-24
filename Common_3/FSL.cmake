# FSL.cmake - Forge Shading Language compilation
# Provides compile_fsl_shaders() function

find_package(Python3 REQUIRED COMPONENTS Interpreter)
set(FSL_PYTHON "${Python3_EXECUTABLE}" CACHE INTERNAL "Python for FSL")

set(FSL_TOOL "${CMAKE_CURRENT_LIST_DIR}/../The-Forge/Common_3/Tools/ForgeShadingLanguage/fsl.py" CACHE INTERNAL "")
set(FSL_COMMON_DIR "${CMAKE_CURRENT_LIST_DIR}/../The-Forge/Common_3" CACHE INTERNAL "")

# compile_fsl_shaders(TARGET <target> SHADERS <list_file> OUTPUT_DIR <dir> LANGUAGE <lang> [WORKING_DIR <dir>])
function(compile_fsl_shaders)
    cmake_parse_arguments(FSL "" "TARGET;SHADERS;OUTPUT_DIR;LANGUAGE;WORKING_DIR" "" ${ARGN})

    if(NOT FSL_WORKING_DIR)
        get_filename_component(FSL_WORKING_DIR "${FSL_SHADERS}" DIRECTORY)
    endif()

    add_custom_command(TARGET ${FSL_TARGET} POST_BUILD
        COMMAND ${CMAKE_COMMAND} -E make_directory "${FSL_OUTPUT_DIR}/Shaders"
        COMMAND ${CMAKE_COMMAND} -E make_directory "${FSL_OUTPUT_DIR}/CompiledShaders"
        COMMAND "${FSL_PYTHON}" ${FSL_TOOL}
            -d "${FSL_OUTPUT_DIR}/Shaders"
            -b "${FSL_OUTPUT_DIR}/CompiledShaders"
            -l ${FSL_LANGUAGE}
            --compile "${FSL_SHADERS}"
        WORKING_DIRECTORY ${FSL_WORKING_DIR}
        COMMENT "Compiling FSL shaders: ${FSL_SHADERS}"
    )
endfunction()

# compile_common_shaders(TARGET <target> OUTPUT_DIR <dir> LANGUAGE <lang>)
function(compile_common_shaders)
    cmake_parse_arguments(FSL "" "TARGET;OUTPUT_DIR;LANGUAGE" "" ${ARGN})

    add_custom_command(TARGET ${FSL_TARGET} POST_BUILD
        COMMAND "${FSL_PYTHON}" ${FSL_TOOL}
            -d "${FSL_OUTPUT_DIR}/Shaders"
            -b "${FSL_OUTPUT_DIR}/CompiledShaders"
            -l ${FSL_LANGUAGE}
            --compile "Common_3/Application/Screenshot/Shaders/FSL/ScreenshotShaders.list"
        COMMAND "${FSL_PYTHON}" ${FSL_TOOL}
            -d "${FSL_OUTPUT_DIR}/Shaders"
            -b "${FSL_OUTPUT_DIR}/CompiledShaders"
            -l ${FSL_LANGUAGE}
            --compile "Common_3/Application/UI/Shaders/FSL/UIShaders.list"
        COMMAND "${FSL_PYTHON}" ${FSL_TOOL}
            -d "${FSL_OUTPUT_DIR}/Shaders"
            -b "${FSL_OUTPUT_DIR}/CompiledShaders"
            -l ${FSL_LANGUAGE}
            --compile "Common_3/Application/Fonts/Shaders/FSL/FontShaders.list"
        WORKING_DIRECTORY ${FSL_COMMON_DIR}/..
        COMMENT "Compiling common shaders (Screenshot, UI, Fonts)"
    )
endfunction()
