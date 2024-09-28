vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO sporacid/spore-embed
  REF dc82cbe3eeca70d72a86d5c4472cd5e0ec066d52
  SHA512 54a7810717c61926ab43b7163112dfe28096b5bb74417b01add95d7d162a9a1882b69b2d47fb6d6ff097e46978667d0a2f5595be5adbbed87acf8b93d920f24a
  HEAD_REF main
)

vcpkg_cmake_configure(
  SOURCE_PATH ${SOURCE_PATH}
  OPTIONS
    -DCMAKE_BUILD_TYPE=Release
)

vcpkg_cmake_install()

vcpkg_install_copyright(
  FILE_LIST ${SOURCE_PATH}/LICENSE
)

vcpkg_copy_tools(
  TOOL_NAMES spore-embed
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
    DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT}
  )
endif ()