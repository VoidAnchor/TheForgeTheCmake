set(IRRXML_FILES
    ../../The-Forge/Common_3/ThirdParty/OpenSource/assimp/4.1.0/contrib/irrXML/CXMLReaderImpl.h
    ../../The-Forge/Common_3/ThirdParty/OpenSource/assimp/4.1.0/contrib/irrXML/heapsort.h
    ../../The-Forge/Common_3/ThirdParty/OpenSource/assimp/4.1.0/contrib/irrXML/irrArray.h
    ../../The-Forge/Common_3/ThirdParty/OpenSource/assimp/4.1.0/contrib/irrXML/irrString.h
    ../../The-Forge/Common_3/ThirdParty/OpenSource/assimp/4.1.0/contrib/irrXML/irrTypes.h
    ../../The-Forge/Common_3/ThirdParty/OpenSource/assimp/4.1.0/contrib/irrXML/irrXML.h
    ../../The-Forge/Common_3/ThirdParty/OpenSource/assimp/4.1.0/contrib/irrXML/irrXML.cpp
)

add_library(IrrXML STATIC ${IRRXML_FILES})