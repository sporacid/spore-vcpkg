vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO sporacid/spore-codegen
  REF 448de3f583ee2348ec1c5171fd891ffd0827845a
  SHA512 b04a2f296916978bcf43ac50905003afaeedbc35a64b5c069de597f244a5cb6773b2ff5b9944dfdb51e514c4c5e37d44cb560658c4473901a69c10f352d8ea48
  HEAD_REF main
)

vcpkg_cmake_configure(
  SOURCE_PATH ${SOURCE_PATH}
  OPTIONS
    -DCMAKE_BUILD_TYPE=Release
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