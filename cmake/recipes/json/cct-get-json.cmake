# option 1: use already installed nlohmann json

set(JSON_INCLUDE_DIR ${CMAKE_SOURCE_DIR}/json/src)
message("JSON_INCLUDE_DIR: ${JSON_INCLUDE_DIR}")


option(with-rapidjson "Use rapidJSON" OFF)
mark_as_advanced(with-rapidjson)

option(with-valijson "Use valiJSON" OFF)
mark_as_advanced(with-valijson)



if(with-valijson)

    set(with-rapidjson true)
  #  install_GitCmake_externalProject(valijson "https://github.com/tristanpenman/valijson.git" "HEAD" )

  set(dependency valijson)
  set(repo "https://github.com/tristanpenman/valijson.git")
  set(tag "HEAD")
  ExternalProject_Add(
      ${dependency}-project

      GIT_REPOSITORY ${repo}
      GIT_TAG ${tag}

      UPDATE_COMMAND ""
      PATCH_COMMAND ""

      PREFIX "${CCT_SOURCE_DIR}/${dependency}"
      BINARY_DIR "${CCT_BUILD_DIR}/${dependency}"

      CMAKE_ARGS -D CMAKE_INSTALL_PREFIX:FILEPATH=${CCT_INSTALL_DIR}/${dependency} -D BUILD_TESTING:BOOL=OFF

      TEST_COMMAND ""
    )

endif(with-valijson)


if(with-rapidjson)

    #install_GitCmake_externalProject(rapidjson "https://github.com/miloyip/rapidjson.git" "v1.1.0" )

    set(dependency rapidjson)
    set(repo "https://github.com/miloyip/rapidjson.git")
    set(tag "v1.1.0")
    ExternalProject_Add(
        ${dependency}-project

        GIT_REPOSITORY ${repo}
        GIT_TAG ${tag}

        UPDATE_COMMAND ""
        PATCH_COMMAND ""

        PREFIX "${CCT_SOURCE_DIR}/${dependency}"
        BINARY_DIR "${CCT_BUILD_DIR}/${dependency}"

        CMAKE_ARGS -D CMAKE_INSTALL_PREFIX:FILEPATH=${CCT_INSTALL_DIR}/${dependency} -D BUILD_TESTING:BOOL=OFF -D RAPIDJSON_BUILD_DOC:BOOL=OFF -D RAPIDJSON_BUILD_EXAMPLES:BOOL=OFF -D CMAKE_BUILD_TYPE:STRING=Release -D RAPIDJSON_BUILD_TESTS:BOOL=OFF

        TEST_COMMAND ""
      )

endif(with-rapidjson)
