
# retrive informaition about the project vendor

mark_as_advanced(CLEAR CCT_VENDOR_METADATA_FILE)

if(NOT CCT_VENDOR_METADATA_FILE)
    message(FATAL_ERROR "vendor_metadata have been request. Your must provide
        a CCT_VENDOR_METADATA_FILE in which we wil retrieve this information")
else()
    include(${CCT_VENDOR_METADATA_FILE})
endif()
