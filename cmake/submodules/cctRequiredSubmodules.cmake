macro(CCT_GET_SUBMODULE_DEPENDENCIES submodule)
    # récupère les dépendances (sous-module et librairies) des sous-modules
    #
    # output:
    #    une liste de triplets {commit, nom, tag (si existe)}
    #    est mis dans la vaviable CCT_SUBMODULES_OF_${submodule}

    if(NOT Git_FOUND)
      find_package(Git REQUIRED)
    endif()

    set(target_dir ${CMAKE_CURRENT_LIST_DIR}/${submodule})
    #message("target: ${target_dir}")

    execute_process(
      COMMAND ${GIT_EXECUTABLE} submodule status
      WORKING_DIRECTORY ${target_dir}
      OUTPUT_VARIABLE submodules_status
      OUTPUT_STRIP_TRAILING_WHITESPACE
    )

    string(REPLACE "\n" ";" submodules_status "${submodules_status}")
    set(CCT_SUBMODULES_OF_${submodule} ${submodules_status} CACHE INTERNAL "")
    set(CCT_SUBMODULES_LIST "${submodule};${CCT_SUBMODULES_LIST}")

    #message("etat des submodules de ${submodule}:\n ${submodules_status}")

endmacro()


macro(CCT_REQUIRED_SUBMODULES list)

set(tmp )


   foreach(_elem ${${list}})
       set(tmp ${tmp} ${prefix}/${_elem})
   endforeach()
   set(${list} ${tmp} CACHE INTERNAL "")
endmacro()
