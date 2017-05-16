macro(CCT_ADD_PREFIX list prefix)

set(tmp )
   foreach(_elem ${${list}})
       set(tmp ${tmp} ${${prefix}}/${_elem})
   endforeach()
   set(${list} ${tmp} CACHE INTERNAL "")
endmacro()
