# Project specific configuration/information

set(project-config-file ${CCT_CONFIG_DIR}/project.cmake)
message("project-config-file: ${project-config-file}")

if(EXISTS "${project-config-file}")
   include(${project-config-file})
else()
   CCT_MESSAGE("Ignore 'project' option: configuration not provided.")
endif()


# test project variables

