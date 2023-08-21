vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO sporacid/spore-cmake
  REF 4bcb49ce0ca4faf83fa410ddddf6ed27c6996844
  SHA512 8f33a5414ed524cd7a765b77c363984b19050f43bf331a97257b545b6c6767001bb90652fd86e9caee516c7b45d9c2c1caeb4079dd88784d4c1ed3e6efdc0474
  HEAD_REF main
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
