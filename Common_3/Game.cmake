# Game - The-Forge v1.60+
# Scripting (Lua)

set(GAME_DIR ${CMAKE_CURRENT_SOURCE_DIR}/../The-Forge/Common_3/Game)

# Scripting interfaces
set(GAME_INTERFACES_FILES
    ${GAME_DIR}/Interfaces/IScripting.h
)

# Scripting/Lua Manager
set(GAME_SCRIPTING_FILES
    ${GAME_DIR}/Scripting/LuaManager.cpp
    ${GAME_DIR}/Scripting/LuaManager.h
    ${GAME_DIR}/Scripting/LuaManagerCommon.h
    ${GAME_DIR}/Scripting/LuaManagerImpl.cpp
    ${GAME_DIR}/Scripting/LuaManagerImpl.h
    ${GAME_DIR}/Scripting/LuaSystem.cpp
    ${GAME_DIR}/Scripting/LunaV.hpp
)

# Third party - Lua 5.3.5
set(GAME_LUA_DIR ${GAME_DIR}/ThirdParty/OpenSource/lua-5.3.5/src)
set(GAME_LUA_FILES
    ${GAME_LUA_DIR}/lapi.c
    ${GAME_LUA_DIR}/lauxlib.c
    ${GAME_LUA_DIR}/lbaselib.c
    ${GAME_LUA_DIR}/lbitlib.c
    ${GAME_LUA_DIR}/lcode.c
    ${GAME_LUA_DIR}/lcorolib.c
    ${GAME_LUA_DIR}/lctype.c
    ${GAME_LUA_DIR}/ldblib.c
    ${GAME_LUA_DIR}/ldebug.c
    ${GAME_LUA_DIR}/ldo.c
    ${GAME_LUA_DIR}/ldump.c
    ${GAME_LUA_DIR}/lfunc.c
    ${GAME_LUA_DIR}/lgc.c
    ${GAME_LUA_DIR}/linit.c
    ${GAME_LUA_DIR}/liolib.c
    ${GAME_LUA_DIR}/llex.c
    ${GAME_LUA_DIR}/lmathlib.c
    ${GAME_LUA_DIR}/lmem.c
    ${GAME_LUA_DIR}/loadlib.c
    ${GAME_LUA_DIR}/lobject.c
    ${GAME_LUA_DIR}/lopcodes.c
    ${GAME_LUA_DIR}/loslib.c
    ${GAME_LUA_DIR}/lparser.c
    ${GAME_LUA_DIR}/lstate.c
    ${GAME_LUA_DIR}/lstring.c
    ${GAME_LUA_DIR}/lstrlib.c
    ${GAME_LUA_DIR}/ltable.c
    ${GAME_LUA_DIR}/ltablib.c
    ${GAME_LUA_DIR}/ltm.c
    ${GAME_LUA_DIR}/lundump.c
    ${GAME_LUA_DIR}/lutf8lib.c
    ${GAME_LUA_DIR}/lvm.c
    ${GAME_LUA_DIR}/lzio.c
)

# Source groups
source_group(Game/Interfaces FILES ${GAME_INTERFACES_FILES})
source_group(Game/Scripting FILES ${GAME_SCRIPTING_FILES})
source_group(Game/ThirdParty/Lua FILES ${GAME_LUA_FILES})

# Combined Game files
set(GAME_FILES
    ${GAME_INTERFACES_FILES}
    ${GAME_SCRIPTING_FILES}
    ${GAME_LUA_FILES}
)

# On Apple platforms, certain C++ files need to be compiled as Objective-C++
# (based on Xcode project: explicitFileType = sourcecode.cpp.objcpp)
if(APPLE_PLATFORM)
    set_source_files_properties(
        ${GAME_DIR}/Scripting/LuaManager.cpp
        ${GAME_DIR}/Scripting/LuaManagerImpl.cpp
        ${GAME_DIR}/Scripting/LuaSystem.cpp
        PROPERTIES LANGUAGE OBJCXX
    )
endif()
