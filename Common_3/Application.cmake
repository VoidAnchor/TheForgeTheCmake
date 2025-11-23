# Application - The-Forge v1.60+
# Camera, Fonts, Profiler, Screenshot, UI

set(APP_DIR ${CMAKE_CURRENT_SOURCE_DIR}/../The-Forge/Common_3/Application)

# Application interfaces
set(APP_INTERFACES_FILES
    ${APP_DIR}/Config.h
    ${APP_DIR}/Interfaces/IApp.h
    ${APP_DIR}/Interfaces/ICameraController.h
    ${APP_DIR}/Interfaces/IFont.h
    ${APP_DIR}/Interfaces/IMiddleware.h
    ${APP_DIR}/Interfaces/IProfiler.h
    ${APP_DIR}/Interfaces/IScreenshot.h
    ${APP_DIR}/Interfaces/IUI.h
)

# Camera
set(APP_CAMERA_FILES
    ${APP_DIR}/CameraController.cpp
)

# Fonts
set(APP_FONT_FILES
    ${APP_DIR}/Fonts/FontSystem.cpp
    ${APP_DIR}/Fonts/stbtt.cpp
)

# Profiler
set(APP_PROFILER_FILES
    ${APP_DIR}/Profiler/GpuProfiler.cpp
    ${APP_DIR}/Profiler/GpuProfiler.h
    ${APP_DIR}/Profiler/ProfilerBase.cpp
    ${APP_DIR}/Profiler/ProfilerBase.h
    ${APP_DIR}/Profiler/ProfilerHTML.h
)

# Screenshot
set(APP_SCREENSHOT_FILES
    ${APP_DIR}/Screenshot/Screenshot.cpp
)

# UI
set(APP_UI_FILES
    ${APP_DIR}/UI/UI.cpp
    ${APP_DIR}/UI/imgui_user.cpp
    ${APP_DIR}/UI/imgui_user.h
)

# Third party - imgui
set(APP_IMGUI_DIR ${APP_DIR}/ThirdParty/OpenSource/imgui)
set(APP_IMGUI_FILES
    ${APP_IMGUI_DIR}/imconfig.h
    ${APP_IMGUI_DIR}/imgui.cpp
    ${APP_IMGUI_DIR}/imgui.h
    ${APP_IMGUI_DIR}/imgui_demo.cpp
    ${APP_IMGUI_DIR}/imgui_draw.cpp
    ${APP_IMGUI_DIR}/imgui_internal.h
    ${APP_IMGUI_DIR}/imgui_tables.cpp
    ${APP_IMGUI_DIR}/imgui_widgets.cpp
)

# Source groups
source_group(Application/Interfaces FILES ${APP_INTERFACES_FILES})
source_group(Application/Camera FILES ${APP_CAMERA_FILES})
source_group(Application/Fonts FILES ${APP_FONT_FILES})
source_group(Application/Profiler FILES ${APP_PROFILER_FILES})
source_group(Application/Screenshot FILES ${APP_SCREENSHOT_FILES})
source_group(Application/UI FILES ${APP_UI_FILES})
source_group(Application/ThirdParty/imgui FILES ${APP_IMGUI_FILES})

# Combined Application files
set(APPLICATION_FILES
    ${APP_INTERFACES_FILES}
    ${APP_CAMERA_FILES}
    ${APP_FONT_FILES}
    ${APP_PROFILER_FILES}
    ${APP_SCREENSHOT_FILES}
    ${APP_UI_FILES}
    ${APP_IMGUI_FILES}
)
