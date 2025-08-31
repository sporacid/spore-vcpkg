vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO sporacid/spore-meta
  REF 2dfa7e10f6e383b3ce2821729ba32b5741f97b35
  SHA512 46a9f43aab33d2bb70d9ce52278cc7b43a5af635bffed44651d9e1854af67a67c2a2dec0b1b56b24668a7e6fd6ed230735cebfa6fd04b7cfea7b82de18adcb65
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