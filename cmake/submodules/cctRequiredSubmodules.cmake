# outils de gestion automatique des dépendances
#
# CCT_SUBMODULES_LIST :: liste de tous les submodules nécessaires au projet
#
# Informations relative à un submodule
# CCT_SUBMODULE_<submodule> = {commit, url, tag}
# CCT_SUBMODULE_<submodule>_submodules = {...} :: liste des submodules dépendant du submodule
#      attention: CCT_SUBMODULE_<submodule>_submodules n'est pas évident à déterminer en mode horizontal...

# ce package nécessite git
if(NOT Git_FOUND)
  find_package(Git REQUIRED)
endif()



macro(CCT_SUBMODULE_GET_SUBMODULES_DATA path output_list)
    # retourne la liste des info des sous-modules d'un repertoire git
    # 0: name
    # 1: commit
    # 2: url
    # 3: tag

    execute_process(
      COMMAND ${GIT_EXECUTABLE} submodule status
      WORKING_DIRECTORY ${path}
      OUTPUT_VARIABLE submodules_status
      OUTPUT_STRIP_TRAILING_WHITESPACE
    )

    string(REPLACE "\n" ";" submodules_status "${submodules_status}")

    set(tmp "${submodules_status}")
    set(submodules_status "")

    foreach(line ${tmp})

        # on doit enlever le premier caractère ! (il y a un espace, un + ou un - à la sortie de git submodule status selon l'état)
        string(LENGTH "${line}" len)
        string(SUBSTRING "${line}" 1 ${len} val)
        string(REPLACE " " ";" val_list "${val}")
        list(LENGTH val_list len)

        #message("val: ${val_list}")
        #message("len: ${len}")
        list(GET val_list 0 _commit)
        list(GET val_list 1 _name)

        if(len GREATER_EQUAL 3)
            list(GET val_list 2 _tag)
            string(REPLACE "(" "" _tag "${_tag}")
            string(REPLACE ")" "" _tag "${_tag}")
        else()
            set(_tag "")
        endif()

        # récupération de l'url
        execute_process(
          COMMAND ${GIT_EXECUTABLE} config --get submodule.${_name}.url
          WORKING_DIRECTORY ${path}
          OUTPUT_VARIABLE repo_url
          OUTPUT_STRIP_TRAILING_WHITESPACE
        )


    set(submodules_status "${_name} ${_commit} ${repo_url} ${_tag};${submodules_status}")
    endforeach()

    set(${output_list} ${submodules_status} CACHE INTERNAL "")
endmacro()


macro(CCT_SUBMODULE_SPLIT_SUBMODULES_DATA line name commit url tag)
    # extraction des données d'une ligne

    #message("test: ${line}")
    string(REPLACE " " ";" line "${line}")

    list(LENGTH line len)

    list(GET line 0 _name)
    set(name ${_name} CACHE INTERNAL "")
    list(GET line 1 _commit)
    set(commit ${_commit} CACHE INTERNAL "")
    list(GET line 2 _url)
    set(url ${_url} CACHE INTERNAL "")
    if(len GREATER_EQUAL 4)
      list(GET line 3 _tag)
  endif()
      set(tag "${_tag}" CACHE INTERNAL "")

endmacro()

macro(CCT_SUBMODULE_GET_NAMES_FROM_SUBMODULES_DATA input output_list)
    # À partir de la liste des données des submodules,
    # extraire la liste des noms
    set(out "")
    foreach(data ${input})
        string(REPLACE " " ";" tdata "${data}")
        list(GET tdata 0 gotit)
        #message("test: ${gotit}")
        set(out "${gotit};${out}")
    endforeach()
    #message("test: ${out}")
    set(${output_list} ${out} CACHE INTERNAL "")
endmacro()

macro(CCT_SUBMODULE_ADD_MODULE name)
    # ajoute un submodule à la liste des modules indexés
    set(CCT_SUBMODULES_LIST "${name};${CCT_SUBMODULE_LIST}" CACHE INTERNAL "")
    list(REMOVE_DUPLICATES CCT_SUBMODULES_LIST)
endmacro()

macro(CCT_SUBMODULE_ADD_DEPENDENT_SUBMODULE parent name commit url tag)
    # ajoute les dépencances d'un submodule
    set(CCT_SUBMODULE_${name} "${commit} ${url} ${tag};${CCT_SUBMODULE_${name}}" CACHE INTERNAL "")
    list(REMOVE_DUPLICATES CCT_SUBMODULE_${name})
    set(CCT_SUBMODULE_${parent}_submodules "${name};${CCT_SUBMODULE_${parent}_submodules}" CACHE INTERNAL "")
    list(REMOVE_DUPLICATES CCT_SUBMODULE_${parent}_submodules)
endmacro()






macro(CCT_SUBMODULE_GET_DEPENDENCIES path name)
    # macro générique pour récupérer les dépendances
    #  - sous-modules
    #  - librairies (non implémentés)
    #
    # output:
    #    une liste de triplets {commit, nom, tag (si existe)}
    #    est mis dans la vaviable CCT_SUBMODULES_OF_${name}


    # récupère les informations des submodules
    CCT_SUBMODULE_GET_SUBMODULES_DATA("${path}" _data)
    # récupère les nom
    CCT_SUBMODULE_GET_NAMES_FROM_SUBMODULES_DATA("${_data}" names)
    # enregistre les nom
    #message("test: ${names}")
    CCT_SUBMODULE_ADD_MODULE("${names}")
    foreach(module ${_data})
        # on récupère les infos de ce submodule
        #message("test: ${module}")
        CCT_SUBMODULE_SPLIT_SUBMODULES_DATA("${module}" _name _commit _url _tag)

        # on récupères les submodules dont dépend ce submodule




        CCT_SUBMODULE_ADD_DEPENDENT_SUBMODULE(${name} ${_name} ${_commit} ${_url} "${_tag}")

     endforeach()

endmacro()


macro(CCT_SUBMODULE_UPDATE_DEPENDENCIES)
   # récupère les dépendances

endmacro()


macro(CCT_SUBMODULE_CLONE_SUBMODULE name url)
    # cloner les submodules dépendants dépendances


    execute_process(
        COMMAND  echo ""  #"ssh -T git@github.com"
        WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
        OUTPUT_VARIABLE testt
        OUTPUT_STRIP_TRAILING_WHITESPACE
        )

    message(" ssh tset... ${url} \n${testt}")
    execute_process(
      COMMAND ${GIT_EXECUTABLE} submodule add ${url} ${name}
      WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
      OUTPUT_VARIABLE submodules_status
      OUTPUT_STRIP_TRAILING_WHITESPACE
    )
endmacro()
#macro(CCT_GET_SUBMODULE_DEPENDENCIES submodule)
    # récupère les dépendances d'un sous-modules
    #  - sous-modules
    #  - librairies (non implémentés)
    #
    # output:
    #    une liste de triplets {commit, nom, tag (si existe)}
    #    est mis dans la vaviable CCT_SUBMODULES_OF_${submodule}

 #   set(target_dir ${CMAKE_CURRENT_LIST_DIR})

 #   CCT_GET_SUBMODULE_DEPENDENCIES_generic(${target_dir} ${submodule})


#endmacro()



#macro(CCT_GET_PROJECT_DEPENDENCIES)
    # récupère les dépendances du projet
    #  - sous-modules
    #  - librairies (non implémentés)
    #
    # output:
    #    une liste de triplets {commit, nom, tag (si existe)}
    #    est mis dans la vaviable CCT_SUBMODULES_OF_${PROJECT_NAME}

 #    CCT_GET_SUBMODULE_DEPENDENCIES_generic(${PROJECT_NAME} ${CMAKE_CURRENT_SOURCE_DIR})

#endmacro()




macro(CCT_GET_DEPENDENCIES)
   # Récupère les dépendances
   #  - sous-modules
   #  - librairies (non impliémenté)

   # dépendence du projet
   CCT_GET_PROJECT_DEPENDENCIES()

   #on récupère les sous modules
   CCT_GET_SUBMODULE_SUBMODULES(${PROJECT_NAME} dep)
   foreach(module ${dep})
    #   message("sous-module: ${module}")
       CCT_GET_SUBMODULE_DEPENDENCIES(${module})
   endforeach()


   list(LENGTH CCT_SUBMODULES_LIST n)
   set(m -1)
   set(good false)

   while(NOT good)
       message("while")
       # on enlève le projet de la liste des modules
       set(modules ${CCT_SUBMODULES_LIST})
       list(REMOVE_ITEM modules ${PROJECT_NAME})

       foreach(module ${modules})
           message("module: ${module}")
           if(NOT EXISTS ${CMAKE_CURRENT_SOURCE_DIR}/${module})

               message(FATAL_ERROR "module ${module} n'existe pas. Téléchargement à partir de ${repo_url}")
           endif()
           CCT_GET_SUBMODULE_DEPENDENCIES(${module})
       endforeach()
       set(m ${n})
       list(LENGTH CCT_SUBMODULES_LIST n)
       if(m EQUAL n)
           set(good true)
       endif()
   endwhile()

endmacro()
