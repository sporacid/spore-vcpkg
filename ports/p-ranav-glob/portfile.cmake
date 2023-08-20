vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO p-ranav/glob
  REF 8cd16218ae648addf166977d7e41b914768bcb05
  SHA512 52a1e3aa2320d63ebe028db40b8db26ff7b7e5ab67813eaf339e9d994bda7068e47ef940570f7304c0b8f649455d1bc3f51df3205e24522e0c88f6004faf1ab9
  HEAD_REF master
)

vcpkg_cmake_configure(
  SOURCE_PATH ${SOURCE_PATH}
)

vcpkg_cmake_install()
vcpkg_cmake_config_fixup()