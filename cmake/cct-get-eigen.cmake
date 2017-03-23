# Option 1: user specified installed eigen library

set(EIGEN3_CONFIG_DIR "" CACHE DIRECTORY "Directory containing Eigen3-config.cmake")

if(NOT EIGEN3_CONFIG_DIR)
    message(FATAL_ERROR "EIGEN3_CONFIG_DIR must be provided")
endif()

set(CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/cmake)

message("EIGEN3_CONFIG_DIR: ${EIGEN3_CONFIG_DIR}")
find_package(Eigen3 REQUIRED PATHS ${EIGEN3_CONFIG_DIR} NO_DEFAULT_PATH)
