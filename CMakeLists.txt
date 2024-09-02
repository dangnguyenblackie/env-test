CMAKE_MINIMUM_REQUIRED(VERSION 3.4.1)
project(TestCalc)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_FLAGS "-DWITH_OPENSSL -DWITH_DOM")

include_directories(${PROJECT_SOURCE_DIR}/include)

aux_source_directory(${PROJECT_SOURCE_DIR}/src src)

set(sourcecode ${src})

add_library(add SHARED ${sourcecode})

install(TARGETS add
        LIBRARY DESTINATION /usr/local/lib)

install(DIRECTORY ${PROJECT_SOURCE_DIR}/include/
        DESTINATION /usr/local/include)