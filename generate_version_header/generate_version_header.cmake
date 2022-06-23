# Custom target will always cause its dependencies to be evaluated and is run by default
add_custom_target(
    dummy_target ALL
    DEPENDS version_header
)

#cmake 3.2+
#cmake_path(NATIVE_PATH "${VHDR_GEN_SCRIPT_PATH}/generate_version_header.cmd" NORMALIZE VHDR_GEN_SCRIPT_PATH_NATIVE)
#cmake_path(NATIVE_PATH "${VHDR_PATH_NAME}" NORMALIZE VHDR_PATH_NAME_NATIVE)

cmake_path(CONVERT "${VHDR_GEN_SCRIPT_PATH}/generate_version_header.cmd" TO_NATIVE_PATH_LIST VHDR_GEN_SCRIPT_PATH_NATIVE NORMALIZE)
cmake_path(CONVERT "${VHDR_PATH_NAME}" TO_NATIVE_PATH_LIST VHDR_PATH_NAME_NATIVE NORMALIZE)

# Will always be rebuilt because it depends on always_rebuild
add_custom_command(
    OUTPUT version_header
    COMMAND cmd /c call "${VHDR_GEN_SCRIPT_PATH_NATIVE}" "${VHDR_PATH_NAME_NATIVE}"
    DEPENDS always_rebuild
)

# Dummy output which is never actually produced. Anything that depends on this will always be rebuilt.
add_custom_command(
    OUTPUT always_rebuild
    COMMAND cmake -E echo
)
