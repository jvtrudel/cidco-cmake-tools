
# option 1: use already installed Qt

    SET(CMAKE_AUTOMOC ON CACHE INTERNAL "")
    SET(CMAKE_AUTORCC ON CACHE INTERNAL "")
    SET(CMAKE_INCLUDE_CURRENT_DIR ON CACHE INTERNAL "")

    FIND_PACKAGE(Qt5 COMPONENTS Core Widgets REQUIRED)
    set(Qt5 ${Qt5} CACHE INTERNAL "")

# option 2: use user defined version

