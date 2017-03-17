# convenience macros devoted to install and find external project dependencies

include(ExternalProject)

macro(install_GitCmake_externalProject dependency repo tag)

  ExternalProject_Add(
      ${dependency}-project

      GIT_REPOSITORY ${repo}
      GIT_TAG ${tag}

      UPDATE_COMMAND ""
      PATCH_COMMAND ""

      PREFIX "${CCT_SOURCE_DIR}/${dependency}"
      BINARY_DIR "${CCT_BUILD_DIR}/${dependency}"

      CMAKE_ARGS -D CMAKE_INSTALL_PREFIX:FILEPATH="${CCT_INSTALL_DIR}/${dependency}"

      TEST_COMMAND ""
    )
endmacro()
