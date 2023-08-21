vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO sporacid/spore-codegen
  REF 02d0a7a4d24e72feeb1bdaab08ab74f2682e3278
  SHA512 52a1e3aa2320d63ebe028db40b8db26ff7b7e5ab67813eaf339e9d994bda7068e47ef940570f7304c0b8f649455d1bc3f51df3205e24522e0c88f6004faf1ab9
  HEAD_REF main
)

vcpkg_cmake_configure(
  SOURCE_PATH ${SOURCE_PATH}
  OPTIONS
    -DSPORE_BUILD_EXAMPLES=OFF
    -DSPORE_BUILD_TESTS=OFF
    -DSPORE_COMPILE_COMMANDS=OFF
)

vcpkg_cmake_install()

vcpkg_copy_tools(
  TOOL_NAMES spore-codegen
)

file(
  INSTALL ${SOURCE_PATH}/cmake/SporeCodegen.cmake
  DESTINATION ${CURRENT_PACKAGES_DIR}/share/spore
)