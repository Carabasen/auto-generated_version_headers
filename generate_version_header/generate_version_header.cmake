if (WIN32)
    #cmake 3.2+
    #cmake_path(NATIVE_PATH "${VHDR_GEN_SCRIPT_PATH}/generate_version_header.cmd" NORMALIZE VHDR_GEN_SCRIPT_PATH_NATIVE)
    #cmake_path(NATIVE_PATH "${VHDR_PATH_NAME}" NORMALIZE VHDR_PATH_NAME_NATIVE)

    cmake_path(CONVERT "${VHDR_GEN_SCRIPT_PATH}/generate_version_header.cmd" TO_NATIVE_PATH_LIST VHDR_GEN_SCRIPT_PATH_NATIVE NORMALIZE)
    cmake_path(CONVERT "${VHDR_PATH_NAME}" TO_NATIVE_PATH_LIST VHDR_PATH_NAME_NATIVE NORMALIZE)

    add_custom_target(
        version_header
        COMMAND cmd /c call "${VHDR_GEN_SCRIPT_PATH_NATIVE}" "${VHDR_PATH_NAME_NATIVE}"
        WORKING_DIRECTORY "${CMAKE_SOURCE_DIR}"
    )
endif (WIN32)

if (UNIX)
    add_custom_target(
        version_header
        COMMAND ${VHDR_GEN_SCRIPT_PATH}/generate_version_header.sh ${VHDR_PATH_NAME}
        WORKING_DIRECTORY "${CMAKE_SOURCE_DIR}"
    )
endif (UNIX)
