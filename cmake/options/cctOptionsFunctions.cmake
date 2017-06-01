#  Manage CCT Options



function(CCT_PROCEED_OPTIONS)
foreach(_opt IN LISTS CCT_REQUIRED_OPTIONS)
    if (${_opt} IN_LIST CCT_AVAILABLE_OPTIONS)
        include(${CCT_ROOT}/options/cct-option-${_opt}.cmake)
    else()
        CCT_MESSAGE("${_opt} is not a valid option")
    endif()

  endforeach()
endfunction()


# set options
function(CCT_SET_OPTIONS)
    list(LENGTH ARGN argn_len)
    if(${argn_len} EQUAL 0)
        MESSAGE(FATAL_ERROR "CCT_SET_OPTION must not be empty")
    endif()
   cmake_parse_arguments(
       _dep
       "" # bool args
       "" # mono-valued arguments
       "WITH" # multi-valued arguments
       ${ARGN} # arguments to parse
       )



   set(_tmp ${CCT_REQUIRED_OPTIONS} ${_dep_WITH} )
   list(REMOVE_DUPLICATES _tmp)

   set(CCT_REQUIRED_OPTIONS "${_tmp}" CACHE INTERNAL "CCT_REQUIRED_OPTIONS")

    CCT_PROCEED_OPTIONS()

endfunction()
