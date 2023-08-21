vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO sporacid/spore-cmake
  REF 4bcb49ce0ca4faf83fa410ddddf6ed27c6996844
  SHA512 88ab6b1ee9f997bc0dea10e13714c83b8aae1764e60e7acc6e70302239d74a1ce97b2f55f107ab6d0488049311098d542363d5d22b53fe7360d27c019bf9fd73
  HEAD_REF main
)

file(
  INSTALL ${SOURCE_PATH}/cmake/spore_semver.cmake
  DESTINATION ${CURRENT_PACKAGES_DIR}/share/spore
)