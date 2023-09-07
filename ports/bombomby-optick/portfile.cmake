vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO bombomby/optick
  REF 8abd28dee1a4034c973a3d32cd1777118e72df7e
  SHA512 81e55c41b81f848049253986ae2d53ec693b06d023b4ec90b7e280432b2c2abb643d4fe3069b3d939eb40cdc9a0c2ad0bb7210963d41c6243b3f89b0787ee196
  HEAD_REF master
)

vcpkg_cmake_configure(
  SOURCE_PATH "${SOURCE_PATH}"
)

vcpkg_cmake_install()

vcpkg_cmake_config_fixup(
  CONFIG_PATH lib/cmake/Optick
  PACKAGE_NAME Optick
)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug")

vcpkg_copy_pdbs()

file(INSTALL "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)