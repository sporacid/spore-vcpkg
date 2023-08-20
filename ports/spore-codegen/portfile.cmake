vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO sporacid/spore-codegen
  REF 419b54da33430eb94bf8b4e80e42d84382785f6e
  SHA512 cba25a0c666ec7926b64e28826c1894a073342663c85d695e1982f086b63245539e9ce68a0f29ebf574f46aab6189d1fc88fd1c6d3a18882220aa1601b217ca3
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