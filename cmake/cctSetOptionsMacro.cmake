#  Manage dependencies setting





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
   set(CCT_REQUIRED_DEPENDENCIES ${CCT_REQUIRED_DEPENDENCIES} ${_dep_WITH} CACHE INTERNAL "CCT_REQUIRED_DEPENDENCIES")

endfunction()
