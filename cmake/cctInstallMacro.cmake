# Install all the required packages


macro(CCT_INSTALL)

    # system installation
    include(InstallRequiredSystemLibraries)
    INSTALL(FILES ${CMAKE_INSTALL_SYSTEM_RUNTIME_LIBS}
        DESTINATION bin
        )

    foreach(_dep IN LISTS CCT_REQUIRED_DEPENDENCIES)
        include(${CTT_SOURCE_DIR}/cmake/cct-install-${_dep}.cmake)
    endforeach()



endmacro()
