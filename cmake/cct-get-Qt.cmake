
# option 1: use already installed Qt

    SET(CMAKE_AUTOMOC ON)
    SET(CMAKE_AUTORCC ON)
    SET(CMAKE_INCLUDE_CURRENT_DIR ON)

    FIND_PACKAGE(Qt5 COMPONENTS Core Widgets REQUIRED)

# option 2: use user defined version

