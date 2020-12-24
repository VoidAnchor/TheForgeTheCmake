if(OZZ MATCHES ON)
    include(ozz.cmake)
endif()

if(ASSIMP MATCHES ON)
    include(assimp.cmake)
    include(AssetPipeline.cmake)
endif()

include(SpirVTools.cmake)
