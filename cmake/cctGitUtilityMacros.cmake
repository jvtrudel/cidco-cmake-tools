

macro(CCT_GET_SOURCE_VERSIONS)


    if(NOT Git_FOUND)

      # get git package
      find_package(Git)

    endif()

    # Get the current working branch
    execute_process(
      COMMAND ${GIT_EXECUTABLE} rev-parse --abbrev-ref HEAD
      WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
      OUTPUT_VARIABLE GIT_BRANCH
      OUTPUT_STRIP_TRAILING_WHITESPACE
    )


    # Get the latest abbreviated commit hash of the working branch
    execute_process(
      COMMAND ${GIT_EXECUTABLE} log -1 --format=%h
      WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
      OUTPUT_VARIABLE GIT_COMMIT_HASH
      OUTPUT_STRIP_TRAILING_WHITESPACE
    )

    message("GIT_COMMIT_HASH: ${GIT_COMMIT_HASH}")
    message("GIT_BRANCH: ${GIT_BRANCH}")
   set(CCT_PROJECT_GIT_HASH ${GIT_COMMIT_HASH} CACHE INTERNAL "")


endmacro()

