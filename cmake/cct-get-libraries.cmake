# prend une liste de nom de librarie (avec redondance) redondance et retourne les link paths
macro(CCT_GET_LIBRARIES list)
    list(REMOVE_DUPLICATES ${list})
    foreach(elem ${${list}})
        # attention: codé en dure pour l'instant...
        if(${elem} STREQUAL Qt5)
            set(tmp ${tmp} Qt5::Widgets)
        endif()
    endforeach()

    set(${list} ${tmp} CACHE INTERNAL "")
endmacro()
