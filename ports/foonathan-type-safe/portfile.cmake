vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO foonathan/type_safe
  REF 5d7d5df3b2ae919f29f0241ee8d05ffa2d6ea935
  SHA512 349e430ad159b441971607931cb3538059ceab8c419839b000a01fcff3aeda07a5885de12b6a462b58bff71b3dfba48b5cd6377d5a6bf8957c79aa6f9065f889
  HEAD_REF main
)

vcpkg_cmake_configure(
  SOURCE_PATH ${SOURCE_PATH}
)

vcpkg_cmake_install()
vcpkg_cmake_config_fixup()

file(
  REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug/include
)

configure_file(
  "${CMAKE_CURRENT_LIST_DIR}/config.cmake.in"
  "${CURRENT_PACKAGES_DIR}/share/foonathan-type-safe/foonathan-type-safe-config.cmake"
  @ONLY
)

vcpkg_install_copyright(
  FILE_LIST ${SOURCE_PATH}/LICENSE
)