vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO foonathan/debug_assert
  REF 7ea47091830eec9a9c6a338c8a29da70494692a5
  SHA512 16cf38406d5f71585b763ff8af59b09c7b8b05372b07714cdc82f6f27292597c0b6d9025f823515744f8235b326b95e1d630af34db4a0e15d4ded79364290630
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