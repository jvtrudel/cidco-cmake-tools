

get_filename_component(CTT_SOURCE_DIR ${CMAKE_CURRENT_LIST_FILE} DIRECTORY)


# add CCT modules directory to CMAKE_MODULE_PATH
list(APPEND CMAKE_MODULE_PATH ${CTT_SOURCE_DIR}/cmake)

# cmake macros
include(CMakeParseArguments)

# get core variables and functionality of CCT
include(cctOuputMacros)
include(cctOptionsSetting)

include(cctGetMacros)  # get external project using git
include(cctSetOptionsMacro)
include(cctInstallMacro)

CCT_MESSAGE(
    "Cidco Cmake Tools (CCT) loaded."
    "For more details on CCT usage and options,"
    "see: github.com/jvtrudel/cidco-cmake-tools"
    " "
    "Default message is on. If you don't need it,"
    "set CCT_VERBOSE to false."
    "Happy cmaking!")


# Generic method to load needed recipes
# Do not work...
#message("CCT_REQUIRED_DEPENDENCIES: ${CCT_REQUIRED_DEPENDENCIES}")
#foreach(_lib IN LISTS ${CCT_REQUIRED_DEPENDENCIES})
#    CCT_MESSAGE("${_lib} library is required" 1)
#    include(cct-get-${${_lib}})
#endforeach()

if(CCT_EXTRA_MODULE_PATHS)
    message("set extra module path")
   # set(CMAKE_MODULE_PATH "${CMAKE_MODULE_PATH};${CCT_EXTRA_MODULE_PATHS}" CACHE INTERNAL "")
    mark_as_advanced(CLEAR CCT_EXTRA_MODULE_PATHS)
endif()


if(with-user_config)
    message("with user_config")
    include(cct-get-user_config)
endif()

if(with-project_metadata)
    message("with project metadata")
    include(cct-get-project_metadata)
endif()


if(with-vendor_metadata)
    message("with vendor")
    include(cct-get-vendor_metadata)
endif()

if(with-python)
    include(cct-get-python)
endif()

if(with-boost)
    include(cct-get-boost)
endif()

if(with-eigen)
    include(cct-get-eigen)
endif()

if(with-vtk)
    include(cct-get-vtk)
endif()

if(with-pcl)
    include(cct-get-pcl)
endif()

if(with-qt)
    include(cct-get-Qt)
endif()

if(with-json)
    include(cct-get-json)
endif()

if(with-spline)
    include(cct-get-spline)
endif()

if(with-matlab)
    include(cct-get-matlab)
endif()
