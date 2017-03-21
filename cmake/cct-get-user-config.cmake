

set(CCT_USER_CONFIG_FILE "" CACHE DIRECTORY "User configuration file")

if(NOT EXISTS ${CCT_USER_CONFIG_FILE})
    message(FATAL_ERROR "configuration file: ${CCT_USER_CONFIG_FILE} do not exists")
endif()


include(${CCT_USER_CONFIG_FILE})
