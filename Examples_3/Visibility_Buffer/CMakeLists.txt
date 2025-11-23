# Visibility_Buffer example - The-Forge v1.60+

# Find Python for FSL shader compilation
find_package(Python3 REQUIRED COMPONENTS Interpreter)

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_CURRENT_BINARY_DIR}/bin")

# Source directory in The-Forge
set(VB_SRC_DIR ${CMAKE_CURRENT_SOURCE_DIR}/../../The-Forge/Examples_3/Visibility_Buffer/src)

# Source files
set(VB_SOURCES
    ${VB_SRC_DIR}/Visibility_Buffer.cpp
    ${VB_SRC_DIR}/SanMiguel.cpp
)

# Header files (for IDE)
set(VB_HEADERS
    ${VB_SRC_DIR}/SanMiguel.h
    ${VB_SRC_DIR}/SanMiguelSDF.h
    ${VB_SRC_DIR}/Shaders/FSL/GLobal.srt.h
    ${VB_SRC_DIR}/Shaders/FSL/GodrayBlur.srt.h
    ${VB_SRC_DIR}/Shaders/FSL/LightClusters.srt.h
    ${VB_SRC_DIR}/Shaders/FSL/PerFrameSet.h
    ${VB_SRC_DIR}/Shaders/FSL/PersistentSet.h
    ${VB_SRC_DIR}/Shaders/FSL/Resolve.srt.h
    ${VB_SRC_DIR}/Shaders/FSL/TriangleFiltering.srt.h
)

# FSL shader files (for IDE)
set(VB_SHADERS
    ${VB_SRC_DIR}/Shaders/FSL/shaders.list
    ${VB_SRC_DIR}/Shaders/FSL/BatchCompaction.comp.fsl
    ${VB_SRC_DIR}/Shaders/FSL/DebugMSAA.frag.fsl
    ${VB_SRC_DIR}/Shaders/FSL/Display.vert.fsl
    ${VB_SRC_DIR}/Shaders/FSL/display.frag.fsl
    ${VB_SRC_DIR}/Shaders/FSL/Godray.frag.fsl
    ${VB_SRC_DIR}/Shaders/FSL/GodrayBlur.comp.fsl
    ${VB_SRC_DIR}/Shaders/FSL/LightClusters.comp.fsl
    ${VB_SRC_DIR}/Shaders/FSL/LightClustersClear.comp.fsl
    ${VB_SRC_DIR}/Shaders/FSL/MsaaEdgeDetect.frag.fsl
    ${VB_SRC_DIR}/Shaders/FSL/MsaaStencilDownscale.frag.fsl
    ${VB_SRC_DIR}/Shaders/FSL/Resolve.frag.fsl
    ${VB_SRC_DIR}/Shaders/FSL/resolve.vert.fsl
    ${VB_SRC_DIR}/Shaders/FSL/ShaderDefs.h.fsl
    ${VB_SRC_DIR}/Shaders/FSL/Shading.h.fsl
    ${VB_SRC_DIR}/Shaders/FSL/ShadowPass.vert.fsl
    ${VB_SRC_DIR}/Shaders/FSL/ShadowPassAlpha.frag.fsl
    ${VB_SRC_DIR}/Shaders/FSL/ShadowPassAlpha.vert.fsl
    ${VB_SRC_DIR}/Shaders/FSL/TriangleFiltering.comp.fsl
    ${VB_SRC_DIR}/Shaders/FSL/TriangleFilteringClear.comp.fsl
    ${VB_SRC_DIR}/Shaders/FSL/VisibilityBufferPass.frag.fsl
    ${VB_SRC_DIR}/Shaders/FSL/VisibilityBufferPass.vert.fsl
    ${VB_SRC_DIR}/Shaders/FSL/VisibilityBufferPassAlpha.frag.fsl
    ${VB_SRC_DIR}/Shaders/FSL/VisibilityBufferPassAlpha.vert.fsl
    ${VB_SRC_DIR}/Shaders/FSL/VisibilityBufferResources.h.fsl
    ${VB_SRC_DIR}/Shaders/FSL/VisibilityBufferResourcesUtil.h.fsl
    ${VB_SRC_DIR}/Shaders/FSL/VisibilityBufferShade.frag.fsl
    ${VB_SRC_DIR}/Shaders/FSL/VisibilityBufferShade.vert.fsl
)

# Source groups for IDE
source_group("Source Files" FILES ${VB_SOURCES})
source_group("Header Files" FILES ${VB_HEADERS})
source_group("Shaders" FILES ${VB_SHADERS})

# Create executable
add_executable(Visibility_Buffer WIN32
    ${VB_SOURCES}
    ${VB_HEADERS}
    ${VB_SHADERS}
)

target_link_libraries(Visibility_Buffer The-Forge)
set_property(TARGET Visibility_Buffer PROPERTY CXX_STANDARD 17)

# Set Visual Studio debugger working directory to output folder
set_property(TARGET Visibility_Buffer PROPERTY VS_DEBUGGER_WORKING_DIRECTORY "${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/$<CONFIG>")

# Windows-specific settings
if(WIN32)
    # Additional libraries
    target_link_libraries(Visibility_Buffer
        Xinput9_1_0.lib
        ws2_32.lib
    )

    # Entry point
    target_link_options(Visibility_Buffer PRIVATE /ENTRY:mainCRTStartup)

    # Allow duplicate symbols from dxguid.lib
    if(MSVC)
        target_link_options(Visibility_Buffer PRIVATE /FORCE:MULTIPLE)
    endif()

    # Copy DLLs
    add_custom_command(TARGET Visibility_Buffer POST_BUILD
        COMMAND ${CMAKE_COMMAND} -E copy_if_different
            $<TARGET_RUNTIME_DLLS:Visibility_Buffer> $<TARGET_FILE_DIR:Visibility_Buffer>
        COMMAND_EXPAND_LISTS
    )

    # Copy DirectX Shader Compiler DLLs
    set(DXC_DIR ${CMAKE_CURRENT_SOURCE_DIR}/../../The-Forge/Common_3/Graphics/ThirdParty/OpenSource/DirectXShaderCompiler/bin/x64)
    add_custom_command(TARGET Visibility_Buffer POST_BUILD
        COMMAND ${CMAKE_COMMAND} -E copy_if_different
            "${DXC_DIR}/dxcompiler.dll"
            "${DXC_DIR}/dxil.dll"
            $<TARGET_FILE_DIR:Visibility_Buffer>
        COMMENT "Copying DXC DLLs"
    )

    # Copy D3D12 Agility SDK DLLs
    set(D3D12_AGILITY_DIR ${CMAKE_CURRENT_SOURCE_DIR}/../../The-Forge/Common_3/Graphics/ThirdParty/OpenSource/Direct3d12Agility/bin/x64)
    add_custom_command(TARGET Visibility_Buffer POST_BUILD
        COMMAND ${CMAKE_COMMAND} -E copy_if_different
            "${D3D12_AGILITY_DIR}/D3D12Core.dll"
            "${D3D12_AGILITY_DIR}/d3d12SDKLayers.dll"
            $<TARGET_FILE_DIR:Visibility_Buffer>
        COMMENT "Copying D3D12 Agility SDK DLLs"
    )
endif()

# FSL shader compilation settings
set(FSL_TOOL ${CMAKE_CURRENT_SOURCE_DIR}/../../The-Forge/Common_3/Tools/ForgeShadingLanguage/fsl.py)
set(FSL_SHADERS_LIST ${VB_SRC_DIR}/Shaders/FSL/shaders.list)
set(VB_OUTPUT_DIR ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/$<CONFIG>)

# Determine FSL language based on API
if(DX12)
    set(FSL_LANGUAGE "DIRECT3D12")
elseif(VULKAN)
    set(FSL_LANGUAGE "VULKAN")
endif()

# FSL shader compilation as POST_BUILD command
add_custom_command(TARGET Visibility_Buffer POST_BUILD
    COMMAND ${CMAKE_COMMAND} -E make_directory "${VB_OUTPUT_DIR}/Shaders"
    COMMAND ${CMAKE_COMMAND} -E make_directory "${VB_OUTPUT_DIR}/CompiledShaders"
    COMMAND ${Python3_EXECUTABLE} ${FSL_TOOL}
        -d "${VB_OUTPUT_DIR}/Shaders"
        -b "${VB_OUTPUT_DIR}/CompiledShaders"
        -l ${FSL_LANGUAGE}
        --compile
        ${FSL_SHADERS_LIST}
    WORKING_DIRECTORY ${VB_SRC_DIR}/Shaders/FSL
    COMMENT "Compiling FSL shaders for Visibility_Buffer"
)

# Compile common Application shaders
set(FORGE_ROOT ${CMAKE_CURRENT_SOURCE_DIR}/../../The-Forge)
add_custom_command(TARGET Visibility_Buffer POST_BUILD
    COMMAND ${Python3_EXECUTABLE} ${FSL_TOOL} -d "${VB_OUTPUT_DIR}/Shaders" -b "${VB_OUTPUT_DIR}/CompiledShaders" -l ${FSL_LANGUAGE} --compile "Common_3/Application/Screenshot/Shaders/FSL/ScreenshotShaders.list"
    COMMAND ${Python3_EXECUTABLE} ${FSL_TOOL} -d "${VB_OUTPUT_DIR}/Shaders" -b "${VB_OUTPUT_DIR}/CompiledShaders" -l ${FSL_LANGUAGE} --compile "Common_3/Application/UI/Shaders/FSL/UIShaders.list"
    COMMAND ${Python3_EXECUTABLE} ${FSL_TOOL} -d "${VB_OUTPUT_DIR}/Shaders" -b "${VB_OUTPUT_DIR}/CompiledShaders" -l ${FSL_LANGUAGE} --compile "Common_3/Application/Fonts/Shaders/FSL/FontShaders.list"
    WORKING_DIRECTORY ${FORGE_ROOT}
    COMMENT "Compiling common shaders"
)



# Copy resource files
add_custom_command(TARGET Visibility_Buffer POST_BUILD
    COMMAND ${CMAKE_COMMAND} -E copy_if_different
        "${VB_SRC_DIR}/GPUCfg/gpu.cfg"
        "${VB_OUTPUT_DIR}/gpu.cfg"
    COMMENT "Copying gpu.cfg"
)

# Copy camera path data from Art directory
set(ART_DIR ${CMAKE_CURRENT_SOURCE_DIR}/../../The-Forge/Art)
add_custom_command(TARGET Visibility_Buffer POST_BUILD
    COMMAND ${CMAKE_COMMAND} -E copy_if_different
        "${ART_DIR}/cameraPath.txt"
        "${VB_OUTPUT_DIR}/cameraPath.txt"
    COMMENT "Copying cameraPath.txt"
)

# Copy PathStatement.txt for resource directory configuration
add_custom_command(TARGET Visibility_Buffer POST_BUILD
    COMMAND ${CMAKE_COMMAND} -E copy_if_different
        "${CMAKE_CURRENT_SOURCE_DIR}/PathStatement.txt"
        "${VB_OUTPUT_DIR}/PathStatement.txt"
    COMMENT "Copying PathStatement.txt"
)

# Copy gpu.data for GPU detection
set(FORGE_COMMON ${CMAKE_CURRENT_SOURCE_DIR}/../../The-Forge/Common_3)
add_custom_command(TARGET Visibility_Buffer POST_BUILD
    COMMAND ${CMAKE_COMMAND} -E copy_if_different
        "${FORGE_COMMON}/OS/Windows/pc_gpu.data"
        "${VB_OUTPUT_DIR}/gpu.data"
    COMMENT "Copying gpu.data"
)

# Create required directories
add_custom_command(TARGET Visibility_Buffer POST_BUILD
    COMMAND ${CMAKE_COMMAND} -E make_directory "${VB_OUTPUT_DIR}/PipelineCaches"
    COMMAND ${CMAKE_COMMAND} -E make_directory "${VB_OUTPUT_DIR}/Screenshots"
    COMMAND ${CMAKE_COMMAND} -E make_directory "${VB_OUTPUT_DIR}/Debug"
    COMMAND ${CMAKE_COMMAND} -E make_directory "${VB_OUTPUT_DIR}/Scripts"
    COMMENT "Creating required directories"
)

# Copy Scripts
add_custom_command(TARGET Visibility_Buffer POST_BUILD
    COMMAND ${CMAKE_COMMAND} -E copy_directory
        "${FORGE_COMMON}/Scripts"
        "${VB_OUTPUT_DIR}/Scripts"
    COMMAND ${CMAKE_COMMAND} -E copy_directory
        "${VB_SRC_DIR}/Scripts"
        "${VB_OUTPUT_DIR}/Scripts"
    COMMENT "Copying Scripts"
)
