vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO sporacid/spore-codegen
  REF 849083abbc7d75611b68d28ae6efd9b727b2c387
  SHA512 7ae87b8cc271a1289a3f2d4910d3e1657d0b0fad0d4b65ff13702ba005ebc13542f89f760c421103990cc6c1cfe30dc577014fb7610c55d9b2949d97fc078fee
  HEAD_REF main
)

vcpkg_cmake_configure(
  SOURCE_PATH ${SOURCE_PATH}
  OPTIONS
    -DSPORE_BUILD_EXAMPLES=OFF
    -DSPORE_BUILD_TESTS=OFF
)

vcpkg_cmake_install()

vcpkg_install_copyright(
  FILE_LIST ${SOURCE_PATH}/LICENSE
)

vcpkg_copy_tools(
  TOOL_NAMES spore-codegen
  AUTO_CLEAN
)

configure_file(
  ${CMAKE_CURRENT_LIST_DIR}/config.cmake.in
  ${CURRENT_PACKAGES_DIR}/share/${PORT}/${PORT}-config.cmake
  @ONLY
)

file(
  INSTALL ${SOURCE_PATH}/cmake/
  DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT}
)

file(
  INSTALL ${CMAKE_CURRENT_LIST_DIR}/usage
  DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT}
)

file(
  REMOVE_RECURSE
    ${CURRENT_PACKAGES_DIR}/cmake
    ${CURRENT_PACKAGES_DIR}/debug
)