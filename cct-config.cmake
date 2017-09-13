
# add CCT files to CMAKE_MODULE_PATH
get_filename_component(CCT_SOURCE_DIR ${CMAKE_CURRENT_LIST_FILE} DIRECTORY)
set(CMAKE_MODULE_PATH "${CMAKE_MODULE_PATH};${CCT_SOURCE_DIR}/cmake" CACHE INTERNAL "")


# get build-in cmake macros
include(CMakeParseArguments)

# CCT CORE COMMANDS
include(core/cctOuputMacros)
include(core/cct-add-prefix)
include(core/cctCheckMacros)
include(core/cctGitUtilityMacros)
include(core/cctCoreVariables)

# options: CCT COMMANDS to manage options
include(options/cctOptionsVariables)
include(options/cctOptionsFunctions)


# submodule: CCT COMMAND and tools to manage submodule dependencies

include(submodules/cctRequiredSubmodules)

# libraries: CCT COMMANDS FOR EXTERNAL libraries management
# typiquement via find package



# get: CCT COMMANDS to select libraries



# install: CCT COMMANDS to install library/application
include(install/cctInstallMacro)

# package: CCT COMMAND to package library/application
include(package/cctPackMacro)


  # mets un  préfixe devant une liste de fichiers
# libraries: CCT COMMANDS to manage dependents libraries



# recipies: CCT RECIPES for dependendies








#CCT_ADD_RECIPIES_SOURCE(${CCT_SOURCE_DIR}/cmake)

if(false)
CCT_MESSAGE(
    "Cidco Cmake Tools (CCT) loaded."
    "For more details on CCT usage and options,"
    "see: github.com/jvtrudel/cidco-cmake-tools"
    " "
    "Default message is on. If you don't need it,"
    "set CCT_VERBOSE to false."
    "Happy cmaking!")
endif()

# Generic method to load needed recipes
# Do not work...
#message("CCT_REQUIRED_DEPENDENCIES: ${CCT_REQUIRED_DEPENDENCIES}")
#foreach(_lib IN LISTS ${CCT_REQUIRED_DEPENDENCIES})
#    CCT_MESSAGE("${_lib} library is required" 1)
#    include(cct-get-${${_lib}})
#endforeach()
if(false)
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
endif()
