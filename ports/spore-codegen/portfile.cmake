vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO sporacid/spore-codegen
  REF 85988e54b83c698c8d1dc5bd6fe03b2946eb8ad7
  SHA512 042835b3c752e13e033c2255dda40b7d042dfa56dd9b477ff423b952a06b7d324d667d5035292f18662c158540468a456d50b8a3afc3042b0bfd6aee3fd898bc
  HEAD_REF main
)

vcpkg_cmake_configure(
  SOURCE_PATH ${SOURCE_PATH}
  OPTIONS
    -DSPORE_BUILD_EXAMPLES=OFF
    -DSPORE_BUILD_TESTS=OFF
    -DSPORE_COMPILE_COMMANDS=OFF
)

vcpkg_cmake_install()

vcpkg_install_copyright(
  FILE_LIST ${SOURCE_PATH}/LICENSE
)

vcpkg_copy_tools(
  TOOL_NAMES spore-codegen
  AUTO_CLEAN
)

file(
  INSTALL ${SOURCE_PATH}/cmake
  DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT}
)

file(
  REMOVE_RECURSE
    ${CURRENT_PACKAGES_DIR}/cmake
    ${CURRENT_PACKAGES_DIR}/debug/include
)