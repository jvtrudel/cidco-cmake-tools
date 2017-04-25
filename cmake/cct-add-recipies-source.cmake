#add a repository that contain cct recipies


macro(CCT_ADD_RECIPIES_SOURCE path)
    set(CCT_RECIPES_DIR "${CCT_RECIPES_DIR};${path}" CACHE INTERNAL "")
endmacro()
