# Utilities - The-Forge v1.60+
# FileSystem, Log, Math, Memory, Threading

set(UTIL_DIR ${CMAKE_CURRENT_SOURCE_DIR}/../The-Forge/Common_3/Utilities)

# Utilities interfaces
set(UTIL_INTERFACES_FILES
    ${UTIL_DIR}/Interfaces/IFileSystem.h
    ${UTIL_DIR}/Interfaces/ILog.h
    ${UTIL_DIR}/Interfaces/IMemory.h
    ${UTIL_DIR}/Interfaces/IThread.h
    ${UTIL_DIR}/Interfaces/ITime.h
    ${UTIL_DIR}/Interfaces/IToolFileSystem.h
)

# FileSystem - base files
set(UTIL_FILESYSTEM_FILES
    ${UTIL_DIR}/FileSystem/FileSystem.c
)

# Platform-specific file system files
if(APPLE_PLATFORM OR LINUX)
    list(APPEND UTIL_FILESYSTEM_FILES ${UTIL_DIR}/FileSystem/UnixFileSystem.c)
endif()

# Log
set(UTIL_LOG_FILES
    ${UTIL_DIR}/Log/Log.c
    ${UTIL_DIR}/Log/Log.h
)

# Math
set(UTIL_MATH_FILES
    ${UTIL_DIR}/Math/Algorithms.c
    ${UTIL_DIR}/Math/Algorithms.h
    ${UTIL_DIR}/Math/AlgorithmsImpl.h
    ${UTIL_DIR}/Math/BStringHashMap.h
    ${UTIL_DIR}/Math/MathTypes.h
    ${UTIL_DIR}/Math/Random.h
    ${UTIL_DIR}/Math/RTree.h
    ${UTIL_DIR}/Math/ShaderUtilities.h
    ${UTIL_DIR}/Math/StbDs.c
)

# Memory
set(UTIL_MEMORY_FILES
    ${UTIL_DIR}/MemoryTracking/MemoryTracking.c
    ${UTIL_DIR}/MemoryTracking/NoMemoryDefines.h
)

# Threading
set(UTIL_THREADING_FILES
    ${UTIL_DIR}/Threading/Atomics.h
    ${UTIL_DIR}/Threading/ThreadSystem.c
    ${UTIL_DIR}/Threading/ThreadSystem.h
    ${UTIL_DIR}/Threading/UnixThreadID.h
)

# Timer
set(UTIL_TIMER_FILES
    ${UTIL_DIR}/Timer.c
)

# Other
set(UTIL_OTHER_FILES
    ${UTIL_DIR}/RingBuffer.h
    ${UTIL_DIR}/CustomUIWidgets.h
)

# Third party - bstrlib
set(UTIL_BSTRLIB_DIR ${UTIL_DIR}/ThirdParty/OpenSource/bstrlib)
set(UTIL_BSTRLIB_FILES
    ${UTIL_BSTRLIB_DIR}/bstrlib.c
    ${UTIL_BSTRLIB_DIR}/bstrlib.h
    
    
    
    
)

# Third party - lz4
set(UTIL_LZ4_DIR ${UTIL_DIR}/ThirdParty/OpenSource/lz4)
set(UTIL_LZ4_FILES
    ${UTIL_LZ4_DIR}/lz4.c
    ${UTIL_LZ4_DIR}/lz4.h
)

# Third party - zstd (decompression only to match official project)
set(UTIL_ZSTD_DIR ${UTIL_DIR}/ThirdParty/OpenSource/zstd)
set(UTIL_ZSTD_FILES
    ${UTIL_ZSTD_DIR}/common/debug.c
    ${UTIL_ZSTD_DIR}/common/entropy_common.c
    ${UTIL_ZSTD_DIR}/common/error_private.c
    ${UTIL_ZSTD_DIR}/common/fse_decompress.c
    ${UTIL_ZSTD_DIR}/common/pool.c
    ${UTIL_ZSTD_DIR}/common/threading.c
    ${UTIL_ZSTD_DIR}/common/xxhash.c
    ${UTIL_ZSTD_DIR}/common/zstd_common.c
    ${UTIL_ZSTD_DIR}/decompress/huf_decompress.c
    ${UTIL_ZSTD_DIR}/decompress/zstd_ddict.c
    ${UTIL_ZSTD_DIR}/decompress/zstd_decompress.c
    ${UTIL_ZSTD_DIR}/decompress/zstd_decompress_block.c
)

# Source groups
source_group(Utilities/Interfaces FILES ${UTIL_INTERFACES_FILES})
source_group(Utilities/FileSystem FILES ${UTIL_FILESYSTEM_FILES})
source_group(Utilities/Log FILES ${UTIL_LOG_FILES})
source_group(Utilities/Math FILES ${UTIL_MATH_FILES})
source_group(Utilities/Memory FILES ${UTIL_MEMORY_FILES})
source_group(Utilities/Threading FILES ${UTIL_THREADING_FILES})
source_group(Utilities/ThirdParty/bstrlib FILES ${UTIL_BSTRLIB_FILES})
source_group(Utilities/ThirdParty/lz4 FILES ${UTIL_LZ4_FILES})
source_group(Utilities/ThirdParty/zstd FILES ${UTIL_ZSTD_FILES})

# Combined Utilities files
set(UTILITIES_FILES
    ${UTIL_INTERFACES_FILES}
    ${UTIL_FILESYSTEM_FILES}
    ${UTIL_LOG_FILES}
    ${UTIL_MATH_FILES}
    ${UTIL_MEMORY_FILES}
    ${UTIL_THREADING_FILES}
    ${UTIL_TIMER_FILES}
    ${UTIL_OTHER_FILES}
    ${UTIL_BSTRLIB_FILES}
    ${UTIL_LZ4_FILES}
    ${UTIL_ZSTD_FILES}
)

