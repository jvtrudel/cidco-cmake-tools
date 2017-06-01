
# retrive informaition about the project vendor

mark_as_advanced(CLEAR CCT_VENDOR_METADATA_FILE)

if(NOT CCT_VENDOR_METADATA_FILE)
    message(FATAL_ERROR "vendor_metadata have been request. Your must provide
        a CCT_VENDOR_METADATA_FILE in which we wil retrieve this information")
else()
    CCT_STRING(PRODUCT_VENDOR "")
    CCT_FILE(PRODUCT_LICENCE "")
    CCT_FILE(PRODUCT_LOGO "")
    CCT_FILE(VENDOR_LOGO "")
    include(${CCT_VENDOR_METADATA_FILE})
    #CCT_CHECK_...
    # todo: test for missing mandatory information
endif()
