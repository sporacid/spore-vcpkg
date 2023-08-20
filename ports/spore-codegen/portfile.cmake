vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO sporacid/spore-codegen
  REF 4335ccc20bee3e75689337c219da019bc179f92e
  SHA512 89aa59d0a0ae145c598c4284c62c32eee1cf3b5c82b0d0f1c2422c8986666a6bccc1a6d4581a8bc848ff375721888e1a360cb2ebdfd4b053c73e24d9ba2218c2
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