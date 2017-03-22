# CIDCO cmake tools

A cmake package that provide an intuitive and standard convenient mechanism to retrieve, install and enable external libraries.

## Design

Inspired from HomeBrew.

### Use semantic keywords to pass options

  - with-\<lib>
    - boost, qt, vtk, eigen, etc...
  - binary-bitness
    - 32 or 64 bits?

### Use cmake find\<xyz> standards

Use api and variable names defined by cmake's find packages and config files.

### Provide standardised options to get an external library

  - use installed library
    - automatically found
    - user selected
  - install it
    - from the web
    - from local source files  

# Quick Start

## Installation

Get a copy of that git repo e.g.

    git clone git@github.com:jvtrudel/cidco-cmake-tools.git

or use your preferred method.

## Load it in your cmake project

    find_package(CCT PATHS ${CCT_DIR} NO_DEFAULT_PATH)

## Enable a package

    set(with-qt ON CACHE BOOL "need QT" FORCE)

This should be changed ([#1](https://github.com/jvtrudel/cidco-cmake-tools/issues/1))

## Use a configuration file

Instead of manually passing informations for each library, you can pass a configuration file.

Set ````with-user-config```` option to true and set the path to your configuration file in ````CCT_USER_CONFIG_FILE````.



# LICENSE (MIT)


Copyright 2017 © Centre Interdisciplinaire de développement en Cartographie des Océans (CIDCO)

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
