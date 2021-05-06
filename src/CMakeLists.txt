
#  add_compile_options(-I ${CMAKE_CURRENT_SOURCE_DIR}/ )


file(GLOB ASSEMBLY_FILES ${PROJECT_SOURCE_DIR}/src/*.asm)
# set_source_files_properties(${ASSEMBLY_FILES} PROPERTIES LANGUAGE ASM_NASM)

file (GLOB INCLUDES ${PROJECT_SOURCE_DIR}/include/asm_linux/*.asm)

set (self ${PROJECT_NAME})



foreach (file ${ASSEMBLY_FILES})
	get_filename_component (name ${file} NAME_WE)
	add_executable (${name} ${file})
	target_include_directories (${name} PUBLIC ${CMAKE_SOURCE_DIR}/include/asm_linux)
endforeach ()
