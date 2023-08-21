vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO foonathan/cppast
  REF f00df6675d87c6983033d270728c57a55cd3db22
  SHA512 7d045fdbb9b7473f0b082ebb289560111542fa82e7317f8e651d921bd146f30a408725bcab7f4f9079c7bda254a6014c385614b7a6dc22f92ab379508153d53a
  HEAD_REF main
  PATCHES
    0001-fixup-top-level-directory.patch
    0002-fixup-tiny-process-library.patch
)

vcpkg_check_linkage(
  ONLY_STATIC_LIBRARY
)

vcpkg_cmake_configure(
  SOURCE_PATH ${SOURCE_PATH}
  OPTIONS
    -DBUILD_SHARED_LIBS=OFF
    -DCPPAST_BUILD_TEST=OFF
    -DCPPAST_BUILD_EXAMPLE=OFF
    -DCPPAST_BUILD_TOOL=OFF
)

vcpkg_cmake_install()

vcpkg_cmake_config_fixup(
  PACKAGE_NAME cppast
  CONFIG_PATH lib/cmake/cppast
)

file(
  REMOVE_RECURSE
  ${CURRENT_PACKAGES_DIR}/lib
  ${CURRENT_PACKAGES_DIR}/debug/lib
  ${CURRENT_PACKAGES_DIR}/debug/include
)

configure_file(
  "${CMAKE_CURRENT_LIST_DIR}/config.cmake.in"
  "${CURRENT_PACKAGES_DIR}/share/foonathan-cppast/foonathan-cppast-config.cmake"
  @ONLY
)

vcpkg_install_copyright(
  FILE_LIST ${SOURCE_PATH}/LICENSE
)