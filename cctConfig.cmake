

get_filename_component(CTT_SOURCE_DIR ${CMAKE_CURRENT_LIST_FILE} DIRECTORY)


# add CCT modules directory to CMAKE_MODULE_PATH
list(APPEND CMAKE_MODULE_PATH ${CTT_SOURCE_DIR}/cmake)

# get core variables and functionality of CCT
include(cctOuputMacros)
include(cctOptionsSetting)
include(cctGetMacros)

CCT_MESSAGE(
    "Cidco Cmake Tools (CCT) loaded."
    "For more details on CCT usage and options,"
    "see: github.com/jvtrudel/cidco-cmake-tools"
    " "
    "Default message is on. If you don't need it,"
    "set CCT_VERBOSE to false."
    "Happy cmaking!")

if(with-python)
    include(cct-get-python)
endif()

if(with-Qt)
    include(cct-get-Qt)
endif()


if(with-json)
    include(cct-get-json)
endif()
