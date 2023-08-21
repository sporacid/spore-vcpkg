vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO p-ranav/glob
  REF 8cd16218ae648addf166977d7e41b914768bcb05
  SHA512 a2c7f2c4d43a583d3915d3f9fd0b6e0be48930f455b47c9559cf641352020c545f6d0ddc4ea8f6b8d5a4f54a6cc3b1a05295a6aa5d83a398758b69b12072adcb
  HEAD_REF master
  PATCHES
    0001-fixup-cpm-packages.patch
)

vcpkg_cmake_configure(
  SOURCE_PATH ${SOURCE_PATH}
)

vcpkg_cmake_install()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug")

configure_file(
  "${CMAKE_CURRENT_LIST_DIR}/p-ranav-glob-config.cmake.in"
  "${CURRENT_PACKAGES_DIR}/share/p-ranav-glob/p-ranav-glob-config.cmake"
  @ONLY
)