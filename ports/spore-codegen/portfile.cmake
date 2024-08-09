vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO sporacid/spore-codegen
  REF f6c1955ac62230a39b7ffc72d668ac5a3ad8a105
  SHA512 f44ac2b92b9275664ee419460959aac906d21a4893f0809034927a0ca3461ae769b76c5ed4fbbc8f73656136229c004ec03684a7cd0ed24a26c718e86f2db9a3
  HEAD_REF main
)

vcpkg_cmake_configure(
  SOURCE_PATH ${SOURCE_PATH}
  OPTIONS
    -DCMAKE_BUILD_TYPE=Release
    -DSPORE_BUILD_EXAMPLES=OFF
    -DSPORE_BUILD_TESTS=OFF
)

vcpkg_cmake_install()

vcpkg_install_copyright(
  FILE_LIST ${SOURCE_PATH}/LICENSE
)

vcpkg_copy_tools(
  TOOL_NAMES spore-codegen
  AUTO_CLEAN
)

configure_file(
  ${CMAKE_CURRENT_LIST_DIR}/config.cmake.in
  ${CURRENT_PACKAGES_DIR}/share/${PORT}/${PORT}-config.cmake
  @ONLY
)

file(
  INSTALL ${SOURCE_PATH}/cmake/
  DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT}
)

file(
  INSTALL ${CMAKE_CURRENT_LIST_DIR}/usage
  DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT}
)

file(
  REMOVE_RECURSE
    ${CURRENT_PACKAGES_DIR}/cmake
    ${CURRENT_PACKAGES_DIR}/debug
)

if (EXISTS ${SOURCE_PATH}/VERSION)
  file(
    INSTALL ${SOURCE_PATH}/VERSION
    DESTINATION ${CURRENT_PACKAGES_DIR}/VERSION
  )
endif ()