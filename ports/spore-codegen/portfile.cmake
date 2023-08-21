vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO sporacid/spore-codegen
  REF 85988e54b83c698c8d1dc5bd6fe03b2946eb8ad7
  SHA512 061f4d253eac67998d9f17d8952be6d9b058ab64a6d86f8446aa34fccd565f4e59a4eba976e525c1f4acfd7590b20ad6c668adc257356c52efb40469341ab96c
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