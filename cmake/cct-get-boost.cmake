# option 1: user selected directory


add_definitions( -DBOOST_ALL_NO_LIB )
set( Boost_USE_STATIC_LIBS ON )
find_package(Boost COMPONENTS SYSTEM FILESYSTEM REQUIRED)
INCLUDE_DIRECTORIES(${Boost_INCLUDE_DIR})
