vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO microsoft/PixEvents
  REF 3a7e70dde7bf54f02f9d2e9dd6d3350c6cfb962f
  SHA512 91b7a2f8c83d8e848ec89866e8f30092a1e49f5d327fd5dd972bdb6f8848cef28fd135f6304df0811241a95f379089853edf98c451dc680fc6d7838a8be8edd1
  HEAD_REF main
)

vcpkg_msbuild_install(
  SOURCE_PATH "${SOURCE_PATH}"
  PROJECT_SUBPATH PixEvents.sln
)

configure_file(
  ${CMAKE_CURRENT_LIST_DIR}/config.cmake.in
  ${CURRENT_PACKAGES_DIR}/share/microsoft-pix/microsoft-pix-config.cmake
  @ONLY
)

vcpkg_copy_pdbs()

file(
  GLOB_RECURSE HEADER_FILES
  ${SOURCE_PATH}/include/**.h
)

file(
    GLOB_RECURSE LIBRARY_FILES
    ${SOURCE_PATH}/output/**/WinPixEventRuntime/**.lib
)

file(
    GLOB_RECURSE BINARY_FILES
    ${SOURCE_PATH}/output/**/WinPixEventRuntime/**.exe
    ${SOURCE_PATH}/output/**/WinPixEventRuntime/**.dll
    ${SOURCE_PATH}/output/**/WinPixEventRuntime/**.pdb
)

file(
  INSTALL ${HEADER_FILES}
  DESTINATION ${CURRENT_PACKAGES_DIR}/include
)

file(
  INSTALL ${LIBRARY_FILES}
  DESTINATION ${CURRENT_PACKAGES_DIR}/lib
)

file(
  INSTALL ${BINARY_FILES}
  DESTINATION ${CURRENT_PACKAGES_DIR}/bin
)

vcpkg_install_copyright(
  FILE_LIST
  ${SOURCE_PATH}/LICENSE.txt
)
