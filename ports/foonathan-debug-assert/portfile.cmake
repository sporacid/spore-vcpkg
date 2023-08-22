vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO foonathan/debug_assert
  REF 7ea47091830eec9a9c6a338c8a29da70494692a5
  SHA512 d0823634c691c26dfe6f34b26384e50250feac765dd3d6dd19fb243806b74d8d3330ea5c876153462744226fac252d7e546ef4166ec67afdb61b809a16f9da33
  HEAD_REF master
)

vcpkg_cmake_configure(
  SOURCE_PATH "${SOURCE_PATH}"
  OPTIONS
    -DDEBUG_ASSERT_INSTALL=ON
)

vcpkg_cmake_install()

vcpkg_cmake_config_fixup(CONFIG_PATH lib/cmake/debug_assert PACKAGE_NAME debug_assert)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug" "${CURRENT_PACKAGES_DIR}/lib")

vcpkg_copy_pdbs()

file(INSTALL "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)