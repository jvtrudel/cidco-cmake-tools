#  optionsSetting: define general options and environment variables
#  (design inspired by Homebrew)



# 32 or 64 bits
set(binary_bitness 64 CACHE string "You want 32-bit or 64-bit binaries?")

# environment variables used when installing external project
set(CCT_SOURCE_DIR "" CACHE DIRECTORY "PATH where to put fechted sources external project")
set(CCT_BUILD_DIR "" CACHE DIRECTORY "PATH where to put builded external project")
set(CCT_INSTALL_DIR "" CACHE DIRECTORY "PATH where to install external project")

mark_as_advanced(CCT_SOURCE_DIR)
mark_as_advanced(CCT_BUILD_DIR)
mark_as_advanced(CCT_INSTALL_DIR)





# Python
option(with-shared_python "You want to build with a shared python library?" OFF)
option(with-pip "You need pip to fetch modules" OFF)
set(with-python_modules "" CACHE STRING "Which python modules do you need?")
set(PYTHON_DIRECTORY "" CACHE STRING "Where should I look for python?")

set(with-user-config ${CMAKE_CURRENT_SOURCE_DIR} CACHE PATH "You have a configuration file... Where is it?")
set(CCT_VERBOSE true CACHE BOOL "Print CCT_MESSAGES?")
option(with-Qt "Do you need Qt?" OFF)


#json
option(with-json "Do you need a json parser?" OFF)






# todo: change message policies as:
#   with-verbose: enable message of everyone
#   with cct_verbose: enable messages for cct module only
if(CCT_VERBOSE)
    set(with-verbose true)
else()
    set(with-verbose false)
endif()



if(binary_bitness EQUAL 64)  # 32 or 64 bits build
    set(bit64 ON)
    set(bit32 OFF)
else()
    set(bit64 OFF)
    set(bit32 ON)
endif()


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
