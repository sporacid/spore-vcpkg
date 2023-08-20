vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO sporacid/spore-codegen
  REF b4e4b6863fa68f26bd2ce4cfde8eb7049eab2e1c
  SHA512 bac67d35fb711f58c68dd432ff85308a0791102f69e543865264b9309bd9c7a0d675703011bd28d2c41c5a8ca8ba2fc2f22d0432315c1dee5ce410c00e253317
  HEAD_REF main
)

vcpkg_cmake_configure(
  SOURCE_PATH ${SOURCE_PATH}
  OPTIONS
  -Wno-dev
  -DWITH_TESTS=OFF
  -DWITH_EXAMPLES=OFF
  -DWITH_COMPILE_COMMANDS=OFF
)

vcpkg_cmake_install()

file(
  INSTALL ${SOURCE_PATH}/cmake/spore_codegen.cmake
  DESTINATION ${CURRENT_PACKAGES_DIR}/share/spore
)

vcpkg_cmake_config_fixup(
  PACKAGE_NAME "spore.codegen"
)