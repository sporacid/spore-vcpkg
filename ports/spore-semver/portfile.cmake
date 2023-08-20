vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO sporacid/spore-semver
  REF c04e4757e21c57c8a84058b4bd6608938a3d9774
  SHA512 9da06c0de41116d752c75a5899aa95762d761c7278ad2aef499f79c32a69ffcfed7206b38f830465a000177bb0779be1cc19547a5c4db20d7dd1065cbc489c5a
  HEAD_REF main
)

vcpkg_cmake_configure(
  SOURCE_PATH "${SOURCE_PATH}"
  PREFER_NINJA
)

vcpkg_cmake_install()
vcpkg_cmake_config_fixup()
