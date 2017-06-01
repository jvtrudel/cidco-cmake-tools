# Convenience function for "fancy and coherent" message printing


# Print message if user requested it
macro(CCT_MESSAGE)
   if(CCT_VERBOSE)
      foreach( _elem ${ARGN})
        message("CCT >  ${_elem}")
      endforeach()
   endif()
endmacro()

macro(CCT_FATAL_ERROR)
      message("CCT >  FATAL ERROR!")
      foreach( _elem ${ARGN})
        message("CCT >  ${_elem}")
      endforeach()
      message(FATAL_ERROR "CCT >  FATAL ERROR!")
endmacro()


# todo: generalisation of printing levels
function(cct_print_variable option_name level)
    if(${level} EQUAL 1)
       cct_message(" -- ${option_name}: ${${option_name}}")
    elseif(${level} EQUAL 2)
       cct_message(" --     ${option_name}: ${${option_name}}")
    endif()
endfunction()
