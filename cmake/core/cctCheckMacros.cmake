
# check if something valid exist
function(CCT_CHECK_STRING var)
  if(${var} EQUAL "")
    set(CCT_${var} ${val} CACHE STRING "")
  endif()
endfunction()


# set as global variables

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
