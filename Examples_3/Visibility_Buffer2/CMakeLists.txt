# Visibility_Buffer2 example - The-Forge v1.60+

find_package(Python3 REQUIRED COMPONENTS Interpreter)

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_CURRENT_BINARY_DIR}/bin")

set(VB2_SRC_DIR ${CMAKE_CURRENT_SOURCE_DIR}/../../The-Forge/Examples_3/Visibility_Buffer2/src)

set(VB2_SOURCES
    ${VB2_SRC_DIR}/Visibility_Buffer.cpp
    ${VB2_SRC_DIR}/SanMiguel.cpp
    ${VB2_SRC_DIR}/SanMiguelSDF.cpp
)

set(VB2_HEADERS
    ${VB2_SRC_DIR}/SanMiguel.h
    ${VB2_SRC_DIR}/SanMiguelSDF.h
)

source_group("Source Files" FILES ${VB2_SOURCES})
source_group("Header Files" FILES ${VB2_HEADERS})

add_executable(Visibility_Buffer2 WIN32 ${VB2_SOURCES} ${VB2_HEADERS})

target_link_libraries(Visibility_Buffer2 Renderer OS)
set_property(TARGET Visibility_Buffer2 PROPERTY CXX_STANDARD 17)
set_property(TARGET Visibility_Buffer2 PROPERTY VS_DEBUGGER_WORKING_DIRECTORY "${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/$<CONFIG>")

if(WIN32)
    target_link_libraries(Visibility_Buffer2 Xinput9_1_0.lib ws2_32.lib)
    target_link_options(Visibility_Buffer2 PRIVATE /ENTRY:mainCRTStartup)
    if(MSVC)
        target_link_options(Visibility_Buffer2 PRIVATE /FORCE:MULTIPLE)
    endif()

    add_custom_command(TARGET Visibility_Buffer2 POST_BUILD
        COMMAND ${CMAKE_COMMAND} -E copy_if_different $<TARGET_RUNTIME_DLLS:Visibility_Buffer2> $<TARGET_FILE_DIR:Visibility_Buffer2>
        COMMAND_EXPAND_LISTS
    )

    set(DXC_DIR ${CMAKE_CURRENT_SOURCE_DIR}/../../The-Forge/Common_3/Graphics/ThirdParty/OpenSource/DirectXShaderCompiler/bin/x64)
    add_custom_command(TARGET Visibility_Buffer2 POST_BUILD
        COMMAND ${CMAKE_COMMAND} -E copy_if_different "${DXC_DIR}/dxcompiler.dll" "${DXC_DIR}/dxil.dll" $<TARGET_FILE_DIR:Visibility_Buffer2>
    )

    set(D3D12_AGILITY_DIR ${CMAKE_CURRENT_SOURCE_DIR}/../../The-Forge/Common_3/Graphics/ThirdParty/OpenSource/Direct3d12Agility/bin/x64)
    add_custom_command(TARGET Visibility_Buffer2 POST_BUILD
        COMMAND ${CMAKE_COMMAND} -E copy_if_different "${D3D12_AGILITY_DIR}/D3D12Core.dll" "${D3D12_AGILITY_DIR}/d3d12SDKLayers.dll" $<TARGET_FILE_DIR:Visibility_Buffer2>
    )
endif()

set(FSL_TOOL ${CMAKE_CURRENT_SOURCE_DIR}/../../The-Forge/Common_3/Tools/ForgeShadingLanguage/fsl.py)
set(FSL_SHADERS_LIST ${VB2_SRC_DIR}/Shaders/FSL/shaders.list)
set(VB2_OUTPUT_DIR ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/$<CONFIG>)
set(FORGE_ROOT ${CMAKE_CURRENT_SOURCE_DIR}/../../The-Forge)
set(FORGE_COMMON ${FORGE_ROOT}/Common_3)

if(DX12)
    set(FSL_LANGUAGE "DIRECT3D12")
elseif(VULKAN)
    set(FSL_LANGUAGE "VULKAN")
endif()

add_custom_command(TARGET Visibility_Buffer2 POST_BUILD
    COMMAND ${CMAKE_COMMAND} -E make_directory "${VB2_OUTPUT_DIR}/Shaders"
    COMMAND ${CMAKE_COMMAND} -E make_directory "${VB2_OUTPUT_DIR}/CompiledShaders"
    COMMAND ${Python3_EXECUTABLE} ${FSL_TOOL} -d "${VB2_OUTPUT_DIR}/Shaders" -b "${VB2_OUTPUT_DIR}/CompiledShaders" -l ${FSL_LANGUAGE} --compile ${FSL_SHADERS_LIST}
    WORKING_DIRECTORY ${VB2_SRC_DIR}/Shaders/FSL
    COMMENT "Compiling VB2 shaders"
)

add_custom_command(TARGET Visibility_Buffer2 POST_BUILD
    COMMAND ${Python3_EXECUTABLE} ${FSL_TOOL} -d "${VB2_OUTPUT_DIR}/Shaders" -b "${VB2_OUTPUT_DIR}/CompiledShaders" -l ${FSL_LANGUAGE} --compile "Common_3/Application/Screenshot/Shaders/FSL/ScreenshotShaders.list"
    COMMAND ${Python3_EXECUTABLE} ${FSL_TOOL} -d "${VB2_OUTPUT_DIR}/Shaders" -b "${VB2_OUTPUT_DIR}/CompiledShaders" -l ${FSL_LANGUAGE} --compile "Common_3/Application/UI/Shaders/FSL/UIShaders.list"
    COMMAND ${Python3_EXECUTABLE} ${FSL_TOOL} -d "${VB2_OUTPUT_DIR}/Shaders" -b "${VB2_OUTPUT_DIR}/CompiledShaders" -l ${FSL_LANGUAGE} --compile "Common_3/Application/Fonts/Shaders/FSL/FontShaders.list"
    WORKING_DIRECTORY ${FORGE_ROOT}
    COMMENT "Compiling common shaders"
)

add_custom_command(TARGET Visibility_Buffer2 POST_BUILD
    COMMAND ${CMAKE_COMMAND} -E copy_if_different "${VB2_SRC_DIR}/GPUCfg/gpu.cfg" "${VB2_OUTPUT_DIR}/gpu.cfg"
    COMMAND ${CMAKE_COMMAND} -E copy_if_different "${FORGE_ROOT}/Art/cameraPath.txt" "${VB2_OUTPUT_DIR}/cameraPath.txt"
    COMMAND ${CMAKE_COMMAND} -E copy_if_different "${CMAKE_CURRENT_SOURCE_DIR}/PathStatement.txt" "${VB2_OUTPUT_DIR}/PathStatement.txt"
    COMMAND ${CMAKE_COMMAND} -E copy_if_different "${FORGE_COMMON}/OS/Windows/pc_gpu.data" "${VB2_OUTPUT_DIR}/gpu.data"
    COMMAND ${CMAKE_COMMAND} -E make_directory "${VB2_OUTPUT_DIR}/PipelineCaches"
    COMMAND ${CMAKE_COMMAND} -E make_directory "${VB2_OUTPUT_DIR}/Screenshots"
    COMMAND ${CMAKE_COMMAND} -E make_directory "${VB2_OUTPUT_DIR}/Debug"
    COMMAND ${CMAKE_COMMAND} -E make_directory "${VB2_OUTPUT_DIR}/Scripts"
    COMMAND ${CMAKE_COMMAND} -E copy_directory "${FORGE_COMMON}/Scripts" "${VB2_OUTPUT_DIR}/Scripts"
    COMMENT "Copying resources"
)
