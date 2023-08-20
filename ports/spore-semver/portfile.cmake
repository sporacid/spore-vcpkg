vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO sporacid/spore-semver
  REF 29039a57b06e43cb58a1d8cb0eee50a5ef9fe10e
  SHA512 e4bf8f92fa6a3c8abba02c9f583ccf092825a5bd23c2bd7faaa5a57d99ecc36e9c87eb94939b661d3f1871bb0ccee5d17438257eb5e350118ffaea7af5bfc836
  HEAD_REF main
)

file(
  INSTALL ${SOURCE_PATH}/cmake/spore_semver.cmake
  DESTINATION ${CURRENT_PACKAGES_DIR}/share/spore
)