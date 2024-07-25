cmake_minimum_required(VERSION 3.12)
project (lv_emscripten)

set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -O2 -s USE_SDL=2")

include_directories(${PROJECT_SOURCE_DIR} ${PROJECT_SOURCE_DIR}/lvgl 
	            ${PROJECT_SOURCE_DIR}/lvgl/src
	            ${PROJECT_SOURCE_DIR}/lvgl/src/misc
                    ${PROJECT_SOURCE_DIR}/guiguider/generated
		    ${PROJECT_SOURCE_DIR}/guiguider/custom)

add_subdirectory(lvgl)
add_subdirectory(lv_drivers)
add_subdirectory(guiguider)
file(GLOB MY_SOURCES "./*.c")
set(SOURCES ${MY_SOURCES})

add_executable(index ${SOURCES} ${INCLUDES})

set_source_files_properties(main.c PROPERTIES COMPILE_FLAGS -DCHOSEN_DEMO=${LVGL_CHOSEN_DEMO})


set(CMAKE_EXECUTABLE_SUFFIX ".html")
target_link_libraries(index
    lvgl
    lv_drivers
    guiguider
)
set_target_properties(index PROPERTIES LINK_FLAGS "--shell-file ${PROJECT_SOURCE_DIR}/lvgl_shell.html -s SINGLE_FILE=1")
