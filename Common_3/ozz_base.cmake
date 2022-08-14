set(OZZ_BASE_FILES
    ../The-Forge/Common_3/ThirdParty/OpenSource/ozz-animation/include/ozz/base/containers/map.h
    ../The-Forge/Common_3/ThirdParty/OpenSource/ozz-animation/include/ozz/base/containers/set.h
    ../The-Forge/Common_3/ThirdParty/OpenSource/ozz-animation/include/ozz/base/containers/string.h
    ../The-Forge/Common_3/ThirdParty/OpenSource/ozz-animation/include/ozz/base/containers/string_archive.h
    ../The-Forge/Common_3/ThirdParty/OpenSource/ozz-animation/include/ozz/base/containers/vector.h
    ../The-Forge/Common_3/ThirdParty/OpenSource/ozz-animation/include/ozz/base/containers/vector_archive.h
    ../The-Forge/Common_3/ThirdParty/OpenSource/ozz-animation/include/ozz/base/endianness.h
    ../The-Forge/Common_3/ThirdParty/OpenSource/ozz-animation/include/ozz/base/gtest_helper.h
    ../The-Forge/Common_3/ThirdParty/OpenSource/ozz-animation/include/ozz/base/io/archive.h
    ../The-Forge/Common_3/ThirdParty/OpenSource/ozz-animation/include/ozz/base/io/archive_traits.h
    ../The-Forge/Common_3/ThirdParty/OpenSource/ozz-animation/include/ozz/base/maths/gtest_math_helper.h
    ../The-Forge/Common_3/ThirdParty/OpenSource/ozz-animation/include/ozz/base/maths/math_archive.h
    ../The-Forge/Common_3/ThirdParty/OpenSource/ozz-animation/include/ozz/base/maths/math_constant.h
    ../The-Forge/Common_3/ThirdParty/OpenSource/ozz-animation/include/ozz/base/maths/math_ex.h
    ../The-Forge/Common_3/ThirdParty/OpenSource/ozz-animation/include/ozz/base/maths/simd_math_archive.h
    ../The-Forge/Common_3/ThirdParty/OpenSource/ozz-animation/include/ozz/base/maths/soa_math_archive.h
    ../The-Forge/Common_3/ThirdParty/OpenSource/ozz-animation/include/ozz/base/memory/allocator.h
    ../The-Forge/Common_3/ThirdParty/OpenSource/ozz-animation/include/ozz/base/platform.h
    ../The-Forge/Common_3/ThirdParty/OpenSource/ozz-animation/src/base/containers/string_archive.cc
    ../The-Forge/Common_3/ThirdParty/OpenSource/ozz-animation/src/base/io/archive.cc
    ../The-Forge/Common_3/ThirdParty/OpenSource/ozz-animation/src/base/maths/math_archive.cc
    ../The-Forge/Common_3/ThirdParty/OpenSource/ozz-animation/src/base/maths/simd_math_archive.cc
    ../The-Forge/Common_3/ThirdParty/OpenSource/ozz-animation/src/base/maths/soa_math_archive.cc
    ../The-Forge/Common_3/ThirdParty/OpenSource/ozz-animation/src/base/memory/allocator.cc
    ../The-Forge/Common_3/ThirdParty/OpenSource/ozz-animation/src/base/platform.cc
)

set(OZZ_BASE_INCLUDES
    ../The-Forge/Common_3/ThirdParty/OpenSource/ozz-animation/include
)

add_library(ozz_base STATIC ${OZZ_BASE_FILES})

target_include_directories(ozz_base PUBLIC ${OZZ_BASE_INCLUDES})

set_property(TARGET ozz_base PROPERTY CXX_STANDARD 17)
