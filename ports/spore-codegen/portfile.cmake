vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO sporacid/spore-codegen
  REF 3e6179573aac782efbd2259a96a8809c24d98e6d
  SHA512 93d531db443c0be7eecbad37fa80bb40c948bb9bcc48ee5195ac4ea3bda5525a983c3113c54c7fceb0a8d9bbd045795c0245d5cc6b0b9d1c1007f35bfe9f103e
  HEAD_REF main
)

vcpkg_cmake_configure(
  SOURCE_PATH ${SOURCE_PATH}
  PREFER_NINJA
  OPTIONS
  -Wno-dev
  -DWITH_TESTS=OFF
  -DWITH_EXAMPLES=OFF
  -DWITH_COMPILE_COMMANDS=OFF
)

vcpkg_cmake_install()

file(
  INSTALL ${CMAKE_CURRENT_LIST_DIR}/cmake/spore_codegen.cmake
  DESTINATION ${CURRENT_PACKAGES_DIR}/share/spore/spore_codegen.cmake
)

vcpkg_cmake_config_fixup()