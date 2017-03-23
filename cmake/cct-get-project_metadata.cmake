mark_as_advanced(CLEAR CCT_METADATA_FILE)


if(NOT CCT_METADATA_FILE)
    message(FATAL_ERROR "project_metadata have been request. Your must provide
        a CCT_METADATA_FILE in which we wil retrieve this information")
else()
    include(${CCT_METADATA_FILE})
endif()
