set(ZLIB_STATIC_FILES
    ../../The-Forge/Common_3/ThirdParty/OpenSource/assimp/4.1.0/contrib/zlib/crc32.h
    ../../The-Forge/Common_3/ThirdParty/OpenSource/assimp/4.1.0/contrib/zlib/deflate.h
    ../../The-Forge/Common_3/ThirdParty/OpenSource/assimp/4.1.0/contrib/zlib/gzguts.h
    ../../The-Forge/Common_3/ThirdParty/OpenSource/assimp/4.1.0/contrib/zlib/inffast.h
    ../../The-Forge/Common_3/ThirdParty/OpenSource/assimp/4.1.0/contrib/zlib/inffixed.h
    ../../The-Forge/Common_3/ThirdParty/OpenSource/assimp/4.1.0/contrib/zlib/inflate.h
    ../../The-Forge/Common_3/ThirdParty/OpenSource/assimp/4.1.0/contrib/zlib/inftrees.h
    ../../The-Forge/Common_3/ThirdParty/OpenSource/assimp/4.1.0/contrib/zlib/trees.h
    ../../The-Forge/Common_3/ThirdParty/OpenSource/assimp/4.1.0/contrib/zlib/zlib.h
    ../../The-Forge/Common_3/ThirdParty/OpenSource/assimp/4.1.0/contrib/zlib/zutil.h
    ../../The-Forge/Common_3/ThirdParty/OpenSource/assimp/4.1.0/contrib/zlib/adler32.c
    ../../The-Forge/Common_3/ThirdParty/OpenSource/assimp/4.1.0/contrib/zlib/compress.c
    ../../The-Forge/Common_3/ThirdParty/OpenSource/assimp/4.1.0/contrib/zlib/crc32
    ../../The-Forge/Common_3/ThirdParty/OpenSource/assimp/4.1.0/contrib/zlib/deflate.c
    ../../The-Forge/Common_3/ThirdParty/OpenSource/assimp/4.1.0/contrib/zlib/gzclose.c
    ../../The-Forge/Common_3/ThirdParty/OpenSource/assimp/4.1.0/contrib/zlib/gzlib.c
    ../../The-Forge/Common_3/ThirdParty/OpenSource/assimp/4.1.0/contrib/zlib/gzread.c
    ../../The-Forge/Common_3/ThirdParty/OpenSource/assimp/4.1.0/contrib/zlib/gzwrite.c
    ../../The-Forge/Common_3/ThirdParty/OpenSource/assimp/4.1.0/contrib/zlib/infback.c
    ../../The-Forge/Common_3/ThirdParty/OpenSource/assimp/4.1.0/contrib/zlib/inffast.c
    ../../The-Forge/Common_3/ThirdParty/OpenSource/assimp/4.1.0/contrib/zlib/inflate.c
    ../../The-Forge/Common_3/ThirdParty/OpenSource/assimp/4.1.0/contrib/zlib/inftrees.c
    ../../The-Forge/Common_3/ThirdParty/OpenSource/assimp/4.1.0/contrib/zlib/trees.c
    ../../The-Forge/Common_3/ThirdParty/OpenSource/assimp/4.1.0/contrib/zlib/uncompr.c
    ../../The-Forge/Common_3/ThirdParty/OpenSource/assimp/4.1.0/contrib/zlib/zutil.c
)

if(APPLE MATCHES ON)
    set(ZLIB_STATIC_FILES ${ZLIB_STATIC_FILES}
        ../../The-Forge/Common_3/ThirdParty/OpenSource/assimp/4.1.0/Apple/zconf.h
    )
endif()

add_library(zlibstatic STATIC ${ZLIB_STATIC_FILES})