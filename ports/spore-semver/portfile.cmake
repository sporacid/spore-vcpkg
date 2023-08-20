vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO sporacid/spore-semver
  REF c04e4757e21c57c8a84058b4bd6608938a3d9774
  SHA512 0
  # SHA512 7b2bb7acb2a8ff07bff59cfa27247a7b2cced03828919cd65cc0c8cf1f724f5f1e947ed6992dcdbc913fb470694a52613d1861eaaadbf8903e94eb9cdfe4d000
  HEAD_REF main
)

vcpkg_configure_cmake(
  SOURCE_PATH "${SOURCE_PATH}"
  PREFER_NINJA
)

vcpkg_install_cmake()
vcpkg_cmake_config_fixup()
