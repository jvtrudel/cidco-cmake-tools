# set global cache variables
function(CCT_STRING var val)
    set(CCT_${var} ${val} CACHE STRING "")
    mark_as_advanced(CCT_${var})
endfunction()

function(CCT_BOOL var val)
    set(CCT_${var} ${val} CACHE BOOL "")
    mark_as_advanced(CCT_${var})
endfunction()

function(CCT_DIRECTORY var val)
    set(CCT_${var} ${val} CACHE DIRECTORY "")
    mark_as_advanced(CCT_${var})
endfunction()

function(CCT_FILE var val)
    set(CCT_${var} ${val} CACHE FILE "")
    mark_as_advanced(CCT_${var})
endfunction()


#  Manage dependencies setting
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

   set(_tmp ${CCT_REQUIRED_DEPENDENCIES} ${_dep_WITH} )
   list(REMOVE_DUPLICATES _tmp)

   set(CCT_REQUIRED_DEPENDENCIES "${_tmp}" CACHE INTERNAL "CCT_REQUIRED_DEPENDENCIES")
   foreach(_dep IN LISTS CCT_REQUIRED_DEPENDENCIES)
       set(with-${_dep} ON CACHE BOOL "" FORCE)
       foreach(_dir IN LISTS CCT_RECIPES_DIR)
           if(EXISTS ${_dir}/cct-get-${_dep}.cmake)
             include(${_dir}/cct-get-${_dep}.cmake)
         endif()
       endforeach()
   endforeach()
endfunction()
