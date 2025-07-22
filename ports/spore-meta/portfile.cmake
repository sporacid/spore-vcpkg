vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO sporacid/spore-meta
  REF fd45267a42f52870487bac3b327a18507a95cf9b
  SHA512 994264ab91850e61a9b634a9cab2651a8cfe1b20196eb8951e649a9742fd0c85ebf5eaaa08a37f5edafbfad07cc5c364026c86e1ddea82bd9933cdca4c77fcff
  HEAD_REF main
)

vcpkg_cmake_configure(
  SOURCE_PATH ${SOURCE_PATH}
  OPTIONS
    -DSPORE_BUILD_EXAMPLES=OFF
)

vcpkg_cmake_install()

vcpkg_install_copyright(
  FILE_LIST ${SOURCE_PATH}/LICENSE
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
  INSTALL ${SOURCE_PATH}/codegen/
  DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT}/codegen
)

file(
  REMOVE_RECURSE
  ${CURRENT_PACKAGES_DIR}/cmake
  ${CURRENT_PACKAGES_DIR}/codegen
  ${CURRENT_PACKAGES_DIR}/debug
)

if (EXISTS ${SOURCE_PATH}/VERSION)
  file(
    INSTALL ${SOURCE_PATH}/VERSION
    DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT}
  )
endif ()