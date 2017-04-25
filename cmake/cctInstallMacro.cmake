# Install all the required packages


macro(CCT_INSTALL)


    if(CCT_INSTALL_ROOT)
        set(CMAKE_INSTALL_PREFIX ${CCT_INSTALL_ROOT}/${CCT_PROJECT_NAME}-v${CCT_PROJECT_VERSION}-${CCT_PROJECT_GIT_HASH})
        message("CMAKE_INSTALL_PREFIX: ${CMAKE_INSTALL_PREFIX}")
    endif()

    # system installation
    include(InstallRequiredSystemLibraries)
    INSTALL(FILES ${CMAKE_INSTALL_SYSTEM_RUNTIME_LIBS}
        DESTINATION bin
        )

    foreach(_dep IN LISTS CCT_REQUIRED_DEPENDENCIES)
        foreach(_dir IN LISTS CCT_RECIPES_DIR)
            if(EXISTS ${_dir}/cct-install-${_dep}.cmake)
              include(${_dir}/cct-install-${_dep}.cmake)
          endif()
        endforeach()
    endforeach()



endmacro()
