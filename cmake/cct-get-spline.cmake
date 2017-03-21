

 # option 1: user defined directory
 if(EXISTS ${SPLINE_DIR}/spline.h)
   set(SPLINE_FOUND TRUE)
    set(SPLINE_INCLUDE_DIR ${SPLINE_DIR})
 endif()

# option 2: download
if (NOT ${SPLINE_FOUND})
   message(FATAL_ERROR "download spline function... not implemented")
endif()
