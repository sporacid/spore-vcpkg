vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO sporacid/spore-meta
  REF c7823677abae26d478b42fa5568e5fa0ff54c3d5
  SHA512 9ca94ed2b165b00251462b84eff117b57abc79eec077ecb8ab7eadc7e72fd18fa821b15383696daa88cab9010562ad5d88c6c47a889fe0a7c813d5e31af7fbee
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