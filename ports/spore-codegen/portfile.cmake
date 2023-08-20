vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO sporacid/spore-codegen
  REF 4335ccc20bee3e75689337c219da019bc179f92e
  SHA512 52a1e3aa2320d63ebe028db40b8db26ff7b7e5ab67813eaf339e9d994bda7068e47ef940570f7304c0b8f649455d1bc3f51df3205e24522e0c88f6004faf1ab9
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