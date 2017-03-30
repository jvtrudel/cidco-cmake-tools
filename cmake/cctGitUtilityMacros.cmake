if(NOT Git_FOUND)


  # git version
  find_package(Git)

endif()


macro(CCT_GET_SOURCE_VERSIONS)

  # Get the latest abbreviated commit hash of the working branch
  execute_process(
    COMMAND ${GIT_EXECUTABLE} log -1 --format=%h
    WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
    OUTPUT_VARIABLE _GIT_COMMIT_HASH
    OUTPUT_STRIP_TRAILING_WHITESPACE
  )

  set(CCT_PROJECT_GIT_HASH _GIT_COMMIT_HASH CACHE INTERNAL "")

endmacro()

#[[
# Get the current working branch
execute_process(
  COMMAND ${GIT_EXECUTABLE} rev-parse --abbrev-ref HEAD
  WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
  OUTPUT_VARIABLE _GIT_BRANCH
  OUTPUT_STRIP_TRAILING_WHITESPACE
)
]]#
