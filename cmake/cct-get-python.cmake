

# FIRST OPTION: look for a locally installed python
if (NOT PYTHON_DIR STREQUAL "") # user directive

    find_package(PythonInterp ${python-minimum-version} PATHS ${PYTHON_DIR} NO_CMAKE_PATH)
    find_package(PythonLibs ${python-minimum-version} PATHS ${PYTHON_DIR} NO_CMAKE_PATH)
    if(PYTHONLIBS_FOUND)
        get_filename_component(PYTHON_SOURCE_DIR ${PYTHON_EXECUTABLE} DIRECTORY)
            cct_message("python found with option 1: user defined directory")
            cct_print_variable(PYTHON_SOURCE_DIR 1)
    endif()
endif()



# SECOND option: install with python-cmake-buildsystem
if(NOT PYTHONLIBS_FOUND)

#[[

    include(ExternalProject)
    set(PYTHON_INSTALL_DIR ${CMAKE_INSTALL_PREFIX}/python)
    # hack: on install dans le bin ${CMAKE_INSTALL_PREFIX}/bin)

    ExternalProject_Add(
        python
        GIT_REPOSITORY https://github.com/jvtrudel/python-cmake-buildsystem.git
        GIT_TAG 98e3a2e6aa4b61a01925a06c630b9cf91854b7a8  # ~stable version
       #GIT_TAG 83fe42ff6998504f0cbf6e51cea92e1eeac923e0 # patch to use find_package

        CMAKE_ARGS
          -DBUILD_LIBPYTHON_SHARED:Bool=${shared_build}
          -DUSE_LIB64:Bool=${bit64}
          "-GCodeBlocks - NMake Makefiles"
          -DCMAKE_INSTALL_PREFIX=${PYTHON_INSTALL_DIR}
          -DINSTALL_MANUAL:Bool=False
          -DINSTALL_TEST:Bool=False
          -INSTALL_DEVELOPMENT:Bool=true
        UPDATE_COMMAND ""
        )


    #find_package(Python PATHS ${PYTHON_INSTALL_DIR} NO_CMAKE_PATH)
    # see:   https://github.com/python-cmake-buildsystem/python-cmake-buildsystem/issues/179
    set(PYTHON_LIBRARY ${PYTHON_INSTALL_DIR}/libs/python35.lib)   # hack
    set(PYTHON_INCLUDE_DIRS ${PYTHON_INSTALL_DIR}/include)
]]

endif()

# THIRD option: installed version

if(NOT PYTHONLIBS_FOUND)
    find_package(PythonInterp ${python-minimum-version})
    find_package(PythonLibs ${python-minimum-version})

    if(PYTHONLIBS_FOUND)
         get_filename_component(PYTHON_SOURCE_DIR ${PYTHON_EXECUTABLE} DIRECTORY)
             cct_message("python found with option 3: installed version")
             cct_print_variable(PYTHON_SOURCE_DIR 1)
    endif()
endif()

if(NOT PYTHONLIBS_FOUND)
    cct_Fatal_error(FATAL_ERROR "Unable to find a valid version of python")
endif()
