# CIDCO cmake tools

CMake convenience tools aiming to ease continuous integration of modular projects.


## Requirements

  - cmake
  - git

# Quick Start

## Installation

### Best way

The recommended way to use cidco-cmake-tools is to include it as a submodule in your project.

    git clone git@github.com:jvtrudel/cidco-cmake-tools.git

Then, it is automatically available at the right version when you ship your project.

Include this line in your CMakeList.txt file:

    FIND_PACKAGE(CCT PATHS ${CMAKE_CURRENT_SOURCE_DIR}/cidco-cmake-tools NO_DEFAULT_PATH)

### Alternate way

Get a copy of the git repo:

    git clone git@github.com:jvtrudel/cidco-cmake-tools.git

Then, configure the cmake variable ````CCT_DIR```` and include that line in your CMakeLists.txt file:

    set(CCT_DIR "" CACHE DIRECTORY "cidco-cmake-tools directory")
    if(NOT CCT_DIR)
        message(FATAL_ERROR
            "User must provide CCT_DIR (cidco-cmake-tools)\n"
            "To instantly obtain a copy, use the git command:"
            "   git clone git@github.com:jvtrudel/cidco-cmake-tools.git"
            )
    endif()
    find_package(CCT PATHS ${CCT_DIR} NO_DEFAULT_PATH)

## Configuration

**CCT** use configuration files. At the actual development stage, it is simply a bunch of non convenient cmake scripts. But that should be replaced in a near future by yaml or json files [issue #2](https://github.com/jvtrudel/cidco-cmake-tools/issues/2).

### Configuration files

  - config-cct.cmake: (mandatory) Describe the project, project metadata. Must be in ````CMAKE_CURRENT_SOURCE_DIR````.  (````CCT_PROJECT_CONFIG_FILE````, not used yet)
  - <machine/configuration>.cmake ``CCT_USER_CONFIG_FILE``: (optional) Describe the local machine setup including libraries.
  - <vendor>.cmake ````CCT_USER_CONFIG_FILE````: (optional) Vendor metadata.

### CCT variables

  - ````with-<lib>````: control optional use of libraries

...



# LICENSE (MIT)


Copyright 2017 © Centre Interdisciplinaire de développement en Cartographie des Océans (CIDCO)

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.



# Design Principles

Inspired from HomeBrew.

## Use semantic keywords to pass options

  - with-\<lib>
    - boost, qt, vtk, eigen, etc...
  - binary-bitness
    - 32 or 64 bits?

## Use configuration files



## Use CMake  *standards* and best practices

  - Use api and variable names defined by cmake's find packages and config files.

## Provide standardised options to get an external library

  - use installed library
    - automatically found
    - user selected
  - install it
    - from the web
    - from local source files  
