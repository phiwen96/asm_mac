cmake_minimum_required (VERSION 3.19.2)

project (asm_linux)
set (_Darwin 0)
set (_Linux 0)
set (_Windows 0)

enable_language(ASM_NASM)


set (_Processor -1)

if (${CMAKE_SYSTEM_PROCESSOR} MATCHES "x86_64")
    set (_Processor 0)
else ()
    message (FATAL_ERROR "unknown processor")
endif ()

set (_System -1)

if (${CMAKE_SYSTEM_NAME} MATCHES "Darwin")
# message("Darwin")
    set (_System 0)
    # add_compile_definitions (Darwin)
elseif(${CMAKE_SYSTEM_NAME} MATCHES "Linux")
    set (_System 1)
    # add_compile_definitions (Linux)
elseif(${CMAKE_SYSTEM_NAME} MATCHES "Windows")
    message (FATAL_ERROR "not yet defined for Windows")

    set (_System 2)
    # add_compile_definitions (Windows)
else ()
    message (FATAL_ERROR "unknown system ${CMAKE_SYSTEM_NAME}")
endif ()


add_compile_options(
    "$<$<COMPILE_LANGUAGE:ASM_NASM>:-f $<IF:$<BOOL:$<TARGET_PROPERTY:NASM_OBJ_FORMAT>>, \
    $<TARGET_PROPERTY:NASM_OBJ_FORMAT>, ${CMAKE_ASM_NASM_OBJECT_FORMAT}>>"
)
set(CMAKE_ASM_NASM_FLAGS "${ASM_NASM_FLAGS} -g")
# set(CMAKE_ASM_NASM_FLAGS_DEBUG "-g -F stabs")
set(CMAKE_ASM_NASM_COMPILE_OBJECT "<CMAKE_ASM_NASM_COMPILER> <INCLUDES> \
    <FLAGS> -f ${CMAKE_ASM_NASM_OBJECT_FORMAT} -o <OBJECT> <SOURCE>")
# set(CMAKE_ASM_NASM_COMPILE_OBJECT "<CMAKE_ASM_NASM_COMPILER> <INCLUDES> <FLAGS> -o <OBJECT> <SOURCE>")
if (${CMAKE_SYSTEM_NAME} MATCHES "Darwin")
    set(CMAKE_ASM_NASM_LINK_EXECUTABLE "ld -e _main -static <CMAKE_ASM_NASM_LINK_FLAGS> <LINK_FLAGS> <OBJECTS>  -o <TARGET> <LINK_LIBRARIES>")
elseif(${CMAKE_SYSTEM_NAME} MATCHES "Linux")
    set(CMAKE_ASM_NASM_LINK_EXECUTABLE "ld -e _main -static <CMAKE_ASM_NASM_LINK_FLAGS> <LINK_FLAGS> <OBJECTS>  -o <TARGET> <LINK_LIBRARIES>")
endif()
# set(CMAKE_ASM_NASM_SOURCE_FILE_EXTENSIONS ${CMAKE_ASM_NASM_SOURCE_FILE_EXTENSIONS} s S)
set(CMAKE_ASM_NASM_OBJECT_FORMAT macho64)

add_subdirectory (src)




# objdump -M intel -d src/test    