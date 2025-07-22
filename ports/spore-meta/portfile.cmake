vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO sporacid/spore-meta
  REF 3a3f610e23da8c782412f22eb3a70606cb2bd2a3
  SHA512 ab6502f675c2e8ec7910570471d2466708e87654ba534b0e42feecfeaf16c57d8e030c0ab9ec6edf1847ea4b9c6a99b2919fad77ae2bbf23bd4c2b0233e96f6c
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