vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO foonathan/cppast
  REF f00df6675d87c6983033d270728c57a55cd3db22
  SHA512 7d045fdbb9b7473f0b082ebb289560111542fa82e7317f8e651d921bd146f30a408725bcab7f4f9079c7bda254a6014c385614b7a6dc22f92ab379508153d53a
  HEAD_REF main
  PATCHES
    0001-fixup-top-level-directory.patch
)

vcpkg_cmake_configure(
  SOURCE_PATH ${SOURCE_PATH}
)

vcpkg_cmake_install()
# vcpkg_cmake_config_fixup()