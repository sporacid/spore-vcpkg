vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO sporacid/spore-meta
  REF 42072358ea9e3e4e75241ddfe3eb6bc2dbf83ba6
  SHA512 f2ed2222fba152fcf2cc1269a7309edfaca355d9d8e859bb65012b4c1938e788ee4dcb2e3c411f8b4da6b2d8196def4e48ff6c6a82300f1a845c17f755b74948
  HEAD_REF main
)

vcpkg_check_features(
  OUT_FEATURE_OPTIONS SPORE_META_FEATURES
  FEATURES
    examples  SPORE_WITH_EXAMPLES
    std-types SPORE_WITH_STD_TYPES
    type-registration SPORE_WITH_TYPE_REGISTRATION
)

vcpkg_cmake_configure(
  SOURCE_PATH ${SOURCE_PATH}
  DISABLE_PARALLEL_CONFIGURE
  OPTIONS
    ${SPORE_META_FEATURES}
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