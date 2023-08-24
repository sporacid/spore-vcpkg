vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO sporacid/spore-codegen
  REF f80b62397a8e4f63150e322818ab8359e268d49a
  SHA512 decb852cec224e77c4f2236020b40aff786d2143baa4e99e9613adeb807e0d165f3e137e7a3ddaa739ac79189f30d229e50f0f4971d0a7212c2d8225abd0a525
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