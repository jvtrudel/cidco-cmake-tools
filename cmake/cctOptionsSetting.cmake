#  optionsSetting manage all variables used in python_embedded_app--with-cmake
#  (design inspired by Homebrew)
#
#  cmake API level:
#     - options available by users
#     - must use CACHE
#  cmake internal level:
#     - should not be accessed by users



# cmake API level
set(binary_bitness 64 CACHE string "You want 32-bit or 64-bit binaries?")
option(with-shared_python "You want to build with a shared python library?" ON)
option(with-pip "You need pip to fetch modules" OFF)
set(with-python_modules "" CACHE STRING "Which python modules do you need?")
set(PYTHON_DIRECTORY "" CACHE STRING "Where should I look for python?")
set(with-user-config ${CMAKE_CURRENT_SOURCE_DIR} CACHE PATH "You have a configuration file... Where is it?")
set(CCT_VERBOSE true CACHE BOOL "Print CCT_MESSAGES?")



# lazy decision: do not support python2
set(python-minimum-version 3.0 CACHE STRING "Which python mimimum version is required?" )
if(python-minimum-version VERSION_LESS 3.0)
    message(WARNING "Python 2.x is not supported. Active python-minimum-version is upgraded to 3.0")
    set(python-minimum-version 3.0)
endif()


# cmake internal level

# todo: change message policym as:
#   with-verbose: enable message of everyone
#   with cct_verbose: enable messages for cct module only
if(CCT_VERBOSE)
    set(with-verbose true)
else()
    set(with-verbose false)
endif()

if(with-shared_python)
    set(with-python TRUE)
    set(shared_build TRUE)
else()
    set(with-python True)
    set(shared_build False)
endif()

if(binary_bitness EQUAL 64)  # 32 or 64 bits build
    set(bit64 ON)
    set(bit32 OFF)
else()
    set(bit64 OFF)
    set(bit32 ON)
endif()


if(NOT with-python_modules STREQUAL "" AND NOT with-pip)
    message(WARNING "You ask for modules, but not for pip. Pip is need to import modules. It have been activated.")
    set(with-pip TRUE)
endif()

# bug: CMAKE_MODULE_PATH do not return any path...
if (NOT PYTHON_DIR STREQUAL "")
    set(PYTHON_ROOT ${PYTHON_DIR} CACHE PATH "Where to search python" FORCE) # user specified a path for python source
else()
    set(PYTHON_ROOT ${CMAKE_MODULE_PATH} CACHE PATH "Where to search python" FORCE)  # search in cmake default path
endif()
mark_as_advanced(PYTHON_ROOT)

# report active options
if(with-verbose)

    cct_print_variable(python-minimum-version 1)
    cct_print_variable(with-verbose 1)

    cct_print_variable(with-shared_python 1)
    cct_print_variable(with-python 2)
    cct_print_variable(shared_build 2)


    cct_print_variable(binary_bitness 1)
    cct_print_variable(bit32 2)
    cct_print_variable(bit64 2)

    cct_print_variable(with-pip 1)
    cct_print_variable(with-python_modules 1)

    cct_print_variable(PYTHON_DIR 1)
    cct_print_variable(PYTHON_ROOT 2)


endif()
