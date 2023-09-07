vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO bombomby/optick
  REF 8abd28dee1a4034c973a3d32cd1777118e72df7e
  SHA512 d0823634c691c26dfe6f34b26384e50250feac765dd3d6dd19fb243806b74d8d3330ea5c876153462744226fac252d7e546ef4166ec67afdb61b809a16f9da33
  HEAD_REF master
)

vcpkg_cmake_configure(
  SOURCE_PATH "${SOURCE_PATH}"
)

vcpkg_cmake_install()

vcpkg_cmake_config_fixup()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug" "${CURRENT_PACKAGES_DIR}/lib")

vcpkg_copy_pdbs()

file(INSTALL "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)