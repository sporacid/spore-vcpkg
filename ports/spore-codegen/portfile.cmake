vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO sporacid/spore-codegen
  REF 8cf1eefbe4d4faa681710d55f64524a22fcd067a
  SHA512 e4c11e36426eae4b0a47a7af2b38e171823a317ed4b102b42a7c72531bc4074a7cf67d15be100a314b14d5cf0bf2b734fe8d5c6c63e3f01300f18499c9e440ac
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
    ${CURRENT_PACKAGES_DIR}/debug/cmake
    ${CURRENT_PACKAGES_DIR}/debug/include
)