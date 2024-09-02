CMAKE_MINIMUM_REQUIRED(VERSION 3.4.1)
project(test_calc)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_FLAGS "-DWITH_OPENSSL -DWITH_DOM")

include_directories(/usr/local/include/)
link_directories(/usr/local/lib)

add_executable(${PROJECT_NAME} main.cpp)
target_link_libraries(${PROJECT_NAME} add)

set(CMAKE_INSTALL_PREFIX "${CMAKE_CURRENT_SOURCE_DIR}")
install(TARGETS ${PROJECT_NAME} RUNTIME DESTINATION ${CMAKE_INSTALL_PREFIX})