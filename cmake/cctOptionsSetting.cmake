#  optionsSetting: define general options and environment variables
#  (design inspired by Homebrew)


# store required dependancies
set(CCT_REQUIRED_DEPENDENCIES "" CACHE INTERNAL "CCT_REQUIRED_DEPENDENCIES")


# reusable configuration file
option(with-user-config false "You have a configuration file... Where is it?")
set(CCT_VERBOSE true CACHE BOOL "Print CCT_MESSAGES?")



# 32 or 64 bits
set(binary_bitness 64 CACHE string "You want 32-bit or 64-bit binaries?")
mark_as_advanced(binary_bitness)



# environment variables used when installing external project
set(CCT_SOURCE_ROOT "" CACHE DIRECTORY "PATH where to put fechted sources external project")
set(CCT_BUILD_ROOT "" CACHE DIRECTORY "PATH where to put builded external project")
set(CCT_INSTALL_ROOT "" CACHE DIRECTORY "PATH where to install external project")

mark_as_advanced(CCT_SOURCE_ROOT)
mark_as_advanced(CCT_BUILD_ROOT)
mark_as_advanced(CCT_INSTALL_ROOT)



# Python
option(with-python "Need python?" OFF)

# Qt
option(with-qt "Do you need Qt?" OFF)

#json
option(with-json "Do you need a json parser?" OFF)

# Boost
option(with-boost "You need boost?" OFF)

# Eigen
option(with-eigen "you need Eigen?" OFF)

# vtk
option(with-vtk "you need vtk?" OFF)

# pcl
option(with-pcl "you need pcl?" OFF)

# spline
option(with-spline "need a spline interpolation library?" OFF)





# todo: change message policies as:
#   with-verbose: enable message of everyone
#   with cct_verbose: enable messages for cct module only
if(CCT_VERBOSE)
    set(with-verbose true)
else()
    set(with-verbose false)
endif()



# report active options
if(with-verbose)

    cct_print_variable(with-verbose 1)
    cct_print_variable(binary_bitness 1)

    cct_print_variable(with-python 1)
    cct_print_variable(with-qt 1)
    cct_print_variable(with-boost 1)
    cct_print_variable(with-eigen 1)
    cct_print_variable(with-vtk 1)
    cct_print_variable(with-pcl 1)


endif()
